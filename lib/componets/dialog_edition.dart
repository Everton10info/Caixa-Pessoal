import 'package:cash_book/controllers/controllersList.dart';
import 'package:cash_book/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

enum Types { input, output }

// ignore: must_be_immutable
class DialogEdition extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final trKey = GlobalKey<FormFieldState>();
  final valueKey = GlobalKey<FormFieldState>();
  final listTrController = Get.find<ListTrController>();

  RxBool receita = false.obs;
  RxBool despesa = false.obs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: SingleChildScrollView(
        child: Container(
          height: Get.height * 0.5,
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  textCapitalization: TextCapitalization.sentences,
                  key: trKey,
                  validator: (String? value) {
                    if (value!.length < 3) {
                      return 'Nome inválido';
                    }
                  },
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(28),
                  ],
                  controller: listTrController.controllerNameEdition = TextEditingController(
                    text: 
                            listTrController.trUpdate!.nameTransaction.toString()
                        
                  ),
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'Nome da transação',
                  ),
                ),
                // Divider(),
                TextFormField(
                  textCapitalization: TextCapitalization.sentences,
                  key: valueKey,
                  validator: (String? value) {
                    if (value!.length < 1) {
                      return 'Valor inválido';
                    }
                  },
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(7),
                  ],
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  controller: listTrController.controllerValueEdition = TextEditingController(
                    text: 
                            listTrController.trUpdate!.valor.toString()
                      
                  ),
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'Valor da transação',
                  ),
                ),

                CheckboxListTile(
                  selected:
                      listTrController.trUpdate!.typeTransaction == "input" ? true : false,
                  title: Text('Receita?'),
                  activeColor: Colors.blue,
                  value: listTrController.trUpdate!.typeTransaction == "input"
               ? true
                      : receita.value,
                  onChanged: (bool? value) {
                    //receita.value = value!;
                   // despesa.value = false;
                    receita.value
                        ?  listTrController.trUpdate!.typeTransaction = 'input'
                        : //listTrController.trUpdate!.typeTransaction = '';
                    value = false;                  },
                ),
                CheckboxListTile(
                    selected:
                        listTrController.trUpdate!.typeTransaction == "output" ? true : false,
                    title: Text('Despesa?'),
                    activeColor: Colors.blue,
                    value: listTrController.trUpdate!.typeTransaction == "output"
                        
                      ? true
                        : despesa.value,
                    onChanged: (bool? value) {
                     // despesa.value = value!;
                      //receita.value = false;

                      //despesa.value
                         /*  ? */ listTrController.trUpdate!.typeTransaction = 'output';
                         /*  : */// listTrController.trUpdate!.typeTransaction = '';
                          //value = false; 
                    }),

                TextButton(
                    onPressed: () {
                      DatePicker.showDatePicker(context,
                          showTitleActions: true,
                          currentTime: listTrController.trUpdate!.dueDate, onConfirm: (date) {
                        print('confirm $date');
                        listTrController.trUpdate!.dueDate = date;
                      }, locale: LocaleType.pt);
                    },
                    child: Text(
                      'Mudar Vencimento ou Lançamento?  ',
                      style: TextStyle(color: Color.fromARGB(255, 228, 231, 9)),
                    )),

                TextButton(
                  onPressed: () async {
                    trKey.currentState?.validate();
                    valueKey.currentState?.validate();
                    if (listTrController.trUpdate!.typeTransaction == '') {
                      Get.snackbar('Escolha uma opção ', 'RECEITA OU DESPESA?');
                    } else {
                      Rx<TransactionM> tr = Rx(
                        TransactionM(
                          id: listTrController.trUpdate!.id,
                          nameTransaction: listTrController.controllerNameEdition!.text,
                          dueDate: listTrController.trUpdate!.dueDate,
                          typeTransaction: listTrController.trUpdate!.typeTransaction,
                          valor: double.parse(listTrController.controllerValueEdition!.text) >
                                      0 &&
                                  listTrController.trUpdate!.typeTransaction == 'output'
                              ? double.parse(listTrController.controllerValueEdition!.text) *
                                  (-1)
                              : double.parse(listTrController.controllerValueEdition!.text) <
                                          0 &&
                                      listTrController.trUpdate!.typeTransaction == 'input'
                                  ? double.parse(
                                          listTrController.controllerValueEdition!.text) *
                                      (1)
                                  : double.parse(
                                      listTrController.controllerValueEdition!.text),
                        ),
                      );
                      listTrController.editionUpdate(tr);

                      listTrController.getTransactions();

                      Get.back();
                    }
                  },
                  child: Text(
                    'EDITAR TRANSAÇÃO',
                    style: TextStyle(
                        color: Color.fromARGB(255, 253, 190, 54),
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                  //icon: Icon(Icons.add_task_outlined),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
