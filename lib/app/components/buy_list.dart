import 'package:flutter/material.dart';
import 'package:quitandadoseuze/app/components/textformfield.dart';
import '../models/produto.dart';
import 'custom_textformfield.dart';

class BuyList extends StatelessWidget {
  final bool buyingList;
  final List<Produto> productList;
  //  = [
  //   Produto(descricao: 'Leite', id: 1, preco: 10, qtdKg: 5, total: 50),
  //   Produto(descricao: 'Leite', id: 1, preco: 10, qtdKg: 5, total: 50),
  //   Produto(descricao: 'Leite', id: 1, preco: 10, qtdKg: 5, total: 50),
  //   Produto(descricao: 'Leite', id: 1, preco: 10, qtdKg: 5, total: 50),
  //   Produto(descricao: 'Leite', id: 1, preco: 10, qtdKg: 5, total: 50),
  //   Produto(descricao: 'Leite', id: 1, preco: 10, qtdKg: 5, total: 50),
  // ];
  String get total {
    return productList
        .map((e) => e.total)
        .reduce((element1, element2) => element1 + element2)
        .toStringAsFixed(2);
  }

  BuyList({this.buyingList = false, this.productList});
  Future<void> _showEditProduct(context) async {
    // await showDialog(
    //   context: context,
    //   child: Dialog(
    //     key: UniqueKey(),
    //     elevation: 2,
    //     child: Container(
    //       height: 250,
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.spaceAround,
    //         children: [
    //           Center(
    //             child: Text(
    //               "Editar",
    //               style: TextStyle(
    //                 fontSize: 20,
    //               ),
    //             ),
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: TextFormFieldCustom(label: "PRODUTO"),
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: Row(
    //               key: UniqueKey(),
    //               children: [
    //                 TextFormFieldCustom(label: "PREÇO"),
    //                 SizedBox(
    //                   width: 10,
    //                 ),
    //                 TextFormFieldCustom(label: "QTD/KG"),
    //               ],
    //             ),
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.only(
    //                 top: 10, bottom: 0, left: 10, right: 10),
    //             child: Row(
    //               key: UniqueKey(),
    //               mainAxisAlignment: MainAxisAlignment.end,
    //               children: [
    //                 RaisedButton(
    //                   onPressed: () {
    //                     Navigator.pop(context);
    //                   },
    //                   child: Text("Ok"),
    //                 ),
    //               ],
    //             ),
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }

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
                            elevation: 2,
                            borderOnForeground: true,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            child: ListTile(
                              onTap: () => _showEditProduct(context),
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
      ),
    );
  }

  Widget _subtitle(Produto product) {
    return buyingList
        ? null
        : Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text('R\$ ${product.preco.toStringAsFixed(2)}'),
              ),
              Text('x ${product.qtdKg.toStringAsFixed(2)}'),
            ],
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
            : null
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
                "R\$ $total",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          );
  }
}
