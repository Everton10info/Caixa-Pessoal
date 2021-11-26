import 'package:cash_book/componets/card_trasaction.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class CardsRelease extends StatelessWidget {
  const CardsRelease({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 15,
        itemBuilder: (context, i) {
          return CardTransaction();
        },
      ),
    );
  }
}
