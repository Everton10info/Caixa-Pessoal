import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogFrom extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Dialog(

        child: SizedBox(
          width: 80,
          height:Get.height * 0.6,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Nome da transação'
              ),
              
            ),
          ),
        )
      ),
    );
  }
}
