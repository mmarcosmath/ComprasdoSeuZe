import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/list_products_data.dart';
import '../../../models/produto.dart';
import '../../widgets/show_modal.dart';

class ItemListProduct extends StatelessWidget {
  const ItemListProduct({
    Key key,
    @required this.product,
    @required this.listProducts,
  }) : super(key: key);

  final Produto product;

  final List<Produto> listProducts;

  @override
  Widget build(BuildContext context) {
    ListProductData products =
        Provider.of<ListProductData>(context, listen: true);

    print(product.qtdKg.truncateToDouble());
    qtdKg() {
      return product.qtdKg - product.qtdKg.truncateToDouble() == 0.0
          ? (product.qtdKg.truncate())
          : product.qtdKg.toStringAsFixed(2);
    }

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
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: ListTile(
                title: Text(product.descricao),
                trailing: Text('R\$ ${product.total.toStringAsFixed(2)}'),
                subtitle: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text('R\$ ${product.preco.toStringAsFixed(2)}'),
                    ),
                    Text('x ${qtdKg()}'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
