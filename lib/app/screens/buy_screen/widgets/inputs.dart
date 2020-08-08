import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/list_products_data.dart';
import '../../../models/produto.dart';
import '../../widgets/textformfield.dart';
import '../../widgets/button_add.dart';

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
