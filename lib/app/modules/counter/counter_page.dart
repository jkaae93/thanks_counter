import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './counter_controller.dart';

class CounterPage extends GetView<CounterController> {
  const CounterPage({Key? key}) : super(key: key);
  static Map<int, bool> list = {
    0: false,
    1: false,
    2: false,
  };

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
            return ListView(
              children: [
                ExpansionPanelList(
                  expansionCallback: (panelIndex, isExpanded) {
                    list[panelIndex] = isExpanded;
                    c.update();
                  },
                  children: [
                    ExpansionPanel(
                      canTapOnHeader: true,
                      headerBuilder: (c, f) => const Text(
                        'Best thanks board',
                        style: TextStyle(fontSize: 20),
                      ),
                      body: SelectableText(c.getAuthors()),
                      isExpanded: list[0] ?? false,
                    ),
                    ExpansionPanel(
                      canTapOnHeader: true,
                      headerBuilder: (c, f) => const Text(
                        'Best thanks Emotion',
                        style: TextStyle(fontSize: 20),
                      ),
                      body: SelectableText(c.getEmo()),
                      isExpanded: list[1] ?? false,
                    ),
                    ExpansionPanel(
                      canTapOnHeader: true,
                      headerBuilder: (c, f) => const Text(
                        'Best thanks Mention',
                        style: TextStyle(fontSize: 20),
                      ),
                      body: SelectableText(c.getMentions()),
                      isExpanded: list[2] ?? false,
                    ),
                  ],
                ),
              ],
            );
          }),
    );
  }
}
