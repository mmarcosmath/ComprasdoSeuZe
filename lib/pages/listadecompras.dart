import 'package:flutter/material.dart';
import 'package:quitandadoseuze/models/banco.dart';
import 'package:quitandadoseuze/models/produto.dart';
import 'package:quitandadoseuze/pages/editproduto.dart';

class ListaCompras extends StatefulWidget {
  @override
  _ListaComprasState createState() => _ListaComprasState();
}

class _ListaComprasState extends State<ListaCompras> {
  TextEditingController descricao = TextEditingController();
  TextEditingController preco = TextEditingController();
  TextEditingController qtdKg = TextEditingController();
  var produtos = new List<Produto>();
  double total = 0.0;
  final banco = Banco.instance;
  _ListaComprasState() {
    produtos = [];
    qtdKg.text = '1';
    load();
  }
  void calcTotal() {
    total = 0;
    for (var p in produtos) {
      setState(() {
        total += p.total;
      });
    }
  }

  Future load() async {
    final listatemp = await banco.listaProdutos();
    setState(() {
      produtos.clear();
      for (var prod in listatemp) {
        var p = Produto.fromJson(prod);
        produtos.insert(0, p);
      }
      calcTotal();
    });
  }

  Future<void> tap(Produto p) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return EditaProduto(p);
        },
      ),
    );
    setState(() {
      total = 0.0;
      produtos.clear();
    });
    await load();
  }

  Future<void> addProduto() async {
    double preco = double.parse(this.preco.text);
    double qtd_kg = double.parse(qtdKg.text);
    Map<String, dynamic> row = {
      'descricao': '${descricao.text}',
      'preco': preco,
      'qtdKg': qtd_kg,
      'total': (qtd_kg * preco)
    };
    await banco.insertProduto(row);
    setState(() {
      descricao.clear();
      this.preco.clear();
      qtdKg.text = '1';
      load();
    });
  }

  Future<void> dimiss(String id) async {
    await banco.deleteProd(id);
    await load();
  }

  @override
  Widget build(BuildContext context) {
    // load();
    double sizeWidth(double proporcao) {
      return MediaQuery.of(context).size.width * (proporcao / 100);
    }

    double sizeHeight(double proporcao) {
      return MediaQuery.of(context).size.height * (proporcao / 100);
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        primary: true,
        centerTitle: true,
        title: Text("Compras do seu Zé"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              final total = banco.total();
              if (total != 0) {
                banco.deleteTable();
              }
              load();
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addProduto(),
        child: Icon(
          Icons.add,
          size: 50,
          color: Colors.blue,
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        height: sizeHeight(100),
        child: Stack(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: sizeHeight(60),
                  child: RefreshIndicator(
                    onRefresh: () async {
                      await load();
                    },
                    child: ListView.builder(
                      // reverse: true,
                      shrinkWrap: true,
                      itemCount: (produtos.length + 1),
                      itemBuilder: (BuildContext context, int index) {
                        Produto produto;
                        if (index != 0) {
                          produto = produtos[index - 1];
                        }
                        return (index != 0)
                            ? Dismissible(
                                onDismissed: (dismissed) =>
                                    dimiss('${produto.id}'),
                                key: Key('$index'),
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(1.0),
                                    child: Card(
                                      borderOnForeground: true,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8))),
                                      child: ListTile(
                                        onTap: () => tap(produtos[index - 1]),
                                        title: Text(produto.descricao),
                                        trailing: Text(
                                            'R\$ ${produto.total.toStringAsFixed(2)}'),
                                        subtitle: Row(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10),
                                              child: Text(
                                                  'R\$ ${produto.preco.toStringAsFixed(2)}'),
                                            ),
                                            Text(
                                                'x ${produto.qtdKg.toStringAsFixed(2)}'),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : ListTile(
                                title: Text(
                                  "Total",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                trailing: Text(
                                  'R\$ ${total.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              );
                      },
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: sizeHeight(23),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Flexible(
                        child: TextFormField(
                          validator: (validator) {
                            if (validator.isEmpty) {
                              return 'Informe a descrição do produto';
                            }
                          },
                          controller: descricao,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(8),
                            border: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.yellow,
                                  width: 10,
                                  style: BorderStyle.none),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            labelText: 'DESCRIÇÃO',
                            // alignLabelWithHint: true,
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, right: 70),
                        child: Row(
                          children: <Widget>[
                            Flexible(
                              child: TextFormField(
                                controller: preco,
                                keyboardType: TextInputType.numberWithOptions(
                                    decimal: true, signed: false),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(8),
                                  border: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Colors.yellow,
                                        width: 10,
                                        style: BorderStyle.solid),
                                  ),
                                  fillColor: Colors.white,
                                  filled: true,
                                  labelText: 'PREÇO (R\$)',
                                  labelStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Flexible(
                              child: TextFormField(
                                controller: qtdKg,
                                keyboardType: TextInputType.numberWithOptions(
                                    decimal: true, signed: false),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(8),
                                  border: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Colors.yellow,
                                        width: 10,
                                        style: BorderStyle.solid),
                                  ),
                                  fillColor: Colors.white,
                                  filled: true,
                                  labelText: 'QTD/KG',
                                  labelStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:quitandadoseuze/models/banco.dart';
// import 'package:quitandadoseuze/models/produto.dart';
// import 'package:quitandadoseuze/pages/editproduto.dart';

// class ListaCompras extends StatefulWidget {
//   @override
//   _ListaComprasState createState() => _ListaComprasState();
// }

// class _ListaComprasState extends State<ListaCompras> {
//   TextEditingController descricao = TextEditingController();
//   TextEditingController preco = TextEditingController();
//   TextEditingController qtdKg = TextEditingController();
//   var produtos = new List<Produto>();
//   double total = 0.0;
//   final banco = Banco.instance;
//   _ListaComprasState() {
//     produtos = [];
//     qtdKg.text = '1';
//     load();
//   }
//   void calcTotal() {
//     total = 0;
//     for (var p in produtos) {
//       setState(() {
//         total += p.total;
//       });
//     }
//   }

//   Future load() async {
//     final listatemp = await banco.listaProdutos();
//     setState(() {
//       produtos.clear();
//       for (var prod in listatemp) {
//         var p = Produto.fromJson(prod);
//         produtos.insert(0, p);
//       }
//       calcTotal();
//     });
//   }

//   Future<void> tap(Produto p) async {
//     await Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) {
//           return EditaProduto(p);
//         },
//       ),
//     );
//     setState(() {
//       total = 0.0;
//       produtos.clear();
//     });
//     print('oi');
//     await load();
//   }

//   // Future load() async {
//   //   total = 0.0;
//   //   final listatemp = await banco.listaProdutos();
//   //    produtos.clear();

//   //   setState(() {
//   //     for (var prod in listatemp) {
//   //       this.total += double.parse('${prod.values.elementAt(4)}');
//   //       double preco = double.parse('${prod.values.elementAt(2)}');
//   //       double qtdKg = double.parse('${prod.values.elementAt(3)}');
//   //       double total = double.parse('${prod.values.elementAt(4)}');

//   //        produtos.insert(
//   //         0,
//   //         Produto(
//   //             id: int.parse('${prod.values.elementAt(0)}'),
//   //             descricao: '${prod.values.elementAt(1)}',
//   //             preco: preco,
//   //             qtdKg: qtdKg,
//   //             total: total),
//   //       );
//   //     }
//   //     // print("tamanho ${ produtos.length}");
//   //   });
//   // }

//   Future<void> addProduto() async {
//     double preco = double.parse(this.preco.text);
//     double qtd_kg = double.parse(qtdKg.text);
//     Map<String, dynamic> row = {
//       'descricao': '${descricao.text}',
//       'preco': preco,
//       'qtdKg': qtd_kg,
//       'total': (qtd_kg * preco)
//     };
//     await banco.insertProduto(row);
//     setState(() {
//       descricao.clear();
//       this.preco.clear();
//       qtdKg.text = '1';
//       load();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // load();
//     double sizeWidth(double proporcao) {
//       return MediaQuery.of(context).size.width * (proporcao / 100);
//     }

//     double sizeHeight(double proporcao) {
//       return MediaQuery.of(context).size.height * (proporcao / 100);
//     }

//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text("Compras do Seu Zé"),
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.refresh),
//             onPressed: () {
//               final total = banco.total();
//               if (total != 0) {
//                 banco.deleteTable();
//               }
//               load();
//             },
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => addProduto(),
//         child: Icon(
//           Icons.add,
//           size: 50,
//           color: Colors.blue,
//         ),
//         backgroundColor: Colors.white,
//       ),
//       body: Container(
//         height: sizeHeight(100),
//         child: Stack(
//           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             Align(
//               alignment: Alignment.topCenter,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                   height: sizeHeight(60),
//                   child: RefreshIndicator(
//                     onRefresh: () async {
//                       await load();
//                     },
//                     child: ListView.builder(
//                       // reverse: true,
//                       shrinkWrap: true,
//                       itemCount: (produtos.length),
//                       itemBuilder: (BuildContext context, int index) {
//                         Produto produto;

//                         produto = produtos[index];

//                         return Dismissible(
//                           onDismissed: (dismissed) async {
//                             await banco.deleteProd('${produto.id}');
//                             await load();
//                           },
//                           key: Key('$index'),
//                           child: Container(
//                             child: Padding(
//                               padding: const EdgeInsets.all(1.0),
//                               child: Card(
//                                 borderOnForeground: true,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.all(
//                                     Radius.circular(8),
//                                   ),
//                                 ),
//                                 child: ListTile(
//                                   onTap: () => tap(produtos[index]),
//                                   title: Text(produto.descricao),
//                                   trailing: Text(
//                                       'R\$ ${produto.total.toStringAsFixed(2)}'),
//                                   subtitle: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceAround,
//                                     children: <Widget>[
//                                       Text(
//                                           'R\$ ${produto.preco.toStringAsFixed(2)}'),
//                                       Text(
//                                           'x${produto.qtdKg.toStringAsFixed(2)}'),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: Container(
//                 height: sizeHeight(30),
//                 decoration: BoxDecoration(
//                   color: Colors.blue,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(10),
//                     topRight: Radius.circular(10),
//                   ),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     // crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       ListTile(
//                         title: Text("Total"),
//                         trailing: Text('R\$ ${total.toStringAsFixed(2)}'),
//                       ),
//                       Flexible(
//                         child: TextFormField(
//                           validator: (validator) {
//                             if (validator.isEmpty) {
//                               return 'Informe a descrição do produto';
//                             }
//                           },
//                           controller: descricao,
//                           keyboardType: TextInputType.text,
//                           decoration: InputDecoration(
//                             labelText: 'DESCRIÇÃO',
//                             labelStyle: TextStyle(
//                               color: Colors.white,
//                               fontSize: 15,
//                             ),
//                           ),
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             fontSize: 20,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(right: 50),
//                         child: Row(
//                           children: <Widget>[
//                             Flexible(
//                               child: TextFormField(
//                                 controller: preco,
//                                 keyboardType: TextInputType.number,
//                                 decoration: InputDecoration(
//                                   labelText: 'PREÇO (R\$)',
//                                   labelStyle: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 15,
//                                   ),
//                                 ),
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                 ),
//                               ),
//                             ),
//                             Flexible(
//                               child: TextFormField(
//                                 controller: qtdKg,
//                                 keyboardType: TextInputType.number,
//                                 decoration: InputDecoration(
//                                   labelText: 'QTD/KG',
//                                   labelStyle: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 15,
//                                   ),
//                                 ),
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
