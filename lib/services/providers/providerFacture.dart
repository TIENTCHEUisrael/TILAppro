import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:flutter/widgets.dart';
import '../../models/facture.dart';
import '../services.dart';

class FactureProvider extends ChangeNotifier {
  Facture? _facture;
  Facture get facture {
    return _facture!;
  }

  void setFacture(Facture cl) {
    _facture = cl;
    notifyListeners();
  }

  static Future<List<Facture>> getFactures() async {
    var _var;
    try {
      var url = Uri.parse(Services.urlGetfacture);
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data);
        List _temp = [];

        for (var i in data) {
          _temp.add(i);
        }

        _var = Facture.FacturesFromSnapshots(_temp);

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

  Future<Facture> getFacture(Facture facture) async {
    try {
      var urlLogin =
          Uri.parse('${Services.urlGetfactureById}${facture.idFacture}');
      final response = await http.get(urlLogin);
      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        _facture = Facture.fromJson(data);
        notifyListeners();
      } else {
        Map data = jsonDecode(response.body);
        print('Error--------------------');
      }
    } on SocketException catch (_) {
      print('Error Connexion------------------');
    }
    return _facture!;
  }

  Future<Map<String, dynamic>> deleteFacture(Facture facture) async {
    var resultat;
    try {
      var urldelete =
          Uri.parse('${Services.urlDeletefacture}${facture.idFacture}');
      final response = await http.delete(urldelete);
      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        print(data);
        resultat = {"statut": true, "message": 'Facture suprimé'};
      } else {
        resultat = {"statut": false, "message": 'Facture Not found'};
      }
    } on SocketException catch (_) {
      print('Error Connexion------------------');
      resultat = {"statut": false, "message": 'Error'};
    }
    return resultat;
  }

  Future<Facture> addFacture(Facture facture) async {
    try {
      var urladd = Uri.parse('${Services.urlAddfacture}');
      final response = await http.post(
        urladd,
        headers: <String, String>{
          'Content-type': 'application/json;charset=UTF-8',
        },
        body: jsonEncode(
          facture.toJson(),
        ),
      );
      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        print(data);
        setFacture(
          Facture.fromJson(data),
        );
        notifyListeners();
      } else {
        print('----------Not watch--------');
      }
    } on SocketException catch (_) {
      print('Error Connexion------------------');
    }
    return _facture!;
  }
}
