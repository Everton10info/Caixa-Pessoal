import 'package:cash_book/componets/dialogForm.dart';
import 'package:cash_book/componets/myDrawer.dart';
import 'package:cash_book/controllers/controllersList.dart';
import 'package:cash_book/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: must_be_immutable
class ListTransactionsInput extends StatelessWidget {
  final listTrController = Get.find<ListTrController>();
 
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      
      appBar: AppBar(
        
        title: Text(listTrController.totalInput.obs.toString()),
        elevation: 3,
      ),
      body: Container(
          child: Obx(
            
            
            
        () => ListView.builder(
          itemCount: listTrController.transactionInput.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Card(
                elevation: 5,
                child: Container(
                  alignment: Alignment.center,
                  //color: Colors.greenAccent,
                  height: Get.height * 0.13,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 80,
                            child: Text(
                              listTrController
                                  .transactionInput[index].nameTransaction
                                  .toString(),
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Text(
                            'Valor : R\$ ${listTrController.transactionInput[index].value}'
                                .toString(),
                            style: TextStyle(color: Colors.blue, fontSize: 16),
                          ),
                          IconButton(
                            alignment: Alignment.centerRight,
                            onPressed: () {
                              int id =
                                  listTrController.transactionInput[index].id;
                              double v =
                                  listTrController.transactionInput[index].value;
                              listTrController.removeTrasactionInput(id, v);
                            },
                            icon: Icon(Icons.delete_forever_outlined),
                          ),
                        ],
                      ),
                      Text('${listTrController.transactionInput[index].date}'),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        
      ),
      ),
      drawer:MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(child: DialogFrom());
              });
        },
      ),
    );
  }
}
