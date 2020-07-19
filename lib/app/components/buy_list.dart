import 'package:flutter/material.dart';
import 'package:quitandadoseuze/app/models/data.dart';
import '../models/produto.dart';
import 'add_saldo.dart';
import 'show_edit_product.dart';

class BuyList extends StatelessWidget {
  final bool buyingList;
  final List<Produto> productList;
  // = [
  //   Produto(descricao: 'Leite', id: 1, preco: 10, qtdKg: 5, total: 50),
  //   Produto(descricao: 'Leite', id: 1, preco: 10, qtdKg: 5, total: 50),
  //   Produto(descricao: 'Leite', id: 1, preco: 10, qtdKg: 5, total: 50),
  //   Produto(descricao: 'Leite', id: 1, preco: 10, qtdKg: 5, total: 50),
  //   Produto(descricao: 'Leite', id: 1, preco: 10, qtdKg: 5, total: 50),
  //   Produto(descricao: 'Leite', id: 1, preco: 10, qtdKg: 5, total: 50),
  // ];
  BuyList({this.buyingList = false, this.productList = const []});
  String get total {
    if (productList.isEmpty) return '0.00';
    return productList
        .map((e) => e.total)
        .reduce((element1, element2) => element1 + element2)
        .toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
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
            "R\$ $total",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ],
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
                itemCount: productList.length,
                itemBuilder: (BuildContext context, int index) {
                  var product = productList[index];
                  return Dismissible(
                    key: UniqueKey(),
                    onDismissed: (dismissed) {},
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Card(
                          elevation: 2,
                          borderOnForeground: true,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: ListTile(
                            onTap: () async {
                              await showEditProduct(context, product);
                              saveData(productList);
                            },
                            title: Text(product.descricao),
                            trailing: _trailling(product),
                            subtitle: _subtitle(product),
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
