import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:mercikala/src/utils/font.dart';
import 'package:mercikala/src/utils/homeFakeClass/Product.dart';

class HomeProductItem extends StatefulWidget {
  final Size size;
  final Product product;
  HomeProductItem(this.size, this.product);
  @override
  _HomeProductItemState createState() => _HomeProductItemState();
}

class _HomeProductItemState extends State<HomeProductItem> {
  @override
  Widget build(BuildContext context) {
    final formatter = new intl.NumberFormat("#,###");
    return FlatButton(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      onPressed: (){
        Navigator.pushNamed(context, '/productDetails');
      },
      child: Container(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OutlineButton(
              padding: EdgeInsets.all(15),
              child: Image.asset(
                widget.product.url,
                width: widget.size.width,
                height: widget.size.width+20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Container(
                width: widget.size.width+15,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          children: [
                            Text(
                              '${formatter.format(widget.product.price)} ',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: fontIRANSans,
                                  decoration:
                                  TextDecoration.lineThrough),
                            ),
                            Text(
                              '${formatter.format(widget.product.orginal_price)}',
                              style: TextStyle(
                                  color: Colors.deepOrange,
                                  fontFamily: fontIRANSans,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  height: 0.9),
                            ),
                          ],
                        ),
                        SizedBox(width: 5,),
                        Text(
                          'تومان',
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontFamily: fontDroidArabicKufi,
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            height: 1.7
                         ),
                        ),
                      ],
                    ),
                    Text(
                      widget.product.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 13,
                        fontFamily: fontIRANSans,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
