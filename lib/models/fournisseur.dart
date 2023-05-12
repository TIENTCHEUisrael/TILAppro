class Fournisseur {
  final String? idFournisseur;
  final String name;
  final String adresse;
  final String telephone;
  final String email;
  final String? createdAt;

  Fournisseur({
    this.idFournisseur,
    required this.adresse,
    required this.name,
    required this.telephone,
    required this.email,
    this.createdAt,
  });

  factory Fournisseur.fromJson(dynamic json) {
    return Fournisseur(
      idFournisseur: json['_id'] as String,
      name: json['name'] as String,
      telephone: json['telephone'] as String,
      email: json['email'] as String,
      adresse: json['adresse'] as String,
      createdAt: json['createdAt'] as String,
    );
  }
  Map<String, dynamic> toJson() => {
        "name": name,
        "telephone": telephone,
        "email": email,
        "adresse": adresse,
        "CreatedAt": createdAt,
      };

  static List<Fournisseur> FournisseursFromSnapshots(List snapshot) {
    return snapshot.map((data) => Fournisseur.fromJson(data)).toList();
  }

  static Fournisseur FournisseurFromSnapshot(Fournisseur snapshot) {
    return snapshot;
  }
}
