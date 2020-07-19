import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/data.dart';
import '../models/produto.dart';
import '../components/buy_list.dart';
import '../components/inputs.dart';
import '../components/logo.dart';

class BuyingList extends StatefulWidget {
  @override
  _BuyingListState createState() => _BuyingListState();
}

class _BuyingListState extends State<BuyingList> {
  List<Produto> list = [];
  void addToDo(Produto p) {
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
        List tempList = json.decode(data ?? '');
        list = tempList.map((e) => Produto.fromMap(e)).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double _maxHeight() =>
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ListBody(
            children: [
              Logo(
                buyingList: true,
                ctx: context,
                maxHeight: _maxHeight(),
              ),
              Container(
                height: _maxHeight() * 0.60,
                child: BuyList(
                  buyingList: true,
                  productList: list,
                ),
              ),
              Inputs(
                maxHeight: _maxHeight(),
                buyingList: true,
                add: addToDo,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
