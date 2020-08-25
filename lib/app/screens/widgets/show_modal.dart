import 'package:comprasdoseuze/app/models/produto.dart';
import 'package:flutter/material.dart';
import 'textformfield.dart';

Future<void> showEditProduct(context, Produto p) async {
  double widthTextField = (MediaQuery.of(context).size.width > 400)
      ? MediaQuery.of(context).size.width * 0.35
      : MediaQuery.of(context).size.width * 0.30;

  var descricao = TextFieldCustom(
    keyboardType: TextInputType.text,
    label: "PRODUTO",
    text: p.descricao,
  );
  var preco = TextFieldCustom(
    keyboardType: TextInputType.numberWithOptions(
      decimal: true,
      signed: false,
    ),
    prefixText: "R\$",
    label: "PREÇO",
    text: p.preco.toStringAsFixed(2),
  );

  var qtdKg = TextFieldCustom(
    keyboardType: TextInputType.numberWithOptions(
      decimal: true,
      signed: false,
    ),
    label: "QTD/KG",
    text: p.qtdKg - p.qtdKg.truncateToDouble() == 0.0
        ? (p.qtdKg.truncate().toString())
        : p.qtdKg.toStringAsFixed(2),
  );

  await showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) => Container(
      padding: EdgeInsets.only(top: 10, bottom: 5),
      height: 250,
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: Text(
                "Editar",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: descricao,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                key: UniqueKey(),
                children: [
                  Expanded(
                    child: Container(
                      width: widthTextField,
                      child: preco,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      width: widthTextField,
                      child: qtdKg,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 0, left: 10, right: 10),
              child: Row(
                key: UniqueKey(),
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RaisedButton(
                    onPressed: () {
                      p.descricao = descricao.ctrl.text;
                      p.preco = double.parse(preco.ctrl.text);
                      p.qtdKg = double.parse(qtdKg.ctrl.text);
                      if (p.total != p.preco * p.qtdKg) p.check = true;
                      p.total = p.preco * p.qtdKg;
                      Navigator.pop(context);
                    },
                    child: Text("Ok"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
