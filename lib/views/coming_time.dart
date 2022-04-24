import 'package:cash_book/components/dialogForm.dart';
import 'package:cash_book/components/myDrawer.dart';
import 'package:cash_book/view_model/view_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class ListComingTime extends StatelessWidget {
  final listViewModel = Get.find<ListViewModel>();
  var pag = {int:bool}.obs;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown,DeviceOrientation.portraitUp,]);
      return Scaffold(
        appBar: AppBar(
         
          title: Text('Débitos e pagamentos'),
          elevation: 3,
        ),
        body: Container(
          color: Color.fromARGB(255, 236, 240, 236),
          child: Obx(
            () => ListView.builder(
              itemCount: listViewModel.transactionTimeEnd.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  direction: DismissDirection.horizontal,
                  onDismissed: (direction){
                      listViewModel.removeTransaction(
                                        listViewModel.transactionTimeEnd[index].id!);
                                    listViewModel.transactionTimeEnd.removeAt(index);
                  },
                  
                   background: Container(
                    height: Get.height * 0.18,
            color: Colors.transparent,
                child: Align( 
                   alignment: Alignment.center, 
                   child: Icon(Icons.delete, color: Colors.red,size: 50,),
                 ),
                ),
                  key: ValueKey(listViewModel.transactionTimeEnd[index]),
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
                                   
                                    '${listViewModel.transactionTimeEnd[index].nameTransaction}  ',
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
                                          listViewModel.transactionTimeEnd[index].valor
                                              .toStringAsFixed(2)   ,
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
                                     
                                    listViewModel.pay(listViewModel.transactionTimeEnd[index].id!);
                                  Get.defaultDialog(
                                    custom: Container(height: Get.width * 0.6,),
                                  onConfirm:(){
                                    if(listViewModel.payYes.contains( '${listViewModel.transactionTimeEnd[index].id}')){
                                           listViewModel.setPay(
                            listViewModel.transactionTimeEnd[index].nameTransaction,
                            listViewModel.transactionTimeEnd[index].typeTransaction,
                            listViewModel.transactionTimeEnd[index].dueDate,
                            listViewModel.transactionTimeEnd[index].valor,
                            listViewModel.transactionTimeEnd[index].id!,
                          );
                         
                                    }else{
                                      listViewModel.setNotPay(
                            listViewModel.transactionTimeEnd[index].nameTransaction,
                            listViewModel.transactionTimeEnd[index].typeTransaction,
                            listViewModel.transactionTimeEnd[index].dueDate,
                            listViewModel.transactionTimeEnd[index].valor,
                            listViewModel.transactionTimeEnd[index].id!,
                          );
                         
                                    }

                                  
                                    Get.back();
                                  } ,
                                  buttonColor:Color.fromARGB(255, 241, 200, 137) ,
                                  backgroundColor:listViewModel.payYes.contains( '${listViewModel.transactionTimeEnd[index].id}')? Color.fromARGB(255, 0, 192, 128).withOpacity(0.7)  :Color.fromARGB(255, 224, 190, 34).withOpacity(0.8),
                                    titleStyle: TextStyle(fontSize: 17) ,
                                    title: 'Transação modificada..',
                                    middleText:listViewModel.payYes.contains( '${listViewModel.transactionTimeEnd[index].id}')?'Pago!' : 'Devendo!',
                                      middleTextStyle:TextStyle(fontSize: 20),
                                      radius: 34
                                      
                                  );
                              
                          

                         
                                  
                                  },
                                  tooltip: 'Pago? ok',
                                  icon: Icon(listViewModel.payYes.contains( '${listViewModel.transactionTimeEnd[index].id}')?
                                    Icons.check: Icons.attach_money,
                                    color:listViewModel.payYes.contains( '${listViewModel.transactionTimeEnd[index].id}')? Color.fromARGB(255, 0, 192, 128):Color.fromARGB(255, 212, 70, 27),
                                    size: 34,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 2.5, right: 2.5),
                              height: Get.height * 0.04,
                             
                              color: listViewModel.payYes.contains( '${listViewModel.transactionTimeEnd[index].id}')? Color.fromARGB(255, 0, 192, 128):Color.fromARGB(255, 212, 70, 27),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                   Text(
                                        ' Data de vencimento : ${DateFormat('dd/MM/yyyy').format(listViewModel.transactionTimeEnd[index].dueDate)}   ',
                                        style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                        ),
                                                                    ),
                                                                    Icon(Icons.arrow_upward)
                                   
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
