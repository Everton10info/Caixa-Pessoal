

class TransactionM {
  int? id;
  String nameTransaction;
  DateTime date = DateTime.now();
  String typeTransaction;
  double valor;

  TransactionM({
    required this.id,
    required this.nameTransaction,
    date,
    required this.typeTransaction,
    required this.valor,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'nameTransaction': nameTransaction,
        'date': date.toString(),
        'typeTransaction': typeTransaction,
        'valor': valor
      };
 
}
