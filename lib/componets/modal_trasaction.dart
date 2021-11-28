
import 'dart:developer';

import 'package:cash_book/componets/card_trasaction.dart';
import 'package:cash_book/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ModalTransaction extends StatelessWidget {
Transaction transaction = Get.find();
 

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('olha aqui'),
      content: TextFormField(
      
       onChanged:(text){
          transaction.nameTransaction= text;
         
       },
      ),
      
      
                
    );

    
  }
}

