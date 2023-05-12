import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:flutter/widgets.dart';
import '../../models/fournisseur.dart';
import '../services.dart';

class FournisseurProvider extends ChangeNotifier {
  Fournisseur? _fournisseur;

  Fournisseur get fournisseur {
    return _fournisseur!;
  }

  void setFournisseur(Fournisseur cl) {
    _fournisseur = cl;
    notifyListeners();
  }

  static Future<List<Fournisseur>> getFournisseurs() async {
    var _var;
    try {
      var url = Uri.parse(Services.urlGetfournisseur);
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data);
        List _temp = [];

        for (var i in data) {
          _temp.add(i);
        }

        _var = Fournisseur.FournisseursFromSnapshots(_temp);

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

  Future<Fournisseur> getFournisseur(Fournisseur fournisseur) async {
    try {
      var urlLogin = Uri.parse(
          '${Services.urlGetfournisseurById}${fournisseur.idFournisseur}');
      final response = await http.get(urlLogin);
      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);

        _fournisseur = Fournisseur.fromJson(data);
        notifyListeners();
      } else {
        Map data = jsonDecode(response.body);
        print('Error--------------------');
      }
    } on SocketException catch (_) {
      print('Error Connexion------------------');
    }
    return _fournisseur!;
  }

  Future<Map<String, dynamic>> deleteFournisseur(
      Fournisseur fournisseur) async {
    var resultat;
    try {
      var urldelete = Uri.parse(
          '${Services.urlDeletefournisseur}${fournisseur.idFournisseur}');
      final response = await http.delete(urldelete);
      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        print(data);
        resultat = {"statut": true, "message": 'Fournisseur suprimé'};
      } else {
        resultat = {"statut": false, "message": 'Fournisseur Not found'};
      }
    } on SocketException catch (_) {
      print('Error Connexion------------------');
      resultat = {"statut": false, "message": 'Error'};
    }
    return resultat;
  }

  Future<Fournisseur> addFournisseur(Fournisseur fournisseur) async {
    try {
      var urladd = Uri.parse('${Services.urlAddfournisseur}');
      final response = await http.post(
        urladd,
        headers: <String, String>{
          'Content-type': 'application/json;charset=UTF-8',
        },
        body: jsonEncode(
          fournisseur.toJson(),
        ),
      );
      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        print(data);
        setFournisseur(
          Fournisseur.fromJson(data),
        );
        notifyListeners();
      } else {
        print('----------Not watch--------');
      }
    } on SocketException catch (_) {
      print('Error Connexion------------------');
    }
    return _fournisseur!;
  }
}
