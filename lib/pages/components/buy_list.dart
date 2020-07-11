import 'package:flutter/material.dart';
import 'package:quitandadoseuze/models/produto.dart';

class BuyList extends StatelessWidget {
  final bool buyingList;
  final List<Produto> productList = [
    Produto(descricao: 'Leite', id: 1, preco: 10, qtdKg: 5, total: 50),
    Produto(descricao: 'Leite', id: 1, preco: 10, qtdKg: 5, total: 50),
    Produto(descricao: 'Leite', id: 1, preco: 10, qtdKg: 5, total: 50),
    Produto(descricao: 'Leite', id: 1, preco: 10, qtdKg: 5, total: 50),
    Produto(descricao: 'Leite', id: 1, preco: 10, qtdKg: 5, total: 50),
    Produto(descricao: 'Leite', id: 1, preco: 10, qtdKg: 5, total: 50),
  ];
  BuyList({this.buyingList = false});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
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
                child: Text(
                  "Adicionar Saldo",
                  style: TextStyle(
                    color: Theme.of(context).backgroundColor,
                    fontSize: 10,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: _label(),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: productList.length,
                  itemBuilder: (BuildContext context, int index) {
                    var product = productList[index];
                    return Dismissible(
                      onDismissed: (dismissed) {},
                      key: UniqueKey(),
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Card(
                            borderOnForeground: true,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            child: ListTile(
                              onTap: () {},
                              title: Text(product.descricao),
                              trailing: _trailling(product),
                              subtitle: buyingList
                                  ? null
                                  : Row(
                                      children: <Widget>[
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: Text(
                                              'R\$ ${product.preco.toStringAsFixed(2)}'),
                                        ),
                                        Text(
                                            'x ${product.qtdKg.toStringAsFixed(2)}'),
                                      ],
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
      ),
    );
  }

  Widget _trailling(Produto product) {
    return buyingList
        ? product.check
            ? Image.asset(
                "images/check.png",
                fit: BoxFit.cover,
                height: 25,
              )
            : Text('${product.qtdKg.toStringAsFixed(0)}')
        : Text('${product.total.toStringAsFixed(2)}');
  }

  Row _label() {
    return buyingList
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Lista de Compras",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                "R\$ XX,XX",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          );
  }
}
