import 'package:flutter/material.dart';
import 'package:mercikala/src/utils/productDetails/specificationsModel.dart';

class Specifications extends StatelessWidget {
  List<SpecificationsModel> specificationsList = SpecificationsModel.fetchAll();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: specificationsList.map((e) => printItems(e)).toList(),
      ),
    );
  }

  Padding printItems(item) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          Container(
            width: 150,
            child: Text(
              item.title + ':',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Text(item.value)
        ],
      ),
    );
  }
}
