import 'dart:convert';

import 'package:flutter/material.dart';
import '../models/data.dart';
import '../models/produto.dart';

import 'components/buy_list.dart';
import 'components/inputs.dart';
import 'components/logo.dart';

class BuyingList extends StatefulWidget {
  @override
  _BuyingListState createState() => _BuyingListState();
}

class _BuyingListState extends State<BuyingList> {
  List<Produto> _list = [];
  void addToDo(Produto p) {
    print(p.descricao);
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
            Logo(
              buyingList: true,
              ctx: context,
            ),
            BuyList(
              buyingList: true,
              productList: _list,
            ),
            Inputs(
              buyingList: true,
              add: addToDo,
            ),
          ],
        ),
      ),
    );
  }
}
