import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:flutter/widgets.dart';
import '../../models/commande.dart';
import '../services.dart';

class Commanderovider extends ChangeNotifier {
  Commande? _commande;
  Commande get commande {
    return _commande!;
  }

  void setCommande(Commande cl) {
    _commande = cl;
    notifyListeners();
  }

  static Future<List<Commande>> getCommandes() async {
    var _var;
    try {
      var url = Uri.parse(Services.urlGetcommande);
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data);
        List _temp = [];

        for (var i in data) {
          _temp.add(i);
        }

        _var = Commande.CommandesFromSnapshots(_temp);

        print(_var);
      } else {
        _var = [];
        print('False');
      }
    } on SocketException catch (_) {
      print('Connexion failed');
    }

    return _var;
  }

  Future<Commande> getCommande(Commande commande) async {
    try {
      var urlLogin =
          Uri.parse('${Services.urlGetcommandeById}${commande.idCommande}');
      final response = await http.get(urlLogin);
      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        _commande = Commande.fromJson(data);
        notifyListeners();
      } else {
        Map data = jsonDecode(response.body);
        print('Error--------------------');
      }
    } on SocketException catch (_) {
      print('Error Connexion------------------');
    }
    return _commande!;
  }

  Future<Map<String, dynamic>> deleteCommande(Commande commande) async {
    var resultat;
    try {
      var urldelete =
          Uri.parse('${Services.urlDeletecommande}${commande.idCommande}');
      final response = await http.delete(urldelete);
      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        print(data);
        resultat = {"statut": true, "message": 'Commande suprimé'};
      } else {
        resultat = {"statut": false, "message": 'Commande Not found'};
      }
    } on SocketException catch (_) {
      print('Error Connexion------------------');
      resultat = {"statut": false, "message": 'Error'};
    }
    return resultat;
  }

  Future<Commande> addCommande(Commande commande) async {
    try {
      var urladd = Uri.parse('${Services.urlAddcommande}');
      final response = await http.post(
        urladd,
        headers: <String, String>{
          'Content-type': 'application/json;charset=UTF-8',
        },
        body: jsonEncode(
          commande.toJson(),
        ),
      );
      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        print(data);
        setCommande(
          Commande.fromJson(data),
        );
        notifyListeners();
      } else {
        print('----------Not watch--------');
      }
    } on SocketException catch (_) {
      print('Error Connexion------------------');
    }
    return _commande!;
  }
}
