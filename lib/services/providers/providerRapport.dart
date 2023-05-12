import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:tilappro/models/stock_model.dart';
import '../../models/rapport.dart';
import '../services.dart';

class RapportProvider extends ChangeNotifier {
  Rapport? _rapport;

  Rapport get rapport {
    return _rapport!;
  }

  void setRapport(Rapport cl) {
    _rapport = cl;
    notifyListeners();
  }

  static Future<List<Rapport>> getRapports() async {
    var _var;
    try {
      var url = Uri.parse(Services.urlGetRapport);
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data);
        List _temp = [];

        for (var i in data) {
          _temp.add(i);
        }

        _var = Rapport.RapportsFromSnapshots(_temp);

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

  Future<Rapport> getRapport(Rapport rapport) async {
    try {
      var urlLogin =
          Uri.parse('${Services.urlGetRapportById}${rapport.idRapport}');
      final response = await http.get(urlLogin);
      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        _rapport = Rapport.fromJson(data);
        notifyListeners();
      } else {
        Map data = jsonDecode(response.body);
        print('Error--------------------');
      }
    } on SocketException catch (_) {
      print('Error Connexion------------------');
    }
    return _rapport!;
  }

  Future<Map<String, dynamic>> deleteRapport(Rapport rapport) async {
    var resultat;
    try {
      var urldelete =
          Uri.parse('${Services.urlDeleteRapport}${rapport.idRapport}');
      final response = await http.delete(urldelete);
      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        print(data);
        resultat = {"statut": true, "message": 'Rapport suprimé'};
      } else {
        resultat = {"statut": false, "message": 'Rapport Not found'};
      }
    } on SocketException catch (_) {
      print('Error Connexion------------------');
      resultat = {"statut": false, "message": 'Error'};
    }
    return resultat;
  }

  Future<Rapport> addRapport(Rapport rapport) async {
    try {
      var urladd = Uri.parse('${Services.urlAddRapport}');
      final response = await http.post(
        urladd,
        headers: <String, String>{
          'Content-type': 'application/json;charset=UTF-8',
        },
        body: jsonEncode(
          rapport.toJson(),
        ),
      );
      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        print(data);
        setRapport(
          Rapport.fromJson(data),
        );
        notifyListeners();
      } else {
        print('----------Not watch--------');
      }
    } on SocketException catch (_) {
      print('Error Connexion------------------');
    }
    return _rapport!;
  }
}
