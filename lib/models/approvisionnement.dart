class Approvisionnement {
  final String? idApprovisionnement;
  final String produit;
  final double type;
  final String quantity;
  final String? createdAt;

  Approvisionnement({
    this.idApprovisionnement,
    required this.produit,
    required this.type,
    required this.quantity,
    this.createdAt,
  });

  factory Approvisionnement.fromJson(dynamic json) {
    return Approvisionnement(
      idApprovisionnement: json['_id'] as String,
      type: json['type'] as double,
      quantity: json['quantity'] as String,
      produit: json['produit'] as String,
      createdAt: json['createdAt'] as String,
    );
  }
  Map<String, dynamic> toJson() => {
        "type": type,
        "quantity": quantity,
        "produit": produit,
        "CreatedAt": createdAt,
      };

  static List<Approvisionnement> ApprovisionnementsFromSnapshots(
      List snapshot) {
    return snapshot.map((data) => Approvisionnement.fromJson(data)).toList();
  }

  static Approvisionnement ApprovisionnementFromSnapshot(
      Approvisionnement snapshot) {
    return snapshot;
  }
}
