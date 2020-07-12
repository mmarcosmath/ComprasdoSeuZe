// import 'package:flutter/material.dart';
// import 'package:quitandadoseuze/models/banco.dart';
// import 'package:quitandadoseuze/models/produto.dart';

// class EditaProduto extends StatefulWidget {
//   int id;
//   Produto produto;
//   EditaProduto(Produto p) {
//     produto = p;
//     print('${produto.descricao}/${produto.qtdKg}/${produto.preco}/');
//   }
//   // EditaProduto(int i){
//   //   id  = i;
//   //   print('id: $i');
//   // }

//   @override
//   _EditaProdutoState createState() => _EditaProdutoState(produto);
// }

// class _EditaProdutoState extends State<EditaProduto> {
//   Produto p;
//   int id;
//   TextEditingController descricao = TextEditingController();
//   TextEditingController preco = TextEditingController();
//   TextEditingController qtdKg = TextEditingController();
//   final banco = Banco.instance;

//   _EditaProdutoState(this.p) {
//     descricao.text = p.descricao;
//     preco.text = p.preco.toStringAsFixed(2);
//     qtdKg.text = p.qtdKg.toStringAsFixed(3);
//   }

//   @override
//   Widget build(BuildContext context) {
//     double sizeWidth(double proporcao) {
//       return MediaQuery.of(context).size.width * (proporcao / 100);
//     }

//     double sizeHeight(double proporcao) {
//       return MediaQuery.of(context).size.height * (proporcao / 100);
//     }

//     return Scaffold(
//       body: Container(
//         child: Center(
//           child: Container(
//             margin: EdgeInsets.all(10),
//             height: sizeHeight(50),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               boxShadow: [
//                 BoxShadow(
//                   blurRadius: 5.0,
//                   color: Colors.black26,
//                   offset: Offset(0, 2),
//                   spreadRadius: 1.0,
//                 ),
//               ],
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(10),
//                 topRight: Radius.circular(10),
//               ),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: <Widget>[
//                   Flexible(
//                     child: TextFormField(
//                       controller: descricao,
//                       keyboardType: TextInputType.text,
//                       decoration: InputDecoration(
//                         labelText: 'DESCRIÇÃO',
//                         labelStyle: TextStyle(
//                           // color: Colors.white,
//                           fontSize: 15,
//                         ),
//                       ),
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 20,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       children: <Widget>[
//                         Flexible(
//                           child: TextFormField(
//                             controller: preco,
//                             keyboardType: TextInputType.number,
//                             decoration: InputDecoration(
//                               labelText: 'PREÇO (R\$)',
//                               labelStyle: TextStyle(
//                                 // color: Colors.white,
//                                 fontSize: 15,
//                               ),
//                             ),
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               fontSize: 20,
//                             ),
//                           ),
//                         ),
//                         Flexible(
//                           child: TextFormField(
//                             controller: qtdKg,
//                             keyboardType: TextInputType.number,
//                             decoration: InputDecoration(
//                               labelText: 'QTD/KG',
//                               labelStyle: TextStyle(
//                                 // color: Colors.white,
//                                 fontSize: 15,
//                               ),
//                             ),
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               fontSize: 20,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         boxShadow: [
//                           BoxShadow(
//                             blurRadius: 5.0,
//                             color: Colors.black26,
//                             offset: Offset(0, 2),
//                             spreadRadius: 1.0,
//                           ),
//                         ],
//                       ),
//                       width: double.maxFinite,
//                       child: FlatButton(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(10),
//                             topRight: Radius.circular(10),
//                           ),
//                         ),
//                         color: Colors.blue,
//                         padding: EdgeInsets.all(20.0),
//                         onPressed: () async {
//                           p.descricao = descricao.text;
//                           p.preco = double.parse('${preco.text}');
//                           p.qtdKg = double.parse('${qtdKg.text}');
//                           p.total = p.qtdKg * p.preco;
//                           await banco.atualizaEdicao(p);
//                           Navigator.pop(context);
//                         },
//                         child: Text(
//                           "Salvar",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 20,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
