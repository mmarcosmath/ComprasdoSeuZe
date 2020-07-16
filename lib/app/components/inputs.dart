import 'package:flutter/material.dart';
import '../models/produto.dart';
import 'textformfield.dart';
import 'button_add.dart';

class Inputs extends StatelessWidget {
  final Function(Produto produto) add;
  final descricao = CustomTextFormField(label: "PRODUTO");
  final preco = CustomTextFormField(label: "PREÇO");
  final qtdKg = CustomTextFormField(label: "QTD/KG");
  final bool buyingList;
  Inputs({this.buyingList = false, this.add});

  Column _contentInput() {
    return buyingList
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  descricao,
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    child: ButtonAdd(),
                    onTap: () {
                      add(
                        Produto(
                          descricao: descricao.ctrl.text,
                          preco: 0,
                          qtdKg: 0,
                          total: 0,
                        ),
                      );
                    },
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
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    preco,
                    SizedBox(
                      width: 10,
                    ),
                    qtdKg,
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
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          );
  }

  @override
  Widget build(BuildContext context) {
    // print(MediaQuery.of(context).size.height);
    return Container(
      padding: const EdgeInsets.all(10),
      height: buyingList
          ? MediaQuery.of(context).size.height * .20
          : MediaQuery.of(context).size.height * .25,
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
