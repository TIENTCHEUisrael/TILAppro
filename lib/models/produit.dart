class Produit {
  final String? idProduit;
  final String name;
  final String description;
  final int price;
  final int quantity;
  final bool statut;
  final String? fournisseur;
  final String? createdAt;

  Produit({
    this.idProduit,
    required this.description,
    required this.name,
    required this.price,
    this.statut = false,
    this.fournisseur,
    required this.quantity,
    this.createdAt,
  });

  factory Produit.fromJson(dynamic json) {
    return Produit(
      idProduit: json['_id'] as String,
      name: json['name'] as String,
      price: json['price'] as int,
      quantity: json['quantity'] as int,
      statut: json['statut'] as bool,
      description: json['description'] as String,
      fournisseur: json['fournisseur'] as String,
      createdAt: json['createdAt'] as String,
    );
  }
  Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        "quantity": quantity,
        "statut": statut,
        "description": description,
        "fournisseur": fournisseur,
        "CreatedAt": createdAt,
      };

  static List<Produit> ProduitsFromSnapshots(List snapshot) {
    return snapshot.map((data) => Produit.fromJson(data)).toList();
  }

  static Produit ProduitFromSnapshot(Produit snapshot) {
    return snapshot;
  }
}
