import 'package:cash_book/Controllers/controller_list.dart';
import 'package:cash_book/components/dialog_form.dart';
import 'package:cash_book/components/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
ControllerLists controller = Get.find();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown,DeviceOrientation.portraitUp,]);
   controller.getTransactions();
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
