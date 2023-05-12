class Stock {
  final String? idStock;
  final String date;
  final String nomProduit;
  final int quantity;
  final List<dynamic> products;
  final String? createdAt;

  Stock({
    this.idStock,
    required this.nomProduit,
    required this.date,
    required this.quantity,
    required this.products,
    this.createdAt,
  });

  factory Stock.fromJson(dynamic json) {
    return Stock(
      idStock: json['_id'] as String,
      date: json['date'] as String,
      quantity: json['quantity'] as int,
      products: json['products'] as List<dynamic>,
      nomProduit: json['nomProduit'] as String,
      createdAt: json['createdAt'] as String,
    );
  }
  Map<String, dynamic> toJson() => {
        "date": date,
        "quantity": quantity,
        "products": products,
        "nomproduit": nomProduit,
        "CreatedAt": createdAt,
      };

  static List<Stock> StocksFromSnapshots(List snapshot) {
    return snapshot.map((data) => Stock.fromJson(data)).toList();
  }

  static Stock StockFromSnapshot(Stock snapshot) {
    return snapshot;
  }
}
