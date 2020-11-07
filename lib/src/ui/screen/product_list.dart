import 'package:flutter/material.dart';
import 'package:mercikala/src/ui/widgets/show_all_product_item.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [1,2,3,4,5,6,7,8,9].map(
                (e) => ShowAllProductItem()
        ).toList(),
      ),
    );
  }
}
