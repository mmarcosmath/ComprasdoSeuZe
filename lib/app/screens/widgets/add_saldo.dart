import 'package:flutter/material.dart';

import 'textformfield.dart';

Future<void> addSaldo(context) async {
  await showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      key: UniqueKey(),
      elevation: 2,
      children: [
        Center(
          child: Text(
            "Adicionar Saldo",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFieldCustom(
            label: "SALDO",
            text: '',
            prefixText: "R\$",
            keyboardType: TextInputType.numberWithOptions(
              decimal: true,
              signed: false,
            ),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 10, bottom: 0, left: 10, right: 10),
          child: Row(
            key: UniqueKey(),
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              RaisedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Ok"),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
