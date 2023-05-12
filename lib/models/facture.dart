class Facture {
  final String? idFacture;
  final String? taxe;
  final String fraislivraison;
  final double commandeid;
  final String numero;
  final String date;
  final String montant;
  final String? createdAt;

  Facture({
    this.idFacture,
    required this.fraislivraison,
    this.taxe,
    required this.commandeid,
    required this.numero,
    required this.montant,
    required this.date,
    this.createdAt,
  });

  factory Facture.fromJson(dynamic json) {
    return Facture(
      idFacture: json['_id'] as String,
      taxe: json['taxe'] as String,
      commandeid: json['commandeid'] as double,
      numero: json['numero'] as String,
      date: json['date'] as String,
      montant: json['montant'] as String,
      fraislivraison: json['fraislivraison'] as String,
      createdAt: json['createdAt'] as String,
    );
  }
  Map<String, dynamic> toJson() => {
        "taxe": taxe,
        "commandeid": commandeid,
        "numero": numero,
        "date": date,
        "montant": montant,
        "fraislivraison": fraislivraison,
        "CreatedAt": createdAt,
      };

  static List<Facture> FacturesFromSnapshots(List snapshot) {
    return snapshot.map((data) => Facture.fromJson(data)).toList();
  }

  static Facture FactureFromSnapshot(Facture snapshot) {
    return snapshot;
  }
}
