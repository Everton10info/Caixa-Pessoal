import 'package:cash_book/componets/dialogForm.dart';
import 'package:cash_book/componets/myDrawer.dart';
import 'package:cash_book/controllers/controllersList.dart';
import 'package:cash_book/models/transaction_model.dart';

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
        title: Container(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
            children:[ Text("LIVRO CAIXA",
            style:TextStyle(),
              
            ),
            ]),
        ),
      ),
      backgroundColor: Colors.blueGrey[400],
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/illustration.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
         child: Icon(Icons.add_business),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(child: DialogFrom());
              });
        },
      ),
      drawer: MyDrawer(),
    );
  }
}
