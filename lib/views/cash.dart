import 'package:cash_book/componets/card_trasaction.dart';
import 'package:cash_book/views/card_release.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cash extends StatelessWidget {
  const Cash({Key? key, this.listCardTransactions}) : super(key: key);
  final List<CardTransaction>? listCardTransactions;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text("Cash"),
      ),
      body: Container(
       
        child: CardsRelease(),
        
      ),
      floatingActionButton: FloatingActionButton(

        splashColor: Colors.yellowAccent,
        
        onPressed: (){

        },
      ),
    );
  }
}
