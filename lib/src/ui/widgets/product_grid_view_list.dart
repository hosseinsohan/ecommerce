import 'package:flutter/material.dart';
import 'package:mercikala/src/ui/widgets/home_product_item.dart';
import 'package:mercikala/src/utils/font.dart';
import 'package:mercikala/src/utils/homeFakeClass/Grid.dart';
import 'package:mercikala/src/utils/homeFakeClass/Product.dart';

class ProductGridViewList extends StatefulWidget {
  final List<Grid> grids;

  ProductGridViewList(this.grids);

  @override
  _ProductGridViewListState createState() => _ProductGridViewListState();
}

class _ProductGridViewListState extends State<ProductGridViewList> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Text(
              'پیشنهاد ها',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: fontIranYekan,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Column(
            children: widget.grids
                .map((grid) => SuggestionItemList(grid.title, grid.products))
                .toList(),
          )
        ],
      ),
    );
  }
}

class SuggestionItemList extends StatefulWidget {
  final String title;
  final List<Product> products;

  SuggestionItemList(this.title, this.products);

  @override
  _SuggestionItemListState createState() => _SuggestionItemListState();
}

class _SuggestionItemListState extends State<SuggestionItemList> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.title,
            style: TextStyle(color: Colors.indigo, fontSize: 15,
                fontFamily: fontIRANSans,
                fontWeight: FontWeight.w500),
          ),
        ),
        GridView(
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1.1 / 2,
              crossAxisCount: 2,
              crossAxisSpacing: 0),
          shrinkWrap: true,
          children: widget.products
              .map((product) => HomeProductItem(
                  Size.fromWidth(screenSize.width / 2), product))
              .toList(),
        ),
      ],
    );
  }
}
