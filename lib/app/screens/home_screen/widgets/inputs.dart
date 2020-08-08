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
  final preco = TextFieldCustom(
    label: "PREÇO",
    prefixText: "R\$",
    keyboardType: TextInputType.numberWithOptions(
      decimal: true,
      signed: false,
    ),
  );
  final qtdKg = TextFieldCustom(
    label: "QTD/KG",
    keyboardType: TextInputType.numberWithOptions(
      decimal: true,
      signed: false,
    ),
  );

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    Function(Produto produto) add =
        Provider.of<ListProductData>(context).addProduct;

    void _cleanTextFields() {
      descricao.ctrl.clear();
      preco.ctrl.clear();
      qtdKg.ctrl.clear();
    }

    return Container(
      height: 150,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: theme.accentColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          descricao,
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(child: preco),
                SizedBox(
                  width: 10,
                ),
                Flexible(child: qtdKg),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  child: ButtonAdd(),
                  onTap: () {
                    add(
                      Produto(
                        descricao: descricao.ctrl.text,
                        preco: double.parse(preco.ctrl.text),
                        qtdKg: double.parse(qtdKg.ctrl.text),
                        total: double.parse(qtdKg.ctrl.text) *
                            double.parse(preco.ctrl.text),
                        check: true,
                      ),
                    );
                    _cleanTextFields();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
