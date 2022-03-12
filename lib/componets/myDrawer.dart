import 'package:cash_book/views/coming_time.dart';
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
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 15, 5, 10),
      child: Drawer(
        
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Container(
            color: Color.fromARGB(255, 192, 206, 211),
            child: ListView(
              padding: EdgeInsets.all(2),
              children: [
                ListTile(
                  selectedTileColor: Color.fromARGB(255, 0, 82, 97),
                  title: Text(
                    'Listas',
                    style: TextStyle(
                        color: Colors.black, fontSize: 23, ),
                  ),
                  onTap: () {
                    Get.to(
                      () => ListTransactionsView(),
                    );
                  },
                ),
                ListTile(
                  selectedTileColor: Color.fromARGB(255, 0, 82, 97),
                  title: Text(
                    'Listas de Entradas',
                    style: TextStyle(
                        color: Colors.black, fontSize: 20, ),
                  ),
                  onTap: () {
                    Get.to(
                      () => ListTransactionsInput(),
                    );
                  },
                ),
                ListTile(
                  selectedTileColor: Color.fromARGB(255, 0, 82, 97),
                  title: Text(
                    'Listas de Despesas',
                    style: TextStyle(
                        color: Colors.black, fontSize:20 ),
                  ),
                  onTap: () {
                    Get.to(
                      () => ListTransactionsOutputs(),
                    );
                  },
                ),
                ListTile(
                  selectedTileColor: Color.fromARGB(255, 0, 82, 97),
                  title: Text(
                    'Contas a vencer',
                    style: TextStyle(
                        color: Colors.black, fontSize: 20, ),
                  ),
                  onTap: () {
                    Get.back();
                    Get.to(
                      () => ListComingTime(),
                    );
                  },
                ),
                ListTile(
                  selectedTileColor: Color.fromARGB(255, 0, 82, 97),
                  title: Text(
                    'HOME',
                    style: TextStyle(
                        color: Colors.black, fontSize: 20, ),
                  ),
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
      ),
    );
  }
}
