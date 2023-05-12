class Commande {
  final String? idCommande;
  final String datecommande;
  final String? prixUnitaire;
  final double quantity;
  final String? montant;
  final String fournisseurId;
  final String produit;
  final String dateLivraison;
  final String? createdAt;

  Commande({
    this.idCommande,
    this.prixUnitaire,
    this.montant,
    required this.dateLivraison,
    required this.datecommande,
    required this.quantity,
    required this.fournisseurId,
    required this.produit,
    this.createdAt,
  });

  factory Commande.fromJson(dynamic json) {
    return Commande(
      idCommande: json['_id'] as String,
      datecommande: json['datecommande'] as String,
      quantity: json['quantity'] as double,
      montant: json['montant'] as String,
      prixUnitaire: json['prixUnitaire'] as String,
      dateLivraison: json['dateLivraison'] as String,
      fournisseurId: json['fournisseurId'] as String,
      produit: json['produit'] as String,
      createdAt: json['createdAt'] as String,
    );
  }
  Map<String, dynamic> toJson() => {
        "datecommande": datecommande,
        "quantity": quantity,
        "montant": montant,
        "prixunitaire": prixUnitaire,
        "CreatedAt": createdAt,
      };

  static List<Commande> CommandesFromSnapshots(List snapshot) {
    return snapshot.map((data) => Commande.fromJson(data)).toList();
  }

  static Commande CommandeFromSnapshot(Commande snapshot) {
    return snapshot;
  }
}
