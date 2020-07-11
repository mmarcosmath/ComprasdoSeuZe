import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      color: Theme.of(context).backgroundColor,
      child: Center(
        child: Image.asset(
          'images/logo.png',
          height: MediaQuery.of(context).size.height > 400 ? 120 : 70,
        ),
      ),
    );
  }
}
