import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mercikala/src/component/message_clipper.dart';
import 'package:mercikala/src/component/top_down_Widget.dart';
import 'package:mercikala/src/ui/widgets/checkout/deliver_box_Widegt.dart';
import 'package:mercikala/src/utils/font.dart';
import 'package:intl/intl.dart' as intl;

class AddressPageWidget extends StatefulWidget {
  @override
  _AddressPageWidgetState createState() => _AddressPageWidgetState();
}

class _AddressPageWidgetState extends State<AddressPageWidget> {
  Size screenSize() => MediaQuery.of(context).size;
  bool showCityList;

  @override
  void initState() {
    showCityList = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: showCityList?Container()
          :Text(
            'آدرس تحویل',
            style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontFamily: fontIRANSans,
                fontWeight: FontWeight.w700),
          ),
        ),
        showCityList
            ? showCityListWidget()
            :
        Padding(
          padding: EdgeInsets.all(8),
          child: OutlineButton(
                  onPressed: () {
                    setState(() {
                      showCityList = true;
                    });
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                                text: 'نام آدرس  ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: fontIRANSans,
                                    fontSize: 14),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: '(تغییردادن)',
                                      style: TextStyle(
                                          color: Colors.deepOrangeAccent,
                                          fontSize: 12,
                                          fontFamily: fontDroidArabicKufi,
                                          fontWeight: FontWeight.w700))
                                ]),
                          ),
                          Text('خیام جنوبی، ارومیه / آذربایجان غربی')
                        ],
                      ),
                      TopDownWidget()
                    ],
                  ),
                ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Text(
            'اطلاعات فاکتور',
            style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontFamily: fontIRANSans,
                fontWeight: FontWeight.w700),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16, top: 5),
          child: Text(
            'آدرس انتخاب شده برای فاکتور، فقط برای اطلاع رسانی است. محصولات شما به آدرسی که در بخش "آدرس تحویل" انتخاب کرده اید تحویل داده می شوند.',
            style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontFamily: fontIRANSans,
                fontWeight: FontWeight.w300),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: OutlineButton(
            onPressed: null,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: 'نام آدرس  ',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontFamily: fontIRANSans,
                              fontSize: 14),
                          children: <TextSpan>[
                            TextSpan(
                                text: '(تغییردادن)',
                                style: TextStyle(
                                    color: Colors.deepOrangeAccent,
                                    fontSize: 12,
                                    fontFamily: fontDroidArabicKufi,
                                    fontWeight: FontWeight.w700))
                          ]),
                    ),
                    Text('خیام جنوبی، ارومیه / آذربایجان غربی')
                  ],
                ),
                TopDownWidget()
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Text(
            'بسته های تحویل',
            style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontFamily: fontIRANSans,
                fontWeight: FontWeight.w700),
          ),
        ),
        Column(
          children: [1, 2, 3, 4]
              .map(
                (e) => DeliveryBoxWidget(),
              )
              .toList(),
        )
      ],
    );
  }

  Widget showCityListWidget() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 16),
      width: screenSize().width,
      color: Colors.white,
      child: Column(
        children: [
           Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'انتخاب آدرس تحویل',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontFamily: fontIRANSans,
                    fontWeight: FontWeight.w700),
                ),
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blueGrey.withOpacity(0.1)
                  ),
                  child: Icon(Icons.close, size: 20,),
                )
              ],
            ),

          Row(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.deepOrangeAccent)
                ),
                child: Icon(Icons.add, size: 15, color: Colors.deepOrangeAccent),
              ),
              SizedBox(width: 10,),
              Text(
                'اضافه کردن آدرس',
                style: TextStyle(
                    color: Colors.deepOrangeAccent,
                    fontSize: 12,
                    fontFamily: fontIRANSans,
                    height: 5,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
          Container(
            width: screenSize().width/2-32,
            height: 150,
            decoration: BoxDecoration(
              border: Border.all(width: 5, color: Colors.indigo),
              borderRadius: BorderRadius.circular(8)
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.menu)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget getCircleContainer(int number) {
  return Container(
    width: 32,
    height: 32,
    margin: EdgeInsets.symmetric(horizontal: 10),
    decoration: BoxDecoration(
        border: Border.all(color: Colors.blueGrey.withOpacity(0.2)),
        shape: BoxShape.circle),
    alignment: Alignment.center,
    child: Text(
      '$number',
      style: TextStyle(
        fontSize: 16,
        fontFamily: fontIRANSans,
        fontWeight: FontWeight.w600,
      ),
      strutStyle: StrutStyle(height: 1.7),
    ),
  );
}

Widget containerCustomPath(String title) {
  return CustomPaint(
    painter: MessageClipper(borderRadius: 8),
    child: Container(
      height: 40,
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      margin: EdgeInsets.only(bottom: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(32)),
      ),
      child: Center(
          child: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 12,
            fontFamily: fontIRANSans,
            color: Colors.indigo),
        strutStyle: StrutStyle(height: 0),
      )),
    ),
  );
}

Widget getBottomWidget(BuildContext context, int page) {
  var formatter = intl.NumberFormat("#,###");
  var screenSize = MediaQuery.of(context).size;
  return Container(
    width: screenSize.width,
    height: 70,
    decoration: BoxDecoration(color: Colors.white, boxShadow: [
      BoxShadow(
          color: Colors.black,
          spreadRadius: 0.001,
          blurRadius: 0.1,
          offset: Offset(0, 0))
    ]),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FlatButton(
            onPressed: () {
              if (page == 2 || page == 3)
                Navigator.pushNamed(context, '/checkOut', arguments: page);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                  color: Colors.deepOrangeAccent,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Text(
                "ادامه فرایند خرید",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: fontIRANSans,
                    fontWeight: FontWeight.w700,
                    fontSize: 14),
              ),
            )),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "مبلغ قابل پرداخت",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: fontIRANSans,
                    fontWeight: FontWeight.w500,
                    fontSize: 13),
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
          ),
        )
      ],
    ),
  );
}
