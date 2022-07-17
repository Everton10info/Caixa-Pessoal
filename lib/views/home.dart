import 'package:cash_book/components/dialog_form.dart';
import 'package:cash_book/components/my_drawer.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {


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
        
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 236, 240, 236),
          image: DecorationImage(
            image: AssetImage('assets/images/img5.gif'),
            fit: BoxFit.fitWidth
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
