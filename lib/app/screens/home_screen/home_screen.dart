import '../../screens/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'widgets/buy_list.dart';
import 'widgets/inputs.dart';
import '../../screens/widgets/logo.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      title: Logo(),
    );
    double _maxHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        appBar.preferredSize.height;

    double _maxWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: appBar,
      drawer: CustomDrawer(),
      body: SafeArea(
        child: Container(
          height: _maxHeight,
          width: _maxWidth,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: _maxHeight - 150,
                  child: BuyList(),
                ),
                Inputs(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
