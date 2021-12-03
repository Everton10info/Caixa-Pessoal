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
      floatingActionButton: FloatingActionButton.extended(onPressed: (){}, label: Text('voooufgfdgdf'),)
    );
  }
}
