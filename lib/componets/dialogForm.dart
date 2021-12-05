import 'package:flutter/material.dart';

class DialogFrom extends StatelessWidget {
  const DialogFrom({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Dialog(backgroundColor: Colors.blueGrey, child: Text('data')),
    );
  }
}