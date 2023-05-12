import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:flutter/widgets.dart';
import '../../models/user/LogUser.dart';
import '../../models/user/user_model.dart';
import '../services.dart';

enum Statut {
  registing,
  registed,
  notregisted,
  authenticating,
  authenticated,
  notauthenticate,
  updating,
  updated,
  notupdated,
  deleting,
  deleted,
  notdeleted,
}

class AuthProvider extends ChangeNotifier {
  User? _user;
  Statut _logStatus = Statut.notauthenticate;
  Statut _updateStatus = Statut.notupdated;
  Statut _registerStatus = Statut.notregisted;
  Statut _deleteStatus = Statut.notdeleted;

  User get user {
    return _user!;
  }

  void setUSer(User us) {
    _user = us;
    notifyListeners();
  }

  Statut get logStatus => _logStatus;
  set logStatus(Statut value) {
    _logStatus = value;
  }

  Statut get updateStatus => _updateStatus;
  set updateStatus(Statut value) {
    _updateStatus = value;
  }

  Statut get registerStatus => _registerStatus;
  set registerStatus(Statut value) {
    _registerStatus = value;
  }

  Statut get deleteStatus => _deleteStatus;
  set deleteStatus(Statut value) {
    _deleteStatus = value;
  }

  Future<User> loginUser(LogUser userlg) async {
    try {
      var urlLogin = Uri.parse('${Services.urlLogin}');
      _logStatus = Statut.authenticating;
      notifyListeners();
      final response = await http.post(
        urlLogin,
        headers: <String, String>{
          'Content-type': 'application/json;charset=UTF-8',
        },
        body: jsonEncode(userlg.toJson()),
      );
      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        _user = User.fromJson(data);
        _logStatus = Statut.authenticated;
        notifyListeners();

        print('--------------------Getted---------------------');
      } else {
        _logStatus = Statut.notauthenticate;
        notifyListeners();
        Map data = jsonDecode(response.body);
        print('Error--------------------');
      }
    } on SocketException catch (_) {
      print('Error------------------');
    }
    return _user!;
  }

  Future<User> getUser(User user) async {
    print('---6Enter----------');
    try {
      var urlLogin = Uri.parse('${Services.urlGetUserById}${user.idUser}');
      final response = await http.get(urlLogin);
      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        print(data);
        _user = User.fromJson(data);
        notifyListeners();
      } else {
        Map data = jsonDecode(response.body);
        print('Error--------------------');
      }
    } on SocketException catch (_) {
      print('Error Connexion------------------');
    }
    return _user!;
  }

  static Future<List<User>> getUsers() async {
    var _var;
    try {
      var url = Uri.parse(Services.urlGetUsers);
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data);
        List _temp = [];

        for (var i in data) {
          _temp.add(i);
        }

        _var = User.usersFromSnapshots(_temp);

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

  Future<Map<String, dynamic>> deleteUser(User user) async {
    var resultat;
    try {
      var urldelete = Uri.parse('${Services.urlDeleteUser}${user.idUser}');
      final response = await http.delete(urldelete);
      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        print(data);
        resultat = {"statut": true, "message": 'User Deleted'};
      } else {
        resultat = {"statut": false, "message": 'User Not found'};
      }
    } on SocketException catch (_) {
      print('Error Connexion------------------');
      resultat = {"statut": false, "message": 'Error'};
    }
    return resultat;
  }

  Future<User> saveUser(User invest) async {
    try {
      var urladd = Uri.parse('${Services.urlAddUser}');
      final response = await http.post(
        urladd,
        headers: <String, String>{
          'Content-type': 'application/json;charset=UTF-8',
        },
        body: jsonEncode(
          invest.toJson(),
        ),
      );
      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        print(data);
        setUSer(
          User.fromJson(data),
        );
        notifyListeners();
      } else {
        print('----------Not watch--------');
      }
    } on SocketException catch (_) {
      print('Error Connexion------------------');
    }
    return _user!;
  }

  Future<User> updateUser(User user) async {
    print('-----------------Enter--------------------');
    try {
      var urlupdate = Uri.parse('${Services.urlUpdateUser}/${user.idUser}');
      _logStatus = Statut.updating;
      notifyListeners();
      final response = await http.put(
        urlupdate,
        headers: <String, String>{
          'Content-type': 'application/json;charset=UTF-8',
        },
        body: jsonEncode(user.toJson()),
      );

      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        setUSer(User.fromJson(data));
        _logStatus = Statut.updated;
        notifyListeners();
      } else {
        _logStatus = Statut.notupdated;
        notifyListeners();
        Map data = jsonDecode(response.body);
        print('Error--------------------');
      }
    } on SocketException catch (_) {
      print('Error------------------');
    }
    return _user!;
  }
}
