import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mercikala/src/ui/widgets/home_product_item.dart';
import 'package:mercikala/src/utils/font.dart';
import 'package:mercikala/src/utils/homeFakeClass/Product.dart';


class ProductHorizontalList extends StatefulWidget {
 final String title;
 final bool showAll;
 List<Product> products;
 ProductHorizontalList(this.title, this.products, {this.showAll=false, });
  @override
  _ProductHorizontalListState createState() => _ProductHorizontalListState();
}

class _ProductHorizontalListState extends State<ProductHorizontalList> {


  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Container(
      child: Container(
          width: screenSize.width,
          child: Column(

            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.title, style: TextStyle(
                        color: Colors.black, fontSize: 15,
                        fontFamily: fontIRANSans,
                        fontWeight: FontWeight.w700),),
                    widget.showAll?Row(
                      children: [
                        Text('مشاهده همه', style: TextStyle(
                            color: Colors.deepOrange,
                          fontFamily: fontIRANSans,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),strutStyle: StrutStyle(height: 1.5),),
                        Icon(Icons.keyboard_arrow_left_outlined, size: 20, color: Colors.deepOrange,)
                      ],
                    ):Container(),
                  ],
                ),
              ),
        SizedBox(height: 5,),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            child: Row(
                  children: widget.products
                      .map((product) => Padding(
                        padding:  EdgeInsets.only(right: widget.products.indexOf(product)==0?8:0),
                        child: HomeProductItem(Size.fromWidth(screenSize.width/3), product),
                      ))
                      .toList(),
                ),
              ),
            ],
          ),
      ),
    );
  }
}
