import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/demo_controller.dart';

class DemoScreen extends GetView<DemoController> {
  const DemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() => Text(controller.counter.value.toString())),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 16, backgroundColor: Colors.blue),
              onPressed: () => controller.increment(),
              child: Text('Increment'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 16, backgroundColor: Colors.blue),
              onPressed: () => controller.decrement(),
              child: Text('Decrement'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 16, backgroundColor: Colors.blue),
              onPressed: () => controller.onPressedOnBoardScreen(),
              child: Text('Push to OnBoardScreen'),
            )
          ],
        ),
      ),
    );
  }
}
