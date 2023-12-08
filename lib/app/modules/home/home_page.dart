import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thanks_counter/app/modules/counter/counter_controller.dart';
import 'package:thanks_counter/app/modules/counter/counter_page.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Please upload to json file.',
              style: TextStyle(fontSize: 20),
            ),
            TextButton(
              onPressed: () async {
                FilePickerResult? ret = await FilePicker.platform.pickFiles();
                try {
                  File file = File(ret!.files.single.path!);
                  if (file.path.split(',').last.contains('json')) {
                    String loaded = await file.readAsString();
                    Get.put<CounterController>(CounterController());
                    Get.find<CounterController>().init(file: loaded);
                    Get.to(() => const CounterPage());
                  } else {
                    throw Exception('File format is wrong. please upload only \'.json\'');
                  }
                } catch (e) {
                  Get.showSnackbar(
                    GetSnackBar(
                      title: 'Error',
                      message: 'Somthing was wrong.... \nError: $e',
                      duration: const Duration(seconds: 10),
                    ),
                  );
                }
              },
              child: const Text('upload'),
            ),
          ],
        ),
      ),
    );
  }
}
