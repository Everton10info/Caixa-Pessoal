import 'dart:async';
import 'dart:io';
import 'package:cash_book/controllers/controllersList.dart';

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
  String dueDate = 'dueDate';
  String typeTransaction = 'typeTransaction';
  String valor = 'valor';

  static Database? _database;

  //cria o banco( verifica se ja foi inicializado)
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
        '$date DATA,'
        '$dueDate DATA,'
        '$typeTransaction TEXT,'
        '$valor DOUBLE)');
  }

  //metodo inserir (transação)
  Future<int> insertTransaction(Rx<TransactionM> tr) async {
    Database? db = await this.database;
    var result = await db!.insert(nametable, tr.value.toMap());
    return result;
  }

  Future<int> updateTr(Rx<TransactionM> up) async {
    final db = await database;
    return await db!.update(
      "$nametable",
      up.value.toMap(),
      where: "id = ?",
      whereArgs: [up.value.id],
    );
  }

  Future<void> delete(int id) async {
    final db = await database;
    await db!.delete(
      '$nametable',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<double?> sumTotal() async {
    final db = await database;
    String sql = "SELECT SUM($valor) FROM $nametable WHERE  datetime('now','localtime') >= $dueDate  AND $typeTransaction == 'input' OR datetime('now','localtime') >= $dueDate AND $typeTransaction == 'payment'  ";
    var value = await db!.rawQuery(sql);
    var valueString = value[0].values.toString();
    String? valueTotal = valueString.substring(1, valueString.length - 1);
    double? doubleTotal = double.tryParse(valueTotal);

    return doubleTotal;
  }

  Future<double?> outputTotal() async {
    final db = await database;
    String sql = "SELECT SUM($valor) FROM $nametable WHERE datetime('now','localtime') >= $dueDate  AND $typeTransaction == 'payment' ";
    var value = await db!.rawQuery(sql);
    var valueString = value[0].values.toString();
    String? valueTotal = valueString.substring(1, valueString.length - 1);
    double? doubleTotal = double.tryParse(valueTotal);
    return doubleTotal;
  }

  Future<double?> inputTotal() async {
    final db = await database;
    String sql = "SELECT SUM($valor) FROM $nametable WHERE  datetime('now','localtime') >= $dueDate  AND $typeTransaction == 'input' ";
    var value = await db!.rawQuery(sql);
    var valueString = value[0].values.toString();
    String? valueTotal = valueString.substring(1, valueString.length - 1);
    double? doubleTotal = double.tryParse(valueTotal);
    return doubleTotal;
  }

  Future list() async {
    Database? db = await this.database;
    String sql = "SELECT * FROM $nametable";
    List list = await db!.rawQuery(sql);

    return list;
  }

  Future listInputDb() async {
    Database? db = await this.database;
    String sql = "SELECT * FROM $nametable WHERE $typeTransaction = 'input' ";
    List list = await db!.rawQuery(sql);

    return list;
  }

  Future listOutputDb() async {
    Database? db = await this.database;
    String sql = "SELECT * FROM $nametable WHERE $typeTransaction == 'output' OR $typeTransaction == 'payment' ";
    List list = await db!.rawQuery(sql);
    print('outpu --$list');
    return list;
  }

  Future listTimeEndDb() async {
    Database? db = await this.database;
    String sql =
        "SELECT * FROM $nametable WHERE datetime('now','localtime') >= $dueDate  AND $typeTransaction == 'output' OR  $typeTransaction == 'payment'";
    List list = await db!.rawQuery(sql);

    return list;
  }

   Future listPayment() async {
    Database? db = await this.database;
    String sql =
        "SELECT * FROM $nametable WHERE  $typeTransaction =='payment'  ";
    List list = await db!.rawQuery(sql);

    return list;
  }
}
