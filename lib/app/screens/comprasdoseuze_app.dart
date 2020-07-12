import 'dart:convert';

import 'package:flutter/material.dart';
import '../models/data.dart';
import '../models/produto.dart';
import '../components/buy_list.dart';
import '../components/inputs.dart';

import '../components/logo.dart';

class CompasdoSeuZeApp extends StatefulWidget {
  @override
  _CompasdoSeuZeAppState createState() => _CompasdoSeuZeAppState();
}

class _CompasdoSeuZeAppState extends State<CompasdoSeuZeApp> {
  List<Produto> _list = [];
  void addToDo(Produto p) {
    setState(() {
      _list.add(p);
      saveData(_list);
    });
  }

  @override
  void initState() {
    super.initState();

    readData().then((data) {
      setState(() {
        List tempList = json.decode(data);
        _list = tempList.map((e) => Produto.fromMap(e)).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Logo(),
            BuyList(
              productList: _list,
            ),
            Inputs(
              add: addToDo,
            ),
          ],
        ),
      ),
    );
  }
}
