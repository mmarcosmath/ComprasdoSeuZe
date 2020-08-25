import 'package:comprasdoseuze/app/data/list_products_data.dart';
import 'package:comprasdoseuze/app/models/produto.dart';
import 'package:comprasdoseuze/app/screens/widgets/button_add.dart';
import 'package:comprasdoseuze/app/screens/widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Inputs extends StatelessWidget {
  final descricao = TextFieldCustom(
    label: "PRODUTO",
    keyboardType: TextInputType.text,
  );

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    Function(Produto produto) add =
        Provider.of<ListProductData>(context).addProduct;

    void _cleanTextFields() {
      descricao.ctrl.clear();
    }

    return Container(
      height: 100,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: theme.accentColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(child: descricao),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            child: ButtonAdd(),
            onTap: () {
              add(
                Produto(
                  descricao: descricao.ctrl.text,
                ),
              );
              _cleanTextFields();
            },
          ),
        ],
      ),
    );
  }
}
