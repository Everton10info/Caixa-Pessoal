import 'package:cash_book/componets/dialogForm.dart';
import 'package:cash_book/controllers/controllers.dart';
import 'package:cash_book/models/transaction_model.dart';

import 'package:cash_book/views/list_transaction_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHome extends StatelessWidget {
  final ListTrController listTrController = Get.put(ListTrController());
  final Transaction transaction = Get.put(Transaction());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        title: Center(
          child: Text(
            "Cash Book",
          ),
        ),
      ),
      backgroundColor: Colors.blueGrey[100],
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/illustration.jpeg'),
            fit: BoxFit.cover,
          ),
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
      drawer: Drawer(
        elevation: 2,
        child: ListView(
          padding: EdgeInsets.all(9),
          children: [
            ListTile(
              title: Text('Listas'),
              onTap: () {
                Get.back();
               Get.to(ListTransactionsView());
               
              },
            )
          ],
        ),
      ),
    );
  }
}
