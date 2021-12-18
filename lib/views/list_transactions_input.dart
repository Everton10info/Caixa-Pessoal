import 'package:cash_book/componets/dialogForm.dart';
import 'package:cash_book/componets/myDrawer.dart';
import 'package:cash_book/controllers/controllersList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home.dart';
import 'list_transaction_all.dart';

// ignore: must_be_immutable
class ListTransactionsInput extends StatelessWidget {
  final listTrController = Get.find<ListTrController>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
      ),
      body: Container(
          child: Obx(
        () => ListView.builder(
          itemCount: listTrController.transactionInput.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Card(
                margin: EdgeInsetsDirectional.all(2),
                elevation: 5,
                borderOnForeground: true,
                color: Colors.blue,
                child: SizedBox(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(listTrController
                            .transactionInput[index].nameTransaction
                            .toString()),
                        Divider(),
                        Text(listTrController.transactionInput[index].value
                            .toString()),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      )),
      drawer:MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(child: DialogFrom());
              });
        },
      ),
    );
  }
}
