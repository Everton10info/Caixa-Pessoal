import 'package:cash_book/componets/dialogForm.dart';
import 'package:cash_book/componets/myDrawer.dart';
import 'package:cash_book/controllers/controllersList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home.dart';

// ignore: must_be_immutable
class ListTransactionsView extends StatelessWidget {
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
          itemCount: listTrController.transactionAll.length,
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
                            .transactionAll[index].nameTransaction
                            .toString()),
                        Divider(),
                        Text(listTrController.transactionAll[index].value
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
      drawer: MyDrawer(),
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
