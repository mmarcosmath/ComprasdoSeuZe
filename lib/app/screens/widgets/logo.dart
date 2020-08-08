import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.symmetric(vertical: 5),
      color: Theme.of(context).backgroundColor,
      child: Image.asset(
        'images/back.png',
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
