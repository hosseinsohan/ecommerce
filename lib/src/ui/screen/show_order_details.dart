import 'package:flutter/material.dart';
import 'package:mercikala/src/component/top_down_Widget.dart';
import 'package:mercikala/src/ui/widgets/checkout/deliver_box_Widegt.dart';
import 'package:mercikala/src/utils/font.dart';
import 'package:intl/intl.dart' as intl;

class ShowOrderDetailsScreen extends StatefulWidget {
  @override
  _ShowOrderDetailsScreenState createState() => _ShowOrderDetailsScreenState();
}

class _ShowOrderDetailsScreenState extends State<ShowOrderDetailsScreen> {
  Size screenSize() =>
      MediaQuery
          .of(context)
          .size;

  @override
  Widget build(BuildContext context) {
    var formatter = intl.NumberFormat("#,###");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'سفارش من',
          style: TextStyle(fontSize: 15, fontFamily: fontIRANSans),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25,
            ),

            Container(
              width: screenSize().width,
              height: 1,
              color: Colors.blueGrey.withOpacity(0.1),
            ),

            getinformation(
              name1: 'تحویل گیرنده',
              title1: 'حسین سوهان',
              title2: 'تاریخ ثبت سفارش',
              name2: '1399/08/07'
            ),
            getinformation(
                name1: 'شماره تماس',
                title1: '09016718255',
                title2: 'مبلغ کل',
                name2: '9500 تومان'
            ),
            getinformation(
                name1: 'نحوه پرداخت',
                title1: 'پرداخت اینترنتی',
                title2: 'کد سفارش',
                name2: 'DKC-142563255'
            ),
            getinformation(
                name1: 'امتیاز مرسی کالا',
                title1: '1 امتیاز',
            ),

            SizedBox(
              height: 20,
            ),
            Container(
              width: screenSize().width,
              height: 5,
              color: Colors.grey.withOpacity(0.3),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Text(
                'لیست مرسوله ها',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontFamily: fontIRANSans,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Column(
              children: [
                1,
                2,
              ]
                  .map(
                    (e) => DeliveryBoxWidget(),
              )
                  .toList(),
            ),
            Container(
              width: screenSize().width,
              height: 5,
              color: Colors.grey.withOpacity(0.3),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'جزئیات پرداخت',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: fontIRANSans,
                        fontSize: 14),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  getPriceWidget('مبلغ کل کالاها', 0),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(),
                  SizedBox(
                    height: 20,
                  ),
                  getPriceWidget('جمع', 0),
                  SizedBox(
                    height: 10,
                  ),
                  getPriceWidget('هزینه ارسال', 0),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(),
                  SizedBox(
                    height: 20,
                  ),
                  getPriceWidget('مبلغ پرداخت شده', 0),
                  SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getinformation({String title1,
    String name1,
    String title2,
    String name2,}) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: Column(
                  children: [
                    Text(
                      title1,
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: fontIRANSans,
                          fontWeight: FontWeight.w300),
                    ),
                    Text(
                      name1,
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: fontIRANSans,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                )),
            Container(
              width: 1,
              height: 75,
              color: Colors.blueGrey.withOpacity(0.1),
            ),
            Expanded(
                child: Column(
                  children: [
                    Text(
                      title2??'',
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: fontIRANSans,
                          fontWeight: FontWeight.w300),
                    ),
                    Text(
                      name2??'',
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: fontIRANSans,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ))
          ],
        ),
        Container(
          width: screenSize().width,
          height: 1,
          color: Colors.blueGrey.withOpacity(0.1),
        ),
      ],
    );
  }

  Widget getPriceWidget(String title, int price) {
    var formatter = intl.NumberFormat("#,###");
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.black87, fontSize: 12),
        ),
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
    );
  }
}
