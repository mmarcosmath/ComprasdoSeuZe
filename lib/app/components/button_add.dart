import 'package:flutter/material.dart';

class ButtonAdd extends StatelessWidget {
  const ButtonAdd({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        border: Border.all(
          width: 3,
          color: Theme.of(context).primaryColor,
        ),
        shape: BoxShape.circle,
        color: Color(0xFF111D7F),
      ),
      child: Icon(
        Icons.add,
        size: 50,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
