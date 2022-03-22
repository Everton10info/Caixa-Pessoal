import 'package:cash_book/componets/dialogForm.dart';

import 'package:cash_book/componets/myDrawer.dart';
import 'package:cash_book/controllers/controllersList.dart';
import 'package:cash_book/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class ListTransactionsView extends StatelessWidget {
  final listTrController = Get.find<ListTrController>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text('Total: R\$: ${listTrController.sumTotal.value.toStringAsFixed(2)}'),
          elevation: 3,
        ),
        body: Container(
          color: Color.fromARGB(255, 212, 235, 212),
          child: Obx(
            () => ListView.builder(
              itemCount: listTrController.transactionAll.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  direction: DismissDirection.horizontal,
                  onDismissed: (direction) {
                    listTrController
                        .removeTransaction(listTrController.transactionAll[index].id!);
                    listTrController.transactionAll.removeAt(index);
                  },
                  background: Container(
                    height: Get.height * 0.16,
                    color: Colors.transparent,
                    child: Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 60, //mudar todos
                      ),
                    ),
                  ),
                  key: ValueKey(listTrController.transactionAll[index]),
                  child: ListTile(
                    title: Container(
                      height: Get.height * 0.19,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: const BorderRadius.all(
                          Radius.circular(18.0),
                        )),
                        elevation: 13,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  margin: EdgeInsets.all(1.5),
                                  child: InkWell(
                                    onTap: () {
                                      listTrController.setEdition(
                                        listTrController.transactionAll[index].nameTransaction,
                                        listTrController.transactionAll[index].typeTransaction,
                                        listTrController.transactionAll[index].dueDate,
                                        listTrController.transactionAll[index].valor,
                                        listTrController.transactionAll[index].id!,
                                      );

                                      showDialog(
                                         barrierColor:  Colors.blueGrey.withOpacity(0.5),
                                        context: context,
                                        builder: (_) => AlertDialog(
                                          backgroundColor: Colors.black12.withOpacity(0.3),
                                          content: Container(
                                            decoration: BoxDecoration(borderRadius:  BorderRadius.all(Radius.circular(85))),
                                            width: 30,
                                            height: Get.height * 0.12,
                                            child: Column(
                                              children: [
                                                TextFormField(
                                                  controller:
                                                      listTrController.controllerNameEdition =
                                                          TextEditingController(
                                                    text: listTrController
                                                        .transactionAll[index].nameTransaction
                                                        .toString(),
                                                  ),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    listTrController.editionUpdate(
                                                        listTrController.trUpdate);

                                                    Get.back();
                                                  },
                                                  child: Text('save edit'),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        barrierDismissible: true,
                                      );
                                    },
                                    child: Text(
                                      '${listTrController.transactionAll[index].nameTransaction}  ',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.edit,
                                    size: 22,
                                    color: Color.fromARGB(255, 8, 208, 235),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.all(5),
                                  height: Get.height * 0.04,
                                  decoration: BoxDecoration(
                                      color: Colors.cyan[50],
                                      borderRadius: BorderRadius.circular(50)),
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
                                  alignment: Alignment.center,
                                  onPressed: () {
                                    listTrController.removeTransaction(
                                        listTrController.transactionAll[index].id!);
                                    listTrController.transactionAll.removeAt(index);
                                  },
                                  icon: Icon(
                                    Icons.delete_sweep,
                                    size: 35,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 2.5, right: 2.5),
                              height: Get.height * 0.045,
                              color: Color.fromARGB(255, 0, 170, 192),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      ' Cadastro:\n ${DateFormat('dd/MM/yyyy').format(listTrController.transactionAll[index].date)} ',
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontSize: 13,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    listTrController.transactionAll[index].typeTransaction ==
                                            'input'
                                        ? InkWell(
                                            onTap: () {
                                              listTrController.setEdition(
                                                listTrController
                                                    .transactionAll[index].nameTransaction,
                                                listTrController
                                                    .transactionAll[index].typeTransaction,
                                                listTrController.transactionAll[index].dueDate,
                                                listTrController.transactionAll[index].valor,
                                                listTrController.transactionAll[index].id!,
                                              );

                                              showDialog(
                                                barrierColor:  Colors.blueGrey.withOpacity(0.5),
                                              
                                                context: context,
                                                builder: (_) => AlertDialog(
                                                  backgroundColor: Color.fromARGB(255, 69, 138, 104).withOpacity(0.5),
                                                  content: Container(
                                                    decoration: BoxDecoration(borderRadius:  BorderRadius.all(Radius.circular(45))),
                                                    width: 40,
                                                    height: Get.height * 0.17,
                                                    child: Column(
                                                      children: [
                                                        TextButton(
                                                            onPressed: () {
                                                              DatePicker.showDatePicker(
                                                                  context,
                                                                  showTitleActions: true,
                                                                  minTime:
                                                                      DateTime(2020, 1, 1),
                                                
                                                                  // maxTime: DateTime(2025, 1, 1),
                                                                  //print('change $date');
                                                                  currentTime:listTrController.transactionAll[index].dueDate,
                                                                  onConfirm: (date) {
                                                                print('confirm $date');
                                                                listTrController.dueEd= date ;
                                                              }, locale: LocaleType.pt);
                                                            },
                                                            child: Text(
                                                              'Alterar Vencimento ou Lançamento?  ',
                                                              style: TextStyle(
                                                                  color: Color.fromARGB(255, 240, 78, 78)),
                                                            )),
                                                        /* TextFormField(
                                                  controller:
                                                      listTrController.controllerNameEdition =
                                                          TextEditingController(
                                                    text: listTrController
                                                        .transactionAll[index].nameTransaction
                                                        .toString(),
                                                  ),
                                                ),  */

                                                 
                                                        TextButton(
                                                          onPressed: () {
                                                            listTrController.editionUpdate(
                                                                listTrController.trUpdate);

                                                            Get.back();
                                                          },
                                                          child: Text('Save '),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                barrierDismissible: true,
                                              );
                                            },
                                            child: Text(
                                              ' Registrado: \n ${DateFormat('dd/MM/yyyy').format(listTrController.transactionAll[index].dueDate)} ',
                                              style: TextStyle(
                                                fontStyle: FontStyle.italic,
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(255, 111, 238, 8),
                                              ),
                                            ),
                                          )
                                        : Text(
                                            ' Vencimento: \n ${DateFormat('dd/MM/yyyy').format(listTrController.transactionAll[index].dueDate)} ',
                                            style: TextStyle(
                                              fontStyle: FontStyle.italic,
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(255, 184, 48, 7),
                                            ),
                                          )
                                  ]),
                            ),
                          ],
                        ),
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
          backgroundColor: Color.fromARGB(255, 41, 236, 142),
          child: Icon(Icons.add_task),
          focusElevation: 50,
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
