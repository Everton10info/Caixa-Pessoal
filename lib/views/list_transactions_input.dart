import 'package:cash_book/componets/dialogForm.dart';
import 'package:cash_book/componets/dialog_edition.dart';
import 'package:cash_book/componets/myDrawer.dart';
import 'package:cash_book/controllers/controllersList.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class ListTransactionsInput extends StatelessWidget {

  ListTransactionsInput(){
 
;   // listTrController.populand();
  }
  final listTrController = Get.find<ListTrController>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown,DeviceOrientation.portraitUp,]);
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text('Total: R\$: ${listTrController.totalInput.value.toStringAsFixed(2)}'),
          elevation: 3,
        ),
        body: Container(
          color: Color.fromARGB(255, 228, 243, 228),
          child: Obx(
            () => ListView.builder(
              itemCount: listTrController.transactionInput.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  direction: DismissDirection.horizontal,
                  onDismissed: (direction){
                      listTrController.removeTransaction(
                                        listTrController.transactionInput[index].id!);
                                    listTrController.transactionInput.removeAt(index);
                  },
                  
                   background: Container(
                       height: Get.height * 0.16,
                color: Colors.transparent,
                child: Align( 
                 alignment: Alignment.center, 
                   child: Icon(Icons.delete, color: Colors.red,size: 50,),
                 ),
                ),
                  key: ValueKey(listTrController.transactionInput[index]),
                  child: ListTile(
                    title: Container(
                    
                width: Get.width *10,
                      height: Get.height * 0.16,
                      
            
                      child: InkWell(
                         onDoubleTap: () {
                          listTrController.setEdition(
                            listTrController.transactionInput[index].nameTransaction,
                            listTrController.transactionInput[index].typeTransaction,
                            listTrController.transactionInput[index].dueDate,
                            listTrController.transactionInput[index].valor,
                            listTrController.transactionInput[index].id!,
                             
                          );

                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(child: DialogEdition());
                            },
                          );
                        },
                        child: Card(
                         
                          shape: RoundedRectangleBorder(
                              borderRadius: const BorderRadius.all(
                            Radius.circular(18.0),
                          )),
                          elevation: 13,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                   margin: EdgeInsets.all(3),
                                    child: Text(
                                      '${listTrController.transactionInput[index].nameTransaction}  ',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        color: Colors.white,
                                    
                                      ),
                                    ),
                                  ),
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
                                            listTrController.transactionInput[index].valor
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
                                          listTrController.transactionInput[index].id!);
                                      listTrController.transactionInput.removeAt(index);
                                    },
                                    icon: Icon(
                                      Icons.delete_sweep_rounded,
                                      size: 34,
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
                                        ' Registrado:\n ${DateFormat('dd/MM/yyyy').format(listTrController.transactionInput[index].date)} ',
                                        style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontSize: 13,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Text(
                                        ' Entrada: \n ${DateFormat('dd/MM/yyyy').format(listTrController.transactionInput[index].dueDate)} ',
                                        style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                           color: Color.fromARGB(255, 111, 238, 8),
                                        ),
                                      ),
                                    ]),
                              ),
                            ],
                          ),
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
                });
          },
        ),
      ),
    );
  }
}
