import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController ctrl = TextEditingController();
  final String label;
  CustomTextFormField({this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(5.0),
        child: TextFormField(
          controller: ctrl,
          keyboardType: TextInputType.text,
          cursorColor: Color(0xFF72DADD),
          cursorWidth: 2,
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
            // filled: true,

            // fillColor: Color(0xFF6886A0),
            labelStyle: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 15,
            ),
          ),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
