import 'package:flutter/material.dart';
import 'package:mercikala/src/utils/productDetails/descriptionModel.dart';

class Description extends StatelessWidget {
  List<DescriptionModel> descriptionData = DescriptionModel.fetchAll();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Image.network(descriptionData[0].img_url),
          Text(descriptionData[0].desciption)
        ],
      ),
    );
  }
}
