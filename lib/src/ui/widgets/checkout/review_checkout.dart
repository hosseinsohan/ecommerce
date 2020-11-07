import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mercikala/src/utils/font.dart';

class ReviewCheckout extends StatefulWidget {
  @override
  _ReviewCheckoutState createState() => _ReviewCheckoutState();
}

class _ReviewCheckoutState extends State<ReviewCheckout> {

  bool value;

  Size screenSize() => MediaQuery.of(context).size;

  @override
  void initState() {
    value = false;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16, bottom: 8),
            child: RichText(
              text: TextSpan(
                  text: 'سبد خرید ',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontFamily: fontIRANSans,
                      fontWeight: FontWeight.w700),
                  children: <TextSpan>[
                    TextSpan(
                        text: '(ویرایش)',
                        style: TextStyle(
                            color: Colors.deepOrangeAccent,
                            fontSize: 12,
                            fontFamily: fontDroidArabicKufi,
                            fontWeight: FontWeight.w300))
                  ]),
            ),
          ),
          Column(
            children: [1, 2, 3]
                .map((e) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: OutlineButton(
                        onPressed: null,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                          topLeft:
                              e == 1 ? Radius.circular(8) : Radius.circular(0),
                          topRight:
                              e == 1 ? Radius.circular(8) : Radius.circular(0),
                          bottomLeft:
                              e == 3 ? Radius.circular(8) : Radius.circular(0),
                          bottomRight:
                              e == 3 ? Radius.circular(8) : Radius.circular(0),
                        )),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: OutlineButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Image.asset(
                                      'assets/image/pdetai2.jpg',
                                      width: 50,
                                      height: 75,
                                    ),
                                  ),
                                ),
                                e % 2 == 0
                                    ? Container()
                                    : Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.deepOrange),
                                        padding: EdgeInsets.all(5),
                                        child: Text('x3',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontFamily: fontIranYekan,
                                                fontWeight: FontWeight.w700)),
                                      )
                              ],
                            ),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    'گوشی سامسونگ گلگسی نوت 10 لایت 128 گیگ (گارانتی نمایندگی سامسونگ)',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontFamily: fontIranYekan,
                                        fontWeight: FontWeight.w500)),
                                SizedBox(
                                  height: 30,
                                ),
                                Text('تحویل استاندارد',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontFamily: fontIranYekan,
                                        fontWeight: FontWeight.w500)),
                                RichText(
                                  text: TextSpan(
                                      text: 'تاریخ درخواست محصول: ',
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w300,
                                          fontFamily: fontIRANSans,
                                          fontSize: 12),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: '5 آبان',
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 12,
                                                fontFamily: fontDroidArabicKufi,
                                                fontWeight: FontWeight.w300))
                                      ]),
                                ),
                                RichText(
                                  text: TextSpan(
                                      text: 'تاریخ تخمینی ارسال محصول: ',
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w300,
                                          fontFamily: fontIRANSans,
                                          fontSize: 12),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: '10 آبان',
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 12,
                                                fontFamily: fontDroidArabicKufi,
                                                height: 0,
                                                fontWeight: FontWeight.w300))
                                      ]),
                                ),
                              ],
                            )),
                          ],
                        ),
                      ),
                    ))
                .toList(),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16, bottom: 8),
            child: RichText(
              text: TextSpan(
                  text: 'آدرس تحویل ',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontFamily: fontIRANSans,
                      fontWeight: FontWeight.w700),
                  children: <TextSpan>[
                    TextSpan(
                        text: '(ویرایش)',
                        style: TextStyle(
                            color: Colors.deepOrangeAccent,
                            fontSize: 12,
                            fontFamily: fontDroidArabicKufi,
                            fontWeight: FontWeight.w300)),
                  ]),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: OutlineButton(
                    onPressed: null,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8) ,
                        ),
                    padding: EdgeInsets.all(10),
                    child: Container(
                      width: screenSize().width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'آدرس تحویل',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 13,
                                  fontFamily: fontIRANSans,
                                  fontWeight: FontWeight.w300)
                          ),
                          SizedBox(height: 10,),
                          Text(
                              'نام آدرس(انتخابی توسط کاربر)',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontFamily: fontIRANSans,
                                  fontWeight: FontWeight.w700)
                          ),
                          SizedBox(height: 3,),
                          Text('خیام جنوبی، ارومیه / آذربایجان غربی',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 12,
                                  fontFamily: fontIRANSans,
                                  fontWeight: FontWeight.w300))
                        ],
                      ),
                    ),
                  ),

            ),
          SizedBox(height: 15,),
          Row(
            children: [
              Checkbox(
                  value: value,
                  onChanged: (_value){
                setState(() {
                  value = _value;
                });
              },
              activeColor: Colors.deepOrange,
              ),
              RichText(
                text: TextSpan(
                    text: 'شرایط و مقررات خرید انلاین را مطالعه کردم ',
                    style: TextStyle(
                        color: Colors.deepOrangeAccent,
                        fontSize: 12,
                        fontFamily: fontIRANSans,
                        fontWeight: FontWeight.w700),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'و قبول میکنم',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              height: 3,
                              fontFamily: fontIRANSans,
                              fontWeight: FontWeight.w300),
                      ),
                    ]),
              ),
            ],
          )
          ]),

    );
  }
}
