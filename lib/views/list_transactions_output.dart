import 'package:cash_book/componets/dialogForm.dart';
import 'package:cash_book/componets/dialog_edition.dart';
import 'package:cash_book/componets/myDrawer.dart';
import 'package:cash_book/view_model/view_model.dart';
import 'package:cash_book/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class ListTransactionsOutputs extends StatelessWidget {
ListTransactionsOutputs(){
 

}
  
  final listViewModel = Get.find<ListViewModel>();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown,DeviceOrientation.portraitUp,]);
     return Obx(() => Scaffold(
        appBar: AppBar(
          title:Text('${DateFormat('dd/MM/yy').format(DateTime.now())}    Despesa:(R\$ ${listViewModel.totalOutput.value.toStringAsFixed(2)})', ) ,
          elevation: 3,
         
        ),
        body: Container(
          color: Color.fromARGB(255, 236, 240, 236),
          child: Obx(
            () => ListView.builder(
              itemCount: listViewModel.transactionOutput.length,
              itemBuilder: (context, index) {
                return Dismissible(
                
                  direction: DismissDirection.horizontal,
                  onDismissed: (direction){
                      listViewModel.removeTransaction(
                                        listViewModel.transactionOutput[index].id!);
                                    listViewModel.transactionOutput.removeAt(index);
                  },
                  
                   background: Container(
                     height: Get.height * 0.18,
                color: Colors.transparent,
                child: Align( 
                alignment: Alignment.center, 
                   child: Icon(Icons.delete, color: Colors.red,size: 50,),
                 ),
                ),
                  key: ValueKey(listViewModel.transactionOutput[index]),
                  child: ListTile(
                    title: Container(
                     
              width: Get.width *8,
                      height: Get.height * 0.16,
                      
                
                      child: InkWell(
                         onDoubleTap: () {
                          listViewModel.setEdition(
                            listViewModel.transactionOutput[index].nameTransaction,
                            listViewModel.transactionOutput[index].typeTransaction,
                            listViewModel.transactionOutput[index].dueDate,
                            listViewModel.transactionOutput[index].valor,
                            listViewModel.transactionOutput[index].id!,
                            
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
                            margin: EdgeInsets.all(1.5),
                                    child: Text(
                                      '${listViewModel.transactionOutput[index].nameTransaction}  ',
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
                                            listViewModel.transactionOutput[index].valor
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
                                    custom: Container(width: 5,),
                                    onCancel:(){Navigator.pop(context);},
                                  onConfirm:(){
                                    listViewModel.removeTransaction(
                                          listViewModel.transactionOutput[index].id!);
                                      listViewModel.transactionOutput.removeAt(index);
                                    Navigator.pop(context);
                                  } ,
                                  //buttonColor:Color.fromARGB(255, 218, 46, 40) ,
                                  backgroundColor:Color.fromARGB(255, 236, 191, 41).withOpacity(0.5),
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
                                color: listViewModel.payYes.contains( '${listViewModel.transactionOutput[index].id}')?Color.fromARGB(255, 0, 192, 128):Color.fromARGB(255, 236, 195, 58),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        ' Registrado:\n ${DateFormat('dd/MM/yyyy').format(listViewModel.transactionOutput[index].date)} ',
                                        style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontSize: 13,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Text(
                                        ' Vencimento: \n ${DateFormat('dd/MM/yyyy').format(listViewModel.transactionOutput[index].dueDate)} ',
                                        style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color:  Color.fromARGB(255, 145, 34, 0),
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
