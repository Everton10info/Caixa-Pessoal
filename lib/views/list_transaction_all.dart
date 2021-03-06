import 'package:cash_book/Controllers/controller_list.dart';
import 'package:cash_book/components/dialog_form.dart';
import 'package:cash_book/components/dialog_edition.dart';

import 'package:cash_book/components/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class ListTransactionsView extends StatelessWidget {
  final controller = Get.find<ControllerLists>();

  @override
  Widget build(BuildContext context) {
    controller.getTransactions();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          
          
          title: Text('${DateFormat('dd/MM/yy').format(DateTime.now())} - Total: (R\$ ${controller.sumTotal.value.toStringAsFixed(2)})', ) ,
          elevation: 3,
        ),
        body: Container(
          
          color: Color.fromARGB(255, 236, 240, 236),
          child: Obx(
            () => ListView.builder(
              itemCount: controller.transactionAll.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  direction: DismissDirection.horizontal,
                  onDismissed: (direction) {
                    controller
                        .removeTransaction(controller.transactionAll[index].id!);
                    controller.transactionAll.removeAt(index);
                  },
                  background: Container(
                    height: Get.height * 0.18,
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
                  key: ValueKey(controller.transactionAll[index]),
                  child: ListTile(
                    title: Container(
                      height: Get.height * 0.16,
                      child: InkWell(
                        onDoubleTap: () {
                          controller.setEdition(
                            controller.transactionAll[index].nameTransaction,
                            controller.transactionAll[index].typeTransaction,
                            controller.transactionAll[index].dueDate,
                            controller.transactionAll[index].valor,
                            controller.transactionAll[index].id!,
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
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(1.5),
                                    child: Text(
                                      '${controller.transactionAll[index].nameTransaction}  ',
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
                                            controller.transactionAll[index].valor
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
                                     
                                     Get.defaultDialog(
                                    custom: Container(height: Get.width * 0.6,),
                                    onCancel:(){Navigator.pop(context);},
                                  onConfirm:(){
                                     controller.removeTransaction(
                                          controller.transactionAll[index].id!);
                                      controller.transactionAll.removeAt(index);
                                      Navigator.pop(context);
                                   
                                  } ,
                             
                                  backgroundColor:Color.fromARGB(255, 224, 190, 34).withOpacity(0.6),
                                    titleStyle: TextStyle(fontSize: 17) ,
                                    title: 'Excluir',
                                    middleText:'Tem certeza?',
                                      middleTextStyle:TextStyle(fontSize: 20),
                                      radius: 34
                                  );
                                     
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
                                        ' Cadastro:\n ${DateFormat('dd/MM/yyyy').format(controller.transactionAll[index].date)} ',
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            fontSize: 14,
                                            color: 
                                                 Colors.white,
                                               
                                            fontWeight: FontWeight.bold),
                                      ),
                                      controller.transactionAll[index].typeTransaction ==
                                              'input'
                                          ? Text(
                                              ' Entrada: \n ${DateFormat('dd/MM/yyyy').format(controller.transactionAll[index].dueDate)} ',
                                              style: TextStyle(
                                                fontStyle: FontStyle.italic,
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(255, 235, 96, 3),
                                              ),
                                            )
                                          : Text(
                                              ' Vencimento: \n ${DateFormat('dd/MM/yyyy').format(controller.transactionAll[index].dueDate)} ',
                                              style: TextStyle(
                                                fontStyle: FontStyle.italic,
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(255, 170, 40, 1),
                                              ),
                                            )
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
          child: Icon(Icons.add_task_rounded),
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
