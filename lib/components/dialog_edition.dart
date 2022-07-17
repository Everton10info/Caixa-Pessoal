import 'package:cash_book/Controllers/controller_list.dart';
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
  final controller = Get.find<ControllerLists>();

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
                  controller: controller.controllerNameEdition = TextEditingController(
                      text: controller.trUpdate!.nameTransaction.toString()),
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
                    if (value!.length < 1 || double.parse(value) < 1) {
                      return 'Valor inválido';
                    }
                  },
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(7),
                  ],
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  controller: controller.controllerValueEdition =
                      TextEditingController(text: controller.trUpdate!.valor.toString()),
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'Valor da transação',
                  ),
                ),

                CheckboxListTile(
                    selected:
                        controller.trUpdate!.typeTransaction == "input" ? true : false,
                    title: Text('Receita?'),
                    activeColor: Colors.blue,
                    value: controller.trUpdate!.typeTransaction == "input"
                        ? true
                        : receita.value,
                    onChanged: (bool? value) {}),
                CheckboxListTile(
                    selected: controller.trUpdate!.typeTransaction == "output" ||
                            controller.payYes.contains('${controller.trUpdate!.id}')
                        ? true
                        : false,
                    title: controller.payYes.contains('${controller.trUpdate!.id}')
                        ? Text('PAGO!')
                        : Text('Despesa?'),
                    activeColor: Colors.blue,
                    value: controller.trUpdate!.typeTransaction == "output" ||
                            controller.payYes.contains('${controller.trUpdate!.id}')
                        ? true
                        : despesa.value,
                    onChanged: (bool? value) {}),

                TextButton(
                    onPressed: () {
                      DatePicker.showDatePicker(context,
                          showTitleActions: true,
                          currentTime: controller.trUpdate!.dueDate, onConfirm: (date) {
                        print('confirm $date');
                        controller.trUpdate!.dueDate = date;
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
                    if (controller.trUpdate!.typeTransaction == '') {
                      Get.snackbar('Escolha uma opção ', 'RECEITA OU DESPESA?');
                    } else {
                      Rx<TransactionM> tr = Rx(
                        TransactionM(
                          id: controller.trUpdate!.id,
                          nameTransaction: controller.controllerNameEdition!.text,
                          dueDate: controller.trUpdate!.dueDate,
                          typeTransaction: controller.trUpdate!.typeTransaction,
                          valor: double.parse(controller.controllerValueEdition!.text) >
                                      0 &&
                                  controller.trUpdate!.typeTransaction != 'input'
                              ? double.parse(controller.controllerValueEdition!.text) * (-1)
                              : double.parse(controller.controllerValueEdition!.text),
                        ),
                      );

                      if (controller.controllerNameEdition!.text.length < 3 == false &&
                          (double.parse(controller.controllerValueEdition!.text) == 0) ==
                              false &&
                          controller.controllerValueEdition!.text.length < 1 == false) {
                        controller.editionUpdate(tr);
                        controller.getTransactions();
                        Get.back();
                      }
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
