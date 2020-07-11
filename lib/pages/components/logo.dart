import 'package:flutter/material.dart';
import 'package:quitandadoseuze/pages/components/popop_menu.dart';

class Logo extends StatelessWidget {
  final BuildContext ctx;
  final bool buyingList;
  Logo({this.buyingList = false, this.ctx});
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
      padding: EdgeInsets.symmetric(vertical: 10),
      color: Theme.of(context).backgroundColor,
      child: Stack(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: Image.asset(
              'images/logo.png',
              height: MediaQuery.of(context).size.height > 400 ? 120 : 70,
            ),
          ),
          _contentLogo(),
        ],
      ),
    );
  }
}
