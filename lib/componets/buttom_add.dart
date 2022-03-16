import 'package:flutter/material.dart';

class ButtomAdd extends StatelessWidget {
  final VoidCallback onPressed;
  const ButtomAdd({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) return Colors.blueAccent;
          return Colors.amber;
        }),
      ),
      child: Text('Adicionar transação'),
      onPressed: () {},
    );
  }
}
