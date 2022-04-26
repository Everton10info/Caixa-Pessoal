import 'package:cash_book/view_model/view_model.dart';
import 'package:cash_book/models/transaction_model.dart';
import 'package:cash_book/routes/routes.dart';
import 'package:cash_book/views/list_transaction_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

enum Types { input, output }

// ignore: must_be_immutable
class DialogFrom extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final trKey = GlobalKey<FormFieldState>();
  final valueKey = GlobalKey<FormFieldState>();
  final listViewModel = Get.find<ListViewModel>();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerValue = TextEditingController();
  var setDate = DateTime.now();
  final RxString typeTransaction = ''.obs;
  final RxString nameTransaction = ''.obs;
  final RxDouble valor = 0.0.obs;
  var id;

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
                  controller: controllerName,
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
                    if (value!.length < 1 || double.parse(value)<1 ) {
                      return 'Valor inválido';
                    }
                  },
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(7),
                  ],
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  controller: controllerValue,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'Valor da transação',
                  ),
                ),

                CheckboxListTile(
                  selected: typeTransaction == "input" ? true : false,
                  title: Text('Receita?'),
                  activeColor: Colors.blue,
                  value: receita.value,
                  onChanged: (bool? value) {
                    receita.value = value!;
                    despesa.value = false;
                    receita.value
                        ? typeTransaction.value = 'input'
                        : typeTransaction.value = '';
                    value = false;
                  },
                ),
                CheckboxListTile(
                    selected: typeTransaction == "output" ? true : false,
                    title: Text('Despesa?'),
                    activeColor: Colors.blue,
                    value: despesa.value,
                    onChanged: (bool? value) {
                      despesa.value = value!;
                      receita.value = false;

                      despesa.value
                          ? typeTransaction.value = 'output'
                          : typeTransaction.value = '';
                    }),

                TextButton(
                    onPressed: () {
                      DatePicker.showDatePicker(context,
                          showTitleActions: true, minTime: DateTime(2020, 1, 1),
                          // maxTime: DateTime(2025, 1, 1),
                          //print('change $date');
                          onConfirm: (date) {
                        print('confirm $date');
                        setDate = date;
                      }, locale: LocaleType.pt);
                    },
                    child: Text(
                      'Data de Vencimento ou Lançamento?  ',
                      style: TextStyle(color: Color.fromARGB(255, 228, 231, 9)),
                    )),

                TextButton(
                  onPressed: () async {
                    trKey.currentState?.validate();
                    valueKey.currentState?.validate();
                    if (typeTransaction == '') {
                      Get.snackbar('Escolha uma opção ', 'RECEITA OU DESPESA?');
                    } else {
                      nameTransaction.value = controllerName.text;
                      var valorTemp = double.parse(controllerValue.text);
                      if (typeTransaction == 'input') {
                        valor.value = valorTemp;
                      }
                      if (typeTransaction == 'output') {
                        valor.value = valorTemp * (-1);
                      }

                      Rx<TransactionM> transaction = Rx(
                        TransactionM(
                          nameTransaction: nameTransaction.value,
                          typeTransaction: typeTransaction.value,
                          id: id,
                          dueDate: setDate,
                          valor: valor.value,
                        ),
                      );
                      if (nameTransaction.value.length < 3 == false &&
                          valor.value.toString().length < 1 == false && valor.value !=0 ){
                        listViewModel.addTransaction(transaction);
                        listViewModel.getTransactions();
                        await Get.to(() => ListTransactionsView());
                        Get.back();
                      }
                    }
                  },
                  child: Text(
                    'ADICIONAR TRANSAÇÃO',
                    style: TextStyle(
                        color: Color.fromARGB(255, 54, 253, 114),
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
