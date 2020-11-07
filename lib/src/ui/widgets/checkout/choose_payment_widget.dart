import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mercikala/src/component/top_down_Widget.dart';
import 'package:mercikala/src/utils/font.dart';

class ChoosePayment extends StatefulWidget {
  @override
  _ChoosePaymentState createState() => _ChoosePaymentState();
}

class _ChoosePaymentState extends State<ChoosePayment> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Text(
            'روش پرداخت',
            style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontFamily: fontIRANSans,
                fontWeight: FontWeight.w700),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          child: OutlineButton(
            onPressed: null,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.all(10),
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
                    Text('پرداخت انلاین',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: fontIranYekan,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
                TopDownWidget(),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Text("توضیحاتی در  مورد روش پرداخت و ...."),
        ),
        Padding(
            padding: EdgeInsets.all(10),
            child: Image.asset('assets/image/slide.jpg'))
      ],
    );
  }
}
