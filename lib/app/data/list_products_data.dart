import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '../models/produto.dart';

class ListProductData with ChangeNotifier {
  List<Produto> _list = [];
  ListProductData() {
    _read();
  }

  Future<File> getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json");
  }

  void saveData(List<Produto> list) async {
    String data = json.encode(list.map((e) => e.toMap()).toList());
    final file = await getFile();
    file.writeAsString(data);
    _read();
  }

  Future<String> readData() async {
    try {
      final file = await getFile();

      return file.readAsString();
    } catch (e) {
      return null;
    }
  }

  void _read() {
    readData().then((data) {
      List tempList = json.decode(data);
      _list = tempList.isEmpty
          ? []
          : tempList.map((e) => Produto.fromMap(e)).toList();
      notifyListeners();
    });
  }

  List<Produto> get items {
    _read();
    return [..._list];
  }

  void addProduct(Produto product) {
    _list.add(product);
    saveData(items);
    _read();
    notifyListeners();
  }
}
