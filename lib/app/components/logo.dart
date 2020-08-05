import 'package:flutter/material.dart';
import 'popop_menu.dart';

class Logo extends StatelessWidget {
  final BuildContext ctx;
  final bool buyingList;
  final double maxHeight;
  Logo({this.buyingList = false, this.ctx, this.maxHeight});
  @override
  Widget build(BuildContext context) {
    Align _contentLogo() {
      return buyingList
          ? Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  size: 40,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.pop(this.ctx),
              ),
            )
          : Align(
              alignment: Alignment.topRight,
              child: CustomPopupMenu(),
            );
    }

    return Container(
      height: maxHeight * 0.2,
      padding: EdgeInsets.symmetric(vertical: 10),
      color: Theme.of(context).backgroundColor,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            child: Image.asset(
              'images/back.png',
              height: MediaQuery.of(context).size.height > 400 ? 120 : 70,
            ),
          ),
          _contentLogo(),
        ],
      ),
    );
  }
}
