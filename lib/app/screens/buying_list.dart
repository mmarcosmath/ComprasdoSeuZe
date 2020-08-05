import 'package:flutter/material.dart';
import '../components/buy_list.dart';
import '../components/inputs.dart';
import '../components/logo.dart';

class BuyingList extends StatelessWidget {
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
                ),
              ),
              Inputs(
                maxHeight: _maxHeight(),
                buyingList: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
