import 'dart:async';
import 'dart:io';
import 'package:cash_book/models/transaction_model.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class TransactionsHelpers {
//variáveis usadas para criar a tabela
  String nametable = 'tbl_transaction';
  String id = 'id';
  String nameTransaction = 'nameTransaction';
  String date = 'date';
  String typeTransaction = 'typeTransaction';
  String valor = 'valor';

  //criando a conecção com o banco
  static TransactionsHelpers? _databasehelper;
  static Database? _database;
  TransactionsHelpers._createInstancia();

  factory TransactionsHelpers() {
    if (_databasehelper == null) {
      _databasehelper = TransactionsHelpers._createInstancia();
    }
    return _databasehelper!;
  }

  //inicializa banco( verifica se ja foi inicializado)
  Future<Database?> get database async {
    if (_database == null) {
      _database = await initialBase();
    }
    return _database;
  }

//cria o tabela
  void _createBase(Database db, int versao) async {
    await db.execute('CREATE TABLE $nametable('
        '$id INTEGER PRIMARY KEY AUTOINCREMENT,'
        '$nameTransaction TEXT,'
        '$date TEXT,'
        '$typeTransaction TEXT,'
        '$valor DOUBLE)');
  }

  //inicializa o banco
  Future<Database?> initialBase() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + 'bdTransactions.bd';
    var base = await openDatabase(path, version: 1, onCreate: _createBase);
    return base;
  }

  //metodo inserir (transação)
  Future<int> insertTransaction(Rx<TransactionM> tr) async {
    Database? db = await this.database;
    var result = await db!.insert(nametable, tr.value.toMap());
    return result;
  }


 /*  Future dell(trId) async {
    Database? db = await this.database;
    String sql = "SELECT * FROM $nametable WHERE $id = trId";

    List list = await db!.rawQuery(sql);
    print(list);
    return list;
  } */

  //metodo que lista dados

  Future list() async {
    Database? db = await this.database;
    String sql = "SELECT * FROM $nametable";

    List list = await db!.rawQuery(sql);
    print(list);
    return list;
  }

   Future listInput() async {
    Database? db = await this.database;
    String sql = "SELECT * FROM $nametable WHERE $typeTransaction = 'input' ";

    List list = await db!.rawQuery(sql);
    print(list);
    return list;
  }
   Future listOutput() async {
    Database? db = await this.database;
    String sql = "SELECT * FROM $nametable WHERE $typeTransaction = 'output' ";

    List list = await db!.rawQuery(sql);
    print(list);
    return list;
  }
}
