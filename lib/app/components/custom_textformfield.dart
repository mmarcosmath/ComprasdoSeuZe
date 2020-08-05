import 'package:flutter/material.dart';

class TextFormFieldCustom extends StatelessWidget {
  final TextEditingController ctrl = TextEditingController();
  final String text;
  final String label;
  TextFormFieldCustom({@required this.label, @required this.text}) {
    ctrl.text = text;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: UniqueKey(),
      autocorrect: true,
      controller: ctrl,
      keyboardType: TextInputType.text,
      cursorColor: Color(0xFF72DADD),
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFF6886A0),
        hoverColor: Colors.white,
        hintText: label,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 3,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 3,
          ),
        ),
        hintStyle: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: 15,
        ),
        contentPadding: EdgeInsets.all(8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        labelStyle: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: 15,
        ),
      ),
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Theme.of(context).primaryColor,
        fontSize: 20,
      ),
    );
  }
}
