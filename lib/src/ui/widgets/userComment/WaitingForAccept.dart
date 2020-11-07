import 'package:flutter/material.dart';
import 'package:mercikala/src/utils/font.dart';

class WaitingForAccept extends StatelessWidget {
  bool accept;
  String commentDate = 'ثبت شده در تاریخ ۱۷ آبان ۱۳۹۹';

  WaitingForAccept(this.accept, this.commentDate);

  @override
  Widget build(BuildContext context) {
    var text;
    var txtColor;
    var bgColor;
    if (accept == true) {
      text = 'تایید شده';
      txtColor = Colors.green[800];
      bgColor = Colors.green[100];
    } else {
      text = 'در انتظار تایید';
      txtColor = Colors.red[800];
      bgColor = Colors.red[100];
    }
    return Container(
      height: 35,
      padding: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
                color: txtColor, fontSize: 16.0, fontWeight: FontWeight.bold, fontFamily: fontIRANSans),
          ),
          Text(
            commentDate,
            style: TextStyle(color: txtColor, fontSize: 12.0,  fontFamily: fontIRANSans),
          )
        ],
      ),
      color: bgColor,
    );
  }
}