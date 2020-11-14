import 'package:flutter/material.dart';
import 'package:mercikala/src/ui/widgets/home_product_item.dart';
import 'package:mercikala/src/utils/data.dart';
import 'package:mercikala/src/utils/homeFakeClass/HomeFakeData.dart';

class FavoriteScreen extends StatefulWidget {

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {

  HomeFakeData homeFakeData;

  @override
  void initState() {
    homeFakeData = HomeFakeData.fromJson(HomeData);
    super.initState();
  }

  Size screenSize() => MediaQuery.of(context).size;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('لیست علاقه مندی ها'),
      ),
      body:  GridView(
        padding: EdgeInsets.symmetric(vertical: 25),
        physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.1 / 2,
            crossAxisCount: 2,
            crossAxisSpacing: 0),
        shrinkWrap: true,
        children: homeFakeData.disCountList
            .map((product) => HomeProductItem(
            Size.fromWidth(screenSize().width / 2), product))
            .toList(),
      ),
    );
  }
}
