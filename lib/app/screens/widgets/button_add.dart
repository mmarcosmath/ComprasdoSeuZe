import 'package:flutter/material.dart';

class ButtonAdd extends StatelessWidget {
  const ButtonAdd({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        border: Border.all(
          width: 3,
          color: theme.primaryColor,
        ),
        shape: BoxShape.circle,
        color: Color(0xFF111D7F),
      ),
      child: Icon(
        Icons.add,
        size: 50,
        color: theme.primaryColor,
      ),
    );
  }
}
