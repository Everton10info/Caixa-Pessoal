import 'package:cash_book/routes/routes.dart';
import 'package:cash_book/views/list_transaction_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        title: Text("Cash Book"),
      ),
      
      backgroundColor: Colors.blueGrey[100],
      body: Container(
        decoration: BoxDecoration(
          //borderRadius: BorderRadius.all(Radius.circular(10.0)),
          image: DecorationImage(
            image: AssetImage('assets/images/illustration.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        
      ),
      floatingActionButton: FloatingActionButton.extended(onPressed: (){
      Get.toNamed('/list-transaction');
      }, label: Text('voooufgfdgdf'),
      
      
      )
    );
  }
}
