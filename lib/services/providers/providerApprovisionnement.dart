import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:flutter/widgets.dart';
import '../../models/approvisionnement.dart';
import '../services.dart';

class ApprovisionnementProvider extends ChangeNotifier {
  Approvisionnement? _approvisionnement;

  Approvisionnement get approvisionnement {
    return _approvisionnement!;
  }

  void setApprovisionnement(Approvisionnement cl) {
    _approvisionnement = cl;
    notifyListeners();
  }

  static Future<List<Approvisionnement>> getApprovisionnements() async {
    var _var;
    try {
      var url = Uri.parse(Services.urlGetapprovisionnement);
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data);
        List _temp = [];

        for (var i in data) {
          _temp.add(i);
        }

        _var = Approvisionnement.ApprovisionnementsFromSnapshots(_temp);

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

  Future<Approvisionnement> getApprovisionnement(
      Approvisionnement approvisionnement) async {
    try {
      var urlLogin = Uri.parse(
          '${Services.urlGetapprovisionnementById}${approvisionnement.idApprovisionnement}');
      final response = await http.get(urlLogin);
      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        _approvisionnement =
            Approvisionnement.fromJson(data['approvisionnement']);
        notifyListeners();
      } else {
        Map data = jsonDecode(response.body);
        print('Error--------------------');
      }
    } on SocketException catch (_) {
      print('Error Connexion------------------');
    }
    return _approvisionnement!;
  }

  Future<Map<String, dynamic>> deleteApprovisionnement(
      Approvisionnement approvisionnement) async {
    var resultat;
    try {
      var urldelete = Uri.parse(
          '${Services.urlDeleteapprovisionnement}${approvisionnement.idApprovisionnement}');
      final response = await http.delete(urldelete);
      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        print(data);
        resultat = {"statut": true, "message": 'Approvisionnement suprimé'};
      } else {
        resultat = {"statut": false, "message": 'Approvisionnement Not found'};
      }
    } on SocketException catch (_) {
      print('Error Connexion------------------');
      resultat = {"statut": false, "message": 'Error'};
    }
    return resultat;
  }

  Future<Approvisionnement> addApprovisionnement(
      Approvisionnement approvisionnement) async {
    try {
      var urladd = Uri.parse('${Services.urlAddapprovisionnement}');
      final response = await http.post(
        urladd,
        headers: <String, String>{
          'Content-type': 'application/json;charset=UTF-8',
        },
        body: jsonEncode(
          approvisionnement.toJson(),
        ),
      );
      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        print(data);
        setApprovisionnement(
          Approvisionnement.fromJson(data),
        );
        notifyListeners();
      } else {
        print('----------Not watch--------');
      }
    } on SocketException catch (_) {
      print('Error Connexion------------------');
    }
    return _approvisionnement!;
  }
}
