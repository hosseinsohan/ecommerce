import 'package:flutter/material.dart';
import 'package:mercikala/src/utils/font.dart';


class DeliveryBoxWidget extends StatefulWidget {

  @override
  _DeliveryBoxWidgetState createState() => _DeliveryBoxWidgetState();
}

class _DeliveryBoxWidgetState extends State<DeliveryBoxWidget> {
  Size screenSize() => MediaQuery.of(context).size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey)),
          padding: EdgeInsets.all(0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    topLeft: Radius.circular(12),
                  ),
                  color: Colors.blueGrey.withOpacity(0.1),
                ),
                padding:
                EdgeInsets.only(right: 25, top: 5, bottom: 5),
                width: screenSize().width,
                child: RichText(
                  text: TextSpan(
                      text: 'محصولات ارسال شده از فروشگاه ',
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w700,
                          fontFamily: fontIRANSans,
                          fontSize: 14),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'علیاری',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: fontDroidArabicKufi,
                                fontWeight: FontWeight.w700))
                      ]),
                ),
              ),
              Column(
                children: [1,2].map((e) => Padding(
                  padding: const EdgeInsets.only(right: 10, top: 5),
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: OutlineButton(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(12),
                              ),
                              child: Image.asset(
                                'assets/image/pdetai2.jpg',
                                width: 50,
                                height: 75,
                              ),
                            ),
                          ),
                          Container(
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
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontFamily: fontIranYekan,
                                      fontWeight: FontWeight.w500)),
                              RichText(
                                text: TextSpan(
                                    text: 'تاریخ رزرو محصول: ',
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
                                              fontFamily:
                                              fontDroidArabicKufi,
                                              fontWeight:
                                              FontWeight.w300))
                                    ]),
                              ),
                            ],
                          )),
                      SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                ),).toList(),
              ),
              Container(
                width: screenSize().width,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.blueGrey.withOpacity(0.1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: Colors.deepOrange,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text('تحویل استاندارد',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: fontIranYekan,
                                    fontWeight: FontWeight.w500)),
                            RichText(
                              text: TextSpan(
                                  text:
                                  'تخمین تاریخ تحویل مرسوله: ',
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
                                            fontFamily:
                                            fontDroidArabicKufi,
                                            fontWeight:
                                            FontWeight.w300))
                                  ]),
                            ),
                          ],
                        )
                      ],
                    ),
                    Text(
                      'ارسال رایگان',
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 12,
                          fontFamily: fontIranYekan,
                          fontWeight: FontWeight.w300),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
