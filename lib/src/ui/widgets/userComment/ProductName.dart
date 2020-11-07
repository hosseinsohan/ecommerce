import 'package:flutter/widgets.dart';

class ProductName extends StatelessWidget {
  String productName;

  ProductName(this.productName);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('ثبت شده در محصول:'),
          Text(
            productName,
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}