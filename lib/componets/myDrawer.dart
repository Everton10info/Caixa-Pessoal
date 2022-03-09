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
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          color: Colors.blueGrey[300],
          child: ListView(
            padding: EdgeInsets.all(9),
            children: [
              ListTile(
                selectedTileColor: Colors.blueGrey[800],
                title: Text('Listas', style: TextStyle(color: Colors.white, fontSize: 17,
                                    fontWeight: FontWeight.w700 ),),
                onTap: () {
                  Get.to(
                    () => ListTransactionsView(),
                  );
                },
              ),
              ListTile(
                selectedTileColor: Colors.blueGrey[800],
                title: Text('Listas de Entradas',style: TextStyle(color: Colors.white, fontSize: 17,
                                    fontWeight: FontWeight.w700 ),),
                onTap: () {
                  Get.to(
                    () => ListTransactionsInput(),
                  );
                },
              ),
              ListTile(
                selectedTileColor: Colors.blueGrey[800],
                title: Text('Listas de Despesas',style: TextStyle(color: Colors.white, fontSize: 17,
                                    fontWeight: FontWeight.w700 ),),
                onTap: () {
                  Get.to(
                    () => ListTransactionsOutputs(),
                  );
                },
              ),
              ListTile(
                selectedTileColor: Colors.blueGrey[800],
                title: Text('HOME',style: TextStyle(color: Colors.white, fontSize: 17,
                                    fontWeight: FontWeight.w700 ),),
                onTap: () {
                  Get.back();
                  Get.to(
                    () => MyHome(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
