import 'package:flutter/material.dart';
import 'package:quitandadoseuze/app/models/data.dart';
import '../models/produto.dart';
import 'textformfield.dart';
import 'button_add.dart';

class Inputs extends StatelessWidget {
  final Function(Produto produto) add;
  final descricao = CustomTextFormField(label: "PRODUTO");
  final preco = CustomTextFormField(label: "PREÇO");
  final qtdKg = CustomTextFormField(label: "QTD/KG");
  final bool buyingList;
  final double maxHeight;
  Inputs({this.buyingList = false, this.add, this.maxHeight});

  Column _contentInput() {
    return buyingList
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: descricao,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    child: ButtonAdd(),
                    onTap: () => add(
                      Produto(
                        descricao: descricao.ctrl.text,
                        preco: 0,
                        qtdKg: 0,
                        total: 0,
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        : Column(
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
                      onTap: () => add(
                        Produto(
                          descricao: descricao.ctrl.text,
                          preco: double.parse(preco.ctrl.text),
                          qtdKg: double.parse(qtdKg.ctrl.text),
                          total: double.parse(qtdKg.ctrl.text) *
                              double.parse(preco.ctrl.text),
                          check: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
  }

  @override
  Widget build(BuildContext context) {
    // print(MediaQuery.of(context).size.height);
    double _height() {
      if (buyingList) return maxHeight * .20;

      if (MediaQuery.of(context).size.height > 600) return maxHeight * .25;
      return maxHeight * .30;
    }

    return Container(
      padding: const EdgeInsets.all(10),
      height: _height(),
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: _contentInput(),
    );
  }
}
