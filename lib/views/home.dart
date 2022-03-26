import 'package:cash_book/componets/dialogForm.dart';
import 'package:cash_book/componets/myDrawer.dart';
import 'package:cash_book/controllers/controllersList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHome extends StatelessWidget {
  MyHome(){
    listTrController.getTransactions();
  }
  final listTrController = Get.find<ListTrController>();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        title: Container(
          child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Text(
              "LIVRO CAIXA",
              style: TextStyle(),
            ),
          ]),
        ),
      ),
     
      body: Container(
        
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 243, 239, 239),
          image: DecorationImage(
            image: AssetImage('assets/images/img5.gif'),
            fit: BoxFit.contain
          ),
        ),
      ),
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
      drawer: MyDrawer(),
    );
  }
}
