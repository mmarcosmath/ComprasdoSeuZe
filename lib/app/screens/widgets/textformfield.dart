import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final TextEditingController ctrl = TextEditingController();
  final TextInputType keyboardType;
  final String text;
  final String prefixText;

  final String label;
  TextFieldCustom({
    @required this.label,
    this.text,
    this.keyboardType,
    this.prefixText,
  }) {
    ctrl.text = text;
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return TextField(
      key: UniqueKey(),
      autocorrect: true,
      controller: ctrl,
      keyboardType: keyboardType,
      cursorColor: Color(0xFF72DADD),
      decoration: InputDecoration(
        prefixText: prefixText,
        filled: true,
        fillColor: Color(0xFF6886A0),
        hoverColor: Colors.white,
        hintText: label,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: theme.primaryColor,
            width: 3,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: theme.primaryColor,
            width: 3,
          ),
        ),
        hintStyle: TextStyle(
          color: theme.primaryColor,
          fontSize: 15,
        ),
        contentPadding: EdgeInsets.all(8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        labelStyle: TextStyle(
          color: theme.primaryColor,
          fontSize: 15,
        ),
      ),
      textAlign: TextAlign.center,
      style: TextStyle(
        color: theme.primaryColor,
        fontSize: 20,
      ),
    );
  }
}
