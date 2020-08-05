import 'package:flutter/material.dart';
import '../components/buy_list.dart';
import '../components/inputs.dart';
import '../components/logo.dart';

class CompasdoSeuZeApp extends StatelessWidget {
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
                    key: UniqueKey(),
                    buyingList: false,
                  ),
                ),
                Inputs(
                  maxHeight: _maxHeight(),
                  buyingList: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
