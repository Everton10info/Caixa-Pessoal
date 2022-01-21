class TransactionM {
  int? id;
  String nameTransaction;
  DateTime date = DateTime.now() ;
  String typeTransaction ;
  double valor;

  TransactionM({
    id,
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
  factory TransactionM.fromJson(Map<String, dynamic> json) => new TransactionM(
      id: json['id'],
      nameTransaction: json['nameTransaction'],
      date: json["date"],
      typeTransaction: json['typeTransaction'],
      valor: json['valor']);
}
