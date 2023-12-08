import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './counter_controller.dart';

class CounterPage extends GetView<CounterController> {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CounterPage'),
      ),
      body: GetBuilder<CounterController>(
          init: CounterController(),
          initState: (state) {},
          builder: (c) {
            return ExpansionPanelList(
              children: [
                ExpansionPanel(
                  headerBuilder: (c, f) => const Text(
                    'Best thanks board',
                    style: TextStyle(fontSize: 20),
                  ),
                  body: SelectableText(c.getAuthors()),
                ),
                ExpansionPanel(
                  headerBuilder: (c, f) => const Text(
                    'Best thanks Emotion',
                    style: TextStyle(fontSize: 20),
                  ),
                  body: SelectableText(c.getEmo()),
                ),
                ExpansionPanel(
                  headerBuilder: (c, f) => const Text(
                    'Best thanks Mention',
                    style: TextStyle(fontSize: 20),
                  ),
                  body: SelectableText(c.getMentions()),
                ),
              ],
            );
          }),
    );
  }
}
