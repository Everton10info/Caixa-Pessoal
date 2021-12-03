import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListTransactionsView extends StatelessWidget {
  const ListTransactionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
      ),
    body: Container(height: Get.height,),
    );
  }
}
