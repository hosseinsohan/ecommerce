import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mercikala/src/utils/font.dart';
import 'package:intl/intl.dart' as intl;

class SelerPrice extends StatefulWidget {
  @override
  _SelerPriceState createState() => _SelerPriceState();
}

class _SelerPriceState extends State<SelerPrice> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'دیگر فروشندگان (71)',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: fontIRANSans,
                fontSize: 13),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          child: Row(
            children: [
              1,
              2,
              3,
              4,
              5,
              67,
            ]
                .map((e) => Padding(
                      padding:  EdgeInsets.only(left: 5, right: e==1?16: 5),

                      child: selerItem(),
                    ))
                .toList(),
          ),
        )
      ],
    );
  }

  runBottomSheet(BuildContext context) {
    return showBottomSheet(
        context: context,
        builder: (_) {
          return Column(
            children: [],
          );
        });
  }

  Widget selerItem() {
    var screenSize = MediaQuery.of(context).size;
    final formatter = intl.NumberFormat("#,###");
    return OutlineButton(
      onPressed: null,
      padding: EdgeInsets.all(0),
      child: Container(
        width: screenSize.width / 1.6,
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 45,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                          horizontal: 5,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius:
                                BorderRadius.all(Radius.circular(32))),
                        child: Text(
                          '9,8',
                          strutStyle: StrutStyle(height: 1.3),
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontFamily: fontIRANSans,
                              height: 1.2),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text("حسین سوهان",
                          style: TextStyle(
                              color: Colors.indigo,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              fontFamily: fontIRANSans,
                              height: 1.2)),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("8% تخفیف در سبد خرید",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        fontFamily: fontIRANSans,
                      )),
                  Text("${formatter.format(54000)} تومان",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        fontFamily: fontIRANSans,
                      )),
                ],
              ),
            ),
            Container(
              color: Colors.green.withOpacity(0.1),
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.check_circle,
                    color: Colors.grey.withOpacity(0.7),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'تخفیف',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: fontIRANSans,
                          ),
                          strutStyle: StrutStyle(height: 1.5),
                        ),
                        Text(
                          '${formatter.format(25000)} تومان تخفیف برای خرید های ${formatter.format(500000)} تومانی و بیشتر',
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            fontFamily: fontIRANSans,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    MdiIcons.truckFastOutline,
                    color: Colors.grey.withOpacity(0.7),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                      child: Text(
                    'اگر ظرف 23 ساعت سفارش دهید ، فردا ارسال می شود',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      fontFamily: fontIRANSans,
                    ),
                    strutStyle: StrutStyle(height: 1.2),
                  ))
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: OutlineButton(
                onPressed: null,
                padding: EdgeInsets.all(10),
                child: Text(
                  'اضافه به سبد از این فروشنده',
                  style: TextStyle(fontSize: 11,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontFamily: fontIRANSans,),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
