import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/list_products_data.dart';
import '../../widgets/add_saldo.dart';
import 'item_list.dart';

class BuyList extends StatelessWidget {
  const BuyList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    ListProductData products =
        Provider.of<ListProductData>(context, listen: true);
    var listProducts = [...products.items];

    return Container(
      color: theme.backgroundColor,
      padding: EdgeInsets.only(top: 10),
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
          color: theme.primaryColor,
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
                    color: theme.backgroundColor,
                    fontSize: 10,
                  ),
                ),
                onTap: () => addSaldo(context),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Lista de Compras",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(0),
                itemCount: listProducts.length,
                itemBuilder: (BuildContext context, int index) {
                  var product = listProducts[index];
                  return ItemListProduct(
                    product: product,
                    listProducts: listProducts,
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
