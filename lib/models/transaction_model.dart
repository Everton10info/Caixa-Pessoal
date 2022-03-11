



class TransactionM {
  int? id;
  String nameTransaction;
 DateTime date = DateTime.now() ;
  String typeTransaction;
  DateTime dueDate;
  double valor;

  TransactionM({
    required this.id,
    required this.nameTransaction,
    date,
    required this.dueDate,
    required this.typeTransaction,
    required this.valor,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'nameTransaction': nameTransaction,
        'date': date.toString(),
        'dueDate': dueDate.toString(),
        'typeTransaction': typeTransaction,
        'valor': valor
      };
 
}
