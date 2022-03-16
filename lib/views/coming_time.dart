import 'package:cash_book/componets/dialogForm.dart';
import 'package:cash_book/componets/myDrawer.dart';
import 'package:cash_book/controllers/controllersList.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class ListComingTime extends StatelessWidget {
  final listTrController = Get.find<ListTrController>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown,DeviceOrientation.portraitUp,]);
      return Scaffold(
        appBar: AppBar(
          title: Text('VENCENDO HOJE!'),
          elevation: 3,
        ),
        body: Container(
          color: Color.fromARGB(255, 223, 235, 212),
          child: Obx(
            () => ListView.builder(
              itemCount: listTrController.transactionTimeEnd.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  direction: DismissDirection.horizontal,
                  onDismissed: (direction){
                      listTrController.removeTransaction(
                                        listTrController.transactionTimeEnd[index].id!);
                                    listTrController.transactionTimeEnd.removeAt(index);
                  },
                  
                   background: Container(
                    height: Get.height * 0.16,
            color: Colors.transparent,
                child: Align( 
                   alignment: Alignment.center, 
                   child: Icon(Icons.delete, color: Colors.red,size: 50,),
                 ),
                ),
                  key: ValueKey(listTrController.transactionTimeEnd[index]),
                  child: ListTile(
                    title: Container(
                    
                width: Get.width *10,
                      height: Get.height * 0.16,
                      
                
                      child: Card(
                       
                        shape: RoundedRectangleBorder(
                            borderRadius: const BorderRadius.all(
                          Radius.circular(16.0),
                        )),
                        elevation: 13,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                   margin: EdgeInsets.fromLTRB(0, 4, 2, 0),
                                  child: Text(
                                   
                                    '${listTrController.transactionTimeEnd[index].nameTransaction}  ',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      color: Colors.white,
                                      fontSize: 22,
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
                                          listTrController.transactionTimeEnd[index].valor
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
                                        listTrController.transactionTimeEnd[index].id!);
                                    listTrController.transactionTimeEnd.removeAt(index);
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
                              height: Get.height * 0.04,
                             
                              color: Color.fromARGB(255, 184, 48, 7),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                   
                                    Text(
                                      ' Vencimento !: ${DateFormat('dd/MM/yyyy').format(listTrController.transactionTimeEnd[index].dueDate)} ',
                                      style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
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
     
    );
  }
}
