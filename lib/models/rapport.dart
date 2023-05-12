class Rapport {
  final String? idRapport;
  final String number;
  final String stockId;
  final List<dynamic> commandeid;
  final String? createdAt;

  Rapport({
    this.idRapport,
    required this.stockId,
    required this.number,
    required this.commandeid,
    this.createdAt,
  });

  factory Rapport.fromJson(dynamic json) {
    return Rapport(
      idRapport: json['_id'] as String,
      number: json['number'] as String,
      commandeid: json['commande'] as List<dynamic>,
      stockId: json['stock'] as String,
      createdAt: json['createdAt'] as String,
    );
  }
  Map<String, dynamic> toJson() => {
        "number": number,
        "commande": commandeid,
        "stock": stockId,
        "CreatedAt": createdAt,
      };

  static List<Rapport> RapportsFromSnapshots(List snapshot) {
    return snapshot.map((data) => Rapport.fromJson(data)).toList();
  }

  static Rapport RapportFromSnapshot(Rapport snapshot) {
    return snapshot;
  }

  @override
  String toString() {
    return "Rapport {_id:$idRapport,number: $number,commandeid: $commandeid,stockid: $stockId,ceatedAt: $createdAt,}";
  }
}
