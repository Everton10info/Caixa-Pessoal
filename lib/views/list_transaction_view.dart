import 'package:cash_book/componets/dialogForm.dart';
import 'package:cash_book/controllers/controllers.dart';
import 'package:cash_book/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            margin:EdgeInsetsDirectional.all(2),
                elevation: 5,
                borderOnForeground: true,
                color: Colors.blue,
                child: SizedBox(
                  child: Container(
                 
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                      
                        Text(listTrController.transactionAll[index].nameTransaction.toString()),
                        Divider(),
                        Text(listTrController.transactionAll[index].value.toString()),
                      ],
                    ),
                  ),
                ),
              /*   child: Text(
                    listTrController.transactionAll[index].nameTransaction.toString()), */
              ),
            );
          },
        ),
      )),
      drawer: Drawer(
        elevation: 2,
        child: ListView(
          padding: EdgeInsets.all(9),
          children: [
            ListTile(
              selectedTileColor: Colors.blueGrey,
              title: Text('Listas'),
              onTap: () {
                Get.to(ListTransactionsView());
              },
            )
          ],
        ),
      ),
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
