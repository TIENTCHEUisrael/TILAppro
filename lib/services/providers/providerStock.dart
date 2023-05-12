import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:flutter/widgets.dart';
import '../../models/stock_model.dart';
import '../services.dart';

class StockProvider extends ChangeNotifier {
  Stock? _stock;

  Stock get stock {
    return _stock!;
  }

  void setStock(Stock cl) {
    _stock = cl;
    notifyListeners();
  }

  static Future<List<Stock>> getStocks() async {
    var _var;
    try {
      var url = Uri.parse(Services.urlGetStock);
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data);
        List _temp = [];

        for (var i in data) {
          _temp.add(i);
        }

        _var = Stock.StocksFromSnapshots(_temp);

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

  Future<Stock> getStock(Stock stock) async {
    try {
      var urlLogin = Uri.parse('${Services.urlGetStockById}${stock.idStock}');
      final response = await http.get(urlLogin);
      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        _stock = Stock.fromJson(data);
        notifyListeners();
      } else {
        Map data = jsonDecode(response.body);
        print('Error--------------------');
      }
    } on SocketException catch (_) {
      print('Error Connexion------------------');
    }
    return _stock!;
  }

  Future<Map<String, dynamic>> deleteStock(Stock stock) async {
    var resultat;
    try {
      var urldelete = Uri.parse('${Services.urlDeleteStock}${stock.idStock}');
      final response = await http.delete(urldelete);
      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        print(data);
        resultat = {"statut": true, "message": 'Stock suprimé'};
      } else {
        resultat = {"statut": false, "message": 'Stock Not found'};
      }
    } on SocketException catch (_) {
      print('Error Connexion------------------');
      resultat = {"statut": false, "message": 'Error'};
    }
    return resultat;
  }

  Future<Stock> addStock(Stock stock) async {
    try {
      var urladd = Uri.parse('${Services.urlAddStock}');
      final response = await http.post(
        urladd,
        headers: <String, String>{
          'Content-type': 'application/json;charset=UTF-8',
        },
        body: jsonEncode(
          stock.toJson(),
        ),
      );
      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        print(data);
        setStock(
          Stock.fromJson(data),
        );
        notifyListeners();
      } else {
        print('----------Not watch--------');
      }
    } on SocketException catch (_) {
      print('Error Connexion------------------');
    }
    return _stock!;
  }

  Future<Stock> updateStock(Stock stock) async {
    print('-----------------Enter--------------------');
    try {
      var urlupdate = Uri.parse('${Services.urlUpdateStock}/${stock.idStock}');
      notifyListeners();
      final response = await http.put(
        urlupdate,
        headers: <String, String>{
          'Content-type': 'application/json;charset=UTF-8',
        },
        body: jsonEncode(stock.toJson()),
      );

      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        setStock(Stock.fromJson(data));
        notifyListeners();
      } else {
        Map data = jsonDecode(response.body);
        print('Error--------------------');
      }
    } on SocketException catch (_) {
      print('Error------------------');
    }
    return _stock!;
  }
}
