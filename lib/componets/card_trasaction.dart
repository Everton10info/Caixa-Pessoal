import 'package:flutter/material.dart';

class CardTransaction extends StatelessWidget {
  const CardTransaction({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
            elevation: 4,
            child: ListTile(
              title: Text('EVERTON'),
              //tileColor: Colors.blueGrey[50],
            ),
          ),
      
    );
  }
}