import 'package:flutter/material.dart';
import 'components/buy_list.dart';
import 'components/inputs.dart';

import 'components/logo.dart';

class CompasdoSeuZeApp extends StatefulWidget {
  @override
  _CompasdoSeuZeAppState createState() => _CompasdoSeuZeAppState();
}

class _CompasdoSeuZeAppState extends State<CompasdoSeuZeApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Logo(),
            BuyList(),
            Inputs(),
          ],
        ),
      ),
    );
  }
}
