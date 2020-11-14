import 'package:flutter/widgets.dart';
import 'package:mercikala/src/utils/font.dart';

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
          Text('ثبت شده در محصول:',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15, fontFamily: fontIRANSans, color: Color(0xFF000000)),),
          Text(
            productName,
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}