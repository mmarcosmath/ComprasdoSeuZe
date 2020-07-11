import 'package:flutter/material.dart';

import 'components/buy_list.dart';
import 'components/inputs.dart';
import 'components/logo.dart';

class BuyingList extends StatefulWidget {
  @override
  _BuyingListState createState() => _BuyingListState();
}

class _BuyingListState extends State<BuyingList> {
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
            ),
            Inputs(
              buyingList: true,
            ),
          ],
        ),
      ),
    );
  }
}
