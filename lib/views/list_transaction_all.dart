import 'package:cash_book/componets/dialogForm.dart';
import 'package:cash_book/componets/myDrawer.dart';
import 'package:cash_book/controllers/controllersList.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class ListTransactionsView extends StatelessWidget {

  final listTrController = Get.find<ListTrController>();

  @override
  Widget build(BuildContext context) {
     
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text('Total: R\$: ${listTrController.sumTotal.value.toStringAsFixed(2)}'),
          elevation: 3,
        ),
        body: Container(
          color: Colors.blueGrey[300],
          child: Obx(
            () => ListView.builder(
              itemCount: listTrController.transactionAll.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Card(
                    elevation: 13,
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                      height: Get.height * 0.15,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Text(
                                  listTrController.transactionAll[index].nameTransaction
                                     .toString(),
                                     
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20, 
                                    
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.cyan[50],
                                    borderRadius: BorderRadius.circular(13)),
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    ' R\$ ' +
                                        listTrController.transactionAll[index].valor
                                            .toStringAsFixed(2),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.deepOrange[600],
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                alignment: Alignment.centerRight,
                                onPressed: () {
                                  listTrController.removeTransaction(
                                      listTrController.transactionAll[index].id!);
                                  listTrController.transactionAll.removeAt(index);
                                 
                                },
                                icon: Icon(
                                  Icons.delete_sweep_rounded,
                                  size: 34,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 22,
                            color: Colors.blue[400],
                            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                              Container(
                                child: Text(
                                  ' Lançado em :${DateFormat('dd/MM/yyyy').format(listTrController.transactionAll[index].date)} ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        drawer: MyDrawer(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_business),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(child: DialogFrom());
              },
            );
          },
        ),
      ),
    );
  }
}
