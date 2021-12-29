import 'dart:io';

import 'package:cash_book/componets/dialogForm.dart';
import 'package:cash_book/componets/myDrawer.dart';
import 'package:cash_book/controllers/controllersList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class ListTransactionsView extends StatelessWidget {
  final listTrController = Get.find<ListTrController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ENTRADAS E SAÍDAS'),
        elevation: 3,
      ),
      body: Container(
        color: Colors.blueGrey,
          child: Obx(
        () => ListView.builder(
          itemCount: listTrController.transactionAll.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Card(
                elevation: 13,
                child: Container(
                  alignment: Alignment.center,
                  height: Get.height * 0.17,
                  padding: EdgeInsets.all(7),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: SizedBox(
                                width: 100,
                                height: 65,
                                child: Text(
                                  listTrController
                                      .transactionAll[index].nameTransaction
                                      .toString()
                                      .toUpperCase(),
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 90,
                            height: 80,
                            alignment: Alignment.center,
                            child: Text(
                              'VALOR:\n R\$ ' +
                                  listTrController.transactionAll[index].value
                                      .toStringAsFixed(2),
                              textAlign: TextAlign.center,
                              maxLines: 4,
                              style: TextStyle(
                                color: Colors.blue[800],
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          IconButton(
                            alignment: Alignment.centerRight,
                            onPressed: () {
                              int id =
                                  listTrController.transactionAll[index].id;
                              double v =
                                  listTrController.transactionAll[index].value;
                              if (listTrController
                                      .transactionAll[index].typeTransaction ==
                                  'output') {
                                listTrController.removeTrasactionOutput(id, v);
                              } else if (listTrController
                                      .transactionAll[index].typeTransaction ==
                                  'input') {
                                listTrController.removeTrasactionInput(id, v);
                              }
                            },
                            icon: Icon(
                              Icons.delete_forever_outlined,
                              size: 36,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Lançado em: ${DateFormat('dd/MM/yyyy').format(listTrController.transactionAll[index].date)}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      )),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_business),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(child: DialogFrom());
              },);
        },
      ),
    );
  }
}
