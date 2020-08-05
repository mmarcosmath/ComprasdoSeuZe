import 'package:flutter/material.dart';
import 'package:comprasdoseuze/app/components/custom_textformfield.dart';
import 'package:comprasdoseuze/app/models/produto.dart';

Future<void> showEditProduct(context, Produto p) async {
  double widthTextField = (MediaQuery.of(context).size.width > 400)
      ? MediaQuery.of(context).size.width * 0.35
      : MediaQuery.of(context).size.width * 0.30;

  var descricao = TextFormFieldCustom(
    label: "PRODUTO",
    text: p.descricao,
  );
  var preco = TextFormFieldCustom(
    label: "PREÇO",
    text: p.preco.toStringAsFixed(2),
  );

  var qtdKg = TextFormFieldCustom(
    label: "QTD/KG",
    text: p.qtdKg.toStringAsFixed(2),
  );
  await showModalBottomSheet(
    context: context,
    builder: (context) => Card(
      key: UniqueKey(),
      elevation: 2,
      child: Container(
        padding: EdgeInsets.only(top: 10, bottom: 5),
        height: 250,
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
                    Container(
                      width: widthTextField,
                      child: preco,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: widthTextField,
                      child: qtdKg,
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
    ),
  );
}
