import 'package:cash_book/views/home.dart';
import 'package:cash_book/views/list_transaction_all.dart';
import 'package:cash_book/views/list_transactions_input.dart';
import 'package:cash_book/views/list_transactions_output.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 2,
      child: ListView(
        padding: EdgeInsets.all(9),
        children: [
          ListTile(
            selectedTileColor: Colors.blueGrey,
            title: Text('Listas'),
            onTap: () {
              Get.to(
                () => ListTransactionsView(),
              );
            },
          ),
          ListTile(
            selectedTileColor: Colors.blueGrey,
            title: Text('Listas de Entradas'),
            onTap: () {
              Get.to(
                () => ListTransactionsInput(),
              );
            },
          ),
          ListTile(
            selectedTileColor: Colors.blueGrey,
            title: Text('Listas de Despesas'),
            onTap: () {
              Get.to(
                () => ListTransactionsOutputs(),
              );
            },
          ),
          ListTile(
            selectedTileColor: Colors.blueGrey,
            title: Text('HOME'),
            onTap: () {
              Get.to(
                () => MyHome(),
              );
            },
          ),
        ],
      ),
    );
  }
}
