import 'package:cash_book/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'second.dart';

void main() => runApp(GetMaterialApp(home: Home()));

class Home extends StatelessWidget {
  final controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<Controller>(
              builder: (_) => Text("Cliks: ${controller.count}"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(Second());
              },
              child: Text('Next Route'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.increment();
        },
        child: Icon(Icons.account_balance),
      ),
    );
  }
}
