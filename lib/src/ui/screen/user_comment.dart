
import 'package:flutter/material.dart';
import 'package:mercikala/src/ui/widgets/userComment/ProductComment.dart';
import 'package:mercikala/src/ui/widgets/userComment/ProductName.dart';
import 'package:mercikala/src/ui/widgets/userComment/ScoreChart.dart';
import 'package:mercikala/src/ui/widgets/userComment/WaitingForAccept.dart';

class ShowUserCommentScreen extends StatefulWidget {
  @override
  _ShowUserCommentScreenState createState() => _ShowUserCommentScreenState();
}

class _ShowUserCommentScreenState extends State<ShowUserCommentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo'),
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              WaitingForAccept(false, 'ثبت شده در تاریخ ۱۷ آبان ۱۳۹۹'),
              ScoreChart(80, 20, 50, 70, 10, 60),
              ProductComment(
                  'راضی کنندست',
                  [
                    'برند معتبر و معروف',
                    'صفحه نمایش عالی و روشن',
                    'پردازنده پرقدرت در این رنج'
                  ],
                  ['رم ۴ گیگ', 'باطری'],
                  'به عنوان کسی که سال هاست از لپ تاپ های مختلف استفاده کردم میگم که تو این رنج قیمت تو شرایط الان , بهتر ازین پیدا نمی کنید.'),
              ProductName('لپ تاپ ۱۳ اینچی مایکروسافت مدل Surface Book 2-D'),
            ],
          )
        ],
      ),
    );
  }
}
