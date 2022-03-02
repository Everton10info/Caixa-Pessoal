import 'dart:async';
import 'dart:io';
import 'package:cash_book/controllers/controllersList.dart';
import 'package:flutter/widgets.dart';
import 'package:cash_book/models/transaction_model.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

final listTrController = Get.find<ListTrController>();

class TransactionsHelpers {
  TransactionsHelpers.ensureInitialized();
  TransactionsHelpers();

//variáveis usadas para criar a tabela
  String nametable = 'tbl_transaction';
  String id = 'id';
  String nameTransaction = 'nameTransaction';
  String date = 'date';
  String typeTransaction = 'typeTransaction';
  String valor = 'valor';

  static Database? _database;

  //inicializa banco( verifica se ja foi inicializado)
  Future<Database?> get database async {
    if (_database == null) {
      _database = await initialBase();
    }
    return _database;
  }

  //inicializa o banco

  Future<Database> initialBase() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + 'bdTransactions.bd';
    var base = await openDatabase(path, version: 1, onCreate: _createTable);
    return base;
  }

//cria o tabela
  void _createTable(Database db, int versao) async {
    await db.execute('CREATE TABLE $nametable('
        '$id INTEGER PRIMARY KEY AUTOINCREMENT,'
        '$nameTransaction TEXT,'
        '$date DATATIME,'
        '$typeTransaction TEXT,'
        '$valor DOUBLE)');
  }

  //metodo inserir (transação)
  Future<int> insertTransaction(Rx<TransactionM> tr) async {
    Database? db = await this.database;
    var result = await db!.insert(nametable, tr.value.toMap());
    return result;
  }

  Future<void> delete(int id) async {
    final db = await database;
    await db!.delete(
      '$nametable',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  /* Future sumInput() async {
    final db = await database;
    String sql = "SELECT SUM($valor) FROM $nametable WHERE $typeTransaction == 'input'";
    var valueInput = await db!.rawQuery(sql);
    var listValueInput = valueInput[0].values;
    debugPrint('inputess --------------$listValueInput');
    var inp = listValueInput.toString();
    var valorTotal = '';
     valorTotal = inp.substring(1, inp.length - 1);
    debugPrint('${valorTotal.runtimeType}----$valorTotal ');

    try {
    listTrController.totalInput.value = double.parse(valorTotal);
    debugPrint('inpuuuuuuu--------------------u ------${listTrController.totalInput}');
      listTrController.sumTotal.value= listTrController.totalInput.value - listTrController.totalOutput.value;
    } catch (e) {
 debugPrint('iinpuuuu-no');
      

    }
  } */
/* 
  Future sumOutput(totalOutput) async {
    final db = await database;
    String sql = "SELECT SUM($valor) FROM $nametable WHERE $typeTransaction == 'output'";
    var valueOutput = await db!.rawQuery(sql);
    var listValueOutput = valueOutput[0].values;
    debugPrint('outeputess --------------$listValueOutput');
    var out = listValueOutput.toString();
    var valorTotal = '';
   valorTotal = out.substring(1, out.length - 1);
   try {
    debugPrint('${valorTotal.runtimeType}----$valorTotal ');
    totalOutput.value = double.parse(valorTotal);
    listTrController.sumTotal.value= listTrController.totalInput.value - listTrController.totalOutput.value;
   } catch (e) {
    debugPrint('inppppu--------------------u ------${listTrController.totalOutput}');
   } 

  }*/

  Future list() async {
    Database? db = await this.database;
    String sql = "SELECT * FROM $nametable";
    List list = await db!.rawQuery(sql);
    print('allllllllllllllllllllllllllllllllllll --$list');
    return list;
  }

  /* Future listInput() async {
    Database? db = await this.database;
    String sql = "SELECT * FROM $nametable WHERE $typeTransaction = 'input' ";
    List list = await db!.rawQuery(sql);

    print('input--$list');
    return list;
  }

  Future listOutput() async {
    Database? db = await this.database;
    String sql = "SELECT * FROM $nametable WHERE $typeTransaction = 'output' ";
    List list = await db!.rawQuery(sql);
    //print('outpu --$list');
    return list;
  } */
}
