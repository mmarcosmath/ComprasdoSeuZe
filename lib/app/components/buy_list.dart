import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quitandadoseuze/app/data/list_products_data.dart';
import '../models/produto.dart';
import 'add_saldo.dart';
import 'custom_textformfield.dart';

class BuyList extends StatelessWidget {
  final bool buyingList;

  const BuyList({Key key, this.buyingList}) : super(key: key);
  // = [
  //   Produto(descricao: 'Leite', id: 1, preco: 10, qtdKg: 5, total: 50),
  //   Produto(descricao: 'Leite', id: 1, preco: 10, qtdKg: 5, total: 50),
  //   Produto(descricao: 'Leite', id: 1, preco: 10, qtdKg: 5, total: 50),
  //   Produto(descricao: 'Leite', id: 1, preco: 10, qtdKg: 5, total: 50),
  //   Produto(descricao: 'Leite', id: 1, preco: 10, qtdKg: 5, total: 50),
  //   Produto(descricao: 'Leite', id: 1, preco: 10, qtdKg: 5, total: 50),
  // ];

  @override
  Widget build(BuildContext context) {
    ListProductData products =
        Provider.of<ListProductData>(context, listen: true);
    var listProducts = [...products.items];
    String total() {
      if (listProducts.isEmpty) return '0.00';
      var total = listProducts
          .map((e) => e.total)
          .reduce((element1, element2) => element1 + element2)
          .toStringAsFixed(2);
      return '$total';
    }

    Widget _subtitle(Produto product) {
      if (!buyingList) {
        return Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Text('R\$ ${product.preco.toStringAsFixed(2)}'),
            ),
            Text('x ${product.qtdKg.toStringAsFixed(2)}'),
          ],
        );
      }
      return null;
    }

    Widget _trailling(Produto product) {
      if (buyingList) {
        return product.check
            ? Image.asset(
                "images/check.png",
                fit: BoxFit.cover,
                height: 25,
              )
            : null;
      }
      return Text('${product.total.toStringAsFixed(2)}');
    }

    Widget _label() {
      if (buyingList) {
        return Center(
          child: Text(
            "Lista de Compras",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        );
      }

      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Total",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            "R\$ ${total()}",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      );
    }

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
      print("object");
      await showDialog(
        context: context,
        builder: (context) => Dialog(
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

    return Container(
      color: Theme.of(context).backgroundColor,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -4),
              blurRadius: 4,
              color: Colors.black26,
            )
          ],
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                child: Text(
                  "Adicionar Saldo",
                  style: TextStyle(
                    color: Theme.of(context).backgroundColor,
                    fontSize: 10,
                  ),
                ),
                onTap: () => addSaldo(context),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: _label(),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(0),
                itemCount: listProducts.length,
                itemBuilder: (BuildContext context, int index) {
                  var product = listProducts[index];
                  return GestureDetector(
                    onTap: () {
                      print("object");
                      showEditProduct(context, product)
                          .then((value) => products.saveData(listProducts));
                    },
                    child: Dismissible(
                      key: UniqueKey(),
                      onDismissed: (dismissed) {},
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            child: ListTile(
                              title: Text(product.descricao),
                              trailing: _trailling(product),
                              subtitle: _subtitle(product),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
