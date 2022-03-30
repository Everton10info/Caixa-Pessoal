import 'package:cash_book/componets/dialogForm.dart';
import 'package:cash_book/componets/dialog_edition.dart';
import 'package:cash_book/componets/myDrawer.dart';
import 'package:cash_book/controllers/controllersList.dart';
import 'package:cash_book/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class ListTransactionsOutputs extends StatelessWidget {
ListTransactionsOutputs(){
 // listTrController.populand();
}

  final listTrController = Get.find<ListTrController>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown,DeviceOrientation.portraitUp,]);
     return Obx(() => Scaffold(
        appBar: AppBar(
          title: Text('Total: R\$: ${listTrController.totalOutput.value.toStringAsFixed(2)}'),
          elevation: 3,
        ),
        body: Container(
          color: Color.fromARGB(255, 228, 243, 228),
          child: Obx(
            () => ListView.builder(
              itemCount: listTrController.transactionOutput.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  direction: DismissDirection.horizontal,
                  onDismissed: (direction){
                      listTrController.removeTransaction(
                                        listTrController.transactionOutput[index].id!);
                                    listTrController.transactionOutput.removeAt(index);
                  },
                  
                   background: Container(
                     height: Get.height * 0.16,
                color: Colors.transparent,
                child: Align( 
                alignment: Alignment.center, 
                   child: Icon(Icons.delete, color: Colors.red,size: 50,),
                 ),
                ),
                  key: ValueKey(listTrController.transactionOutput[index]),
                  child: ListTile(
                    title: Container(
                     
              width: Get.width *8,
                      height: Get.height * 0.16,
                      
                
                      child: InkWell(
                         onDoubleTap: () {
                          listTrController.setEdition(
                            listTrController.transactionOutput[index].nameTransaction,
                            listTrController.transactionOutput[index].typeTransaction,
                            listTrController.transactionOutput[index].dueDate,
                            listTrController.transactionOutput[index].valor,
                            listTrController.transactionOutput[index].id!,
                            
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
                                      '${listTrController.transactionOutput[index].nameTransaction}  ',
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
                                            listTrController.transactionOutput[index].valor
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
                                    listTrController.pay(
                                        listTrController.transactionOutput[index].id!,);
                                    
                                  },
                                  tooltip: 'Pago? ok',
                                  icon: Icon(
                                    Icons.check,
                                    color:listTrController.payYes.contains( '${listTrController.transactionTimeEnd[index].id}')? Color.fromARGB(255, 22, 167, 17):Color.fromARGB(255, 184, 48, 7),
                                    size: 34,
                                  ),
                                )
                                ],
                              ),
                              Container(
                                  margin: EdgeInsets.only(left: 2.5, right: 2.5),
                                height: Get.height * 0.045,
                                color: listTrController.payYes.contains( '${listTrController.transactionOutput[index].id}')?Color.fromARGB(255, 0, 170, 192):Color.fromARGB(255, 241, 168, 58),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        ' Registrado:\n ${DateFormat('dd/MM/yyyy').format(listTrController.transactionOutput[index].date)} ',
                                        style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontSize: 13,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Text(
                                        ' Vencimento: \n ${DateFormat('dd/MM/yyyy').format(listTrController.transactionOutput[index].dueDate)} ',
                                        style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: listTrController.payYes.contains( '${listTrController.transactionOutput[index].id}')?Colors.white: Color.fromARGB(255, 133, 32, 1),
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
