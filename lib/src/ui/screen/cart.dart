import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mercikala/src/utils/font.dart';
import 'package:intl/intl.dart' as intl;

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Size screenSize() => MediaQuery.of(context).size;

  @override
  Widget build(BuildContext context) {
    var formatter = intl.NumberFormat("#,###");
    return Scaffold(
        body: SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
      child: Column(
        children: [
          Container(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("سبد خرید من",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: fontIranYekan,
                          fontWeight: FontWeight.bold),),
                    Text("اعمال کد تخفیف",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: fontIranYekan,
                          color: Colors.deepOrangeAccent,
                          fontWeight: FontWeight.w700),),
                  ],
                ),
          ),
          Column(
                  children: [1, 2, 3]
                      .map(
                        (e) => CartItem(),
                  )
                      .toList()),
          SizedBox(height: 100,)
        ],
      )
    ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: screenSize().width,

                    height: 70,
                    decoration: BoxDecoration(
                        color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          spreadRadius: 0.001,
                          blurRadius: 0.1,
                          offset: Offset(0,0)
                        )
                      ]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlatButton(
                            onPressed: (){
                              Navigator.pushNamed(context, '/checkOut', arguments: 1);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                              decoration: BoxDecoration(
                                color: Colors.deepOrangeAccent,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8)
                                )
                              ),
                              child:Text("ادامه فرایند خرید", style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: fontIRANSans,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14
                                  ),),

                            )),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("مبلغ قابل پرداخت", style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: fontIRANSans,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13
                              ),),
                              RichText(
                                text: TextSpan(
                                    text: '${formatter.format(125000)} ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: fontIRANSans,
                                        fontSize: 14),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'تومان',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontFamily: fontDroidArabicKufi,
                                              fontWeight: FontWeight.w700))
                                    ]),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )));
  }
}

class CartItem extends StatefulWidget {
  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  Size screenSize() => MediaQuery.of(context).size;
  int count;

  @override
  void initState() {
    count = 5;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var formatter = intl.NumberFormat("#,###");
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: screenSize().width * 0.25,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Image.asset(
                'assets/image/pdetail1.jpg',
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'گوشی سامسونگ گلگسی نوت 10 لایت 128 گیگ (گارانتی نمایندگی سامسونگ)',
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: fontIRANSans,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 2,
                ),
                RichText(
                  text: TextSpan(
                      text: 'فروشنده ',
                      style: TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.w500,
                          fontFamily: fontIRANSans,
                          fontSize: 12),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'حسین سوهان',
                            style: TextStyle(
                                color: Colors.deepOrangeAccent,
                                fontSize: 12,
                                fontFamily: fontIRANSans,
                                fontWeight: FontWeight.w500))
                      ]),
                ),
                Text(
                  'ارسال حداکثر 2 روز کاری',
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: fontIRANSans,
                      height: 2,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: '${formatter.format(125000)} ',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontFamily: fontIRANSans,
                              fontSize: 14),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'تومان',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: fontDroidArabicKufi,
                                    fontWeight: FontWeight.w700))
                          ]),
                    ),
                    Row(
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          onTap: () {
                            setState(() {
                              if (count > 0) {
                                --count;
                              }
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: 0.1),
                                shape: BoxShape.circle),
                            child: Icon(
                              Icons.remove,
                              color: Colors.deepOrangeAccent,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          '$count',
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: fontIRANSans,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        InkWell(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          onTap: () {
                            setState(() {
                              ++count;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: 0.1),
                                shape: BoxShape.circle),
                            child: Icon(
                              Icons.add,
                              color: Colors.deepOrangeAccent,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      MdiIcons.truck,
                      color: Colors.green,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'ارسال رایگان',
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: fontIRANSans,
                          fontWeight: FontWeight.w500,
                          color: Colors.green),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      MdiIcons.alertCircleOutline,
                      color: Colors.green,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Text(
                      'هزینه حمل با برای خریدهای ${formatter.format(100000)} و بالاتر رایگان می باشد',
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: fontIRANSans,
                          fontWeight: FontWeight.w500,
                          color: Colors.green),
                    ))
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(MdiIcons.alertCircleOutline, color: Colors.black),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Text(
                      'توضیحات اضافی در مورد محصول ... ',
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: fontIRANSans,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          height: 2),
                    ))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Divider()
              ],
            ),
          )
        ],
      ),
    );
  }
}
