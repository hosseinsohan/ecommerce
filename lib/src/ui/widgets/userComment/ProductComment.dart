import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:mercikala/src/utils/font.dart';

class ProductComment extends StatelessWidget {
  String commentTitle;
  List prosList;
  List consList;
  String comment;

  ProductComment(this.commentTitle, this.prosList, this.consList, this.comment);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(commentTitle, style: TextStyle(
              fontSize: 15,
              fontFamily: fontIRANSans,
              fontWeight: FontWeight.w700),),
          Container(
              padding: EdgeInsets.only(right: 10, top: 10),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('نقاط قوت',
                      style: TextStyle(
                        fontFamily: fontIRANSans,
                        fontSize: 12,
                        fontWeight: FontWeight.w700

                      ),),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: prosList
                            .map((e) => setProsAndCons(e, true))
                            .toList(),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Text('نقاط ضعف',style: TextStyle(
                            fontFamily: fontIRANSans,
                            fontSize: 12,
                            fontWeight: FontWeight.w700

                        ),),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: consList
                            .map((e) => setProsAndCons(e, false))
                            .toList(),
                      )
                    ],
                  ),
                ],
              )),
          Container(
            padding: EdgeInsets.only(top: 15, right: 5),
            child: Text(comment, style: TextStyle(
                fontSize: 13,
                fontFamily: fontIRANSans,
                fontWeight: FontWeight.w500),),
          ),
        ],
      ),
    );
  }

  Row setProsAndCons(String item, bool pORc) {
    var dotColor;
    switch (pORc) {
      case true:
        dotColor = Colors.lightBlue;
        break;

      case false:
        dotColor = Colors.red;
        break;
    }

    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle),
        ),
        Container(
          padding: EdgeInsets.only(right: 5),
          child: Text(
            item,
            style: TextStyle(
                fontSize: 12,
            fontFamily: fontIRANSans,
            fontWeight: FontWeight.w400),
          ),
        )
      ],
    );
  }
}