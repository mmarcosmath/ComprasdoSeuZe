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
  List<Produto> list = [];
  void addToDo(Produto p) {
    print(p.descricao);
    setState(() {
      list.add(p);
      saveData(list);
    });
  }

  @override
  void initState() {
    super.initState();

    readData().then((data) {
      setState(() {
        List tempList = json.decode(data);
        list = tempList.map((e) => Produto.fromMap(e)).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double _maxHeight() =>
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    double _maxWidth() => MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: _maxHeight(),
          width: _maxWidth(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Logo(
                  maxHeight: _maxHeight(),
                  buyingList: false,
                  ctx: context,
                ),
                Container(
                  height: (MediaQuery.of(context).size.height > 600)
                      ? _maxHeight() * 0.55
                      : _maxHeight() * 0.50,
                  child: BuyList(
                    buyingList: false,
                    productList: list,
                  ),
                ),
                Inputs(
                  maxHeight: _maxHeight(),
                  buyingList: false,
                  add: addToDo,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
