import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:flutter/widgets.dart';
import '../../models/produit.dart';
import '../services.dart';

class ProduitProvider extends ChangeNotifier {
  Produit? _produit;

  Produit get produit {
    return _produit!;
  }

  void setProduit(Produit cl) {
    _produit = cl;
    notifyListeners();
  }

  static Future<List<Produit>> getProduits() async {
    var _var;
    try {
      var url = Uri.parse(Services.urlGetProduit);
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data);
        List _temp = [];

        for (var i in data) {
          _temp.add(i);
        }
        print('------------');
        _var = Produit.ProduitsFromSnapshots(_temp);

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

  Future<Produit> getProduit(Produit produit) async {
    try {
      var urlLogin =
          Uri.parse('${Services.urlGetProduitById}${produit.idProduit}');
      final response = await http.get(urlLogin);
      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        _produit = Produit.fromJson(data);
        notifyListeners();
      } else {
        Map data = jsonDecode(response.body);
        print('Error--------------------');
      }
    } on SocketException catch (_) {
      print('Error Connexion------------------');
    }
    return _produit!;
  }

  Future<Map<String, dynamic>> deleteProduit(Produit produit) async {
    var resultat;
    try {
      var urldelete =
          Uri.parse('${Services.urlDeleteProduit}${produit.idProduit}');
      final response = await http.delete(urldelete);
      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        print(data);
        resultat = {"statut": true, "message": 'Produit suprimé'};
      } else {
        resultat = {"statut": false, "message": 'Produit Not found'};
      }
    } on SocketException catch (_) {
      print('Error Connexion------------------');
      resultat = {"statut": false, "message": 'Error'};
    }
    return resultat;
  }

  Future<Produit> addProduit(Produit produit) async {
    try {
      var urladd = Uri.parse('${Services.urlAddProduit}');
      final response = await http.post(
        urladd,
        headers: <String, String>{
          'Content-type': 'application/json;charset=UTF-8',
        },
        body: jsonEncode(
          produit.toJson(),
        ),
      );
      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        print(data);
        setProduit(
          Produit.fromJson(data),
        );
        notifyListeners();
      } else {
        print('----------Not watch--------');
      }
    } on SocketException catch (_) {
      print('Error Connexion------------------');
    }
    return _produit!;
  }
}
