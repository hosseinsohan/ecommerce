import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mercikala/src/ui/widgets/productDetails/assessment/CommentsList.dart';
import 'package:mercikala/src/utils/productDetails/assessmentModel.dart';

class Assessment extends StatelessWidget {
  List<AssessmentModel> assessmentList = AssessmentModel.fetchAll();
  List scoreList = AssessmentModel.scoreCounter();
  List midScoreAndStarCounList = AssessmentModel.midScoreAndStarCount();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: assessmentList.length + 1,
        itemBuilder: (context, index) {
          return Center(
            child: Container(
                child: index == 0
                    ? Column(
                        children: [
                          overallScore(context),
                          subScoreDetails(),
                          commentAndBuyBTN(context),
                          horizontalLine(context),
                          allCommentsCount(),
                        ],
                      )
                    : CommentsList(index - 1, context)),
          );
        });
  }

  Widget overallScore(context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Container(
            width: 170,
            height: 150,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(top: 5),
                child: ratingBar(context)),
          ),
          Positioned(
            top: -2,
            right: 50,
            child: Container(
              height: 18.0,
              width: 80.0,
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Center(
                  child: Text(
                'میانگین امتیاز',
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              )),
            ),
          ),
        ],
      ),
    );
  }

  Widget ratingBar(context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 15.0),
          child: Stack(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.deepOrange[300],
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.deepOrange[300],
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.deepOrange[300],
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.deepOrange[300],
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.deepOrange[300],
                  )
                ],
              ),
              //visibility of stars
              Opacity(
                opacity: 0.8,
                child: Container(
                  width: midScoreAndStarCounList[1],
                  height: 21,
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            midScoreAndStarCounList[0].toString(),
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 70, color: Colors.grey),
          ),
        )
      ],
    );
  }

  Widget subScoreDetails() {
    return Container(
      width: 330,
      height: 50,
      padding: EdgeInsets.only(top: 5, bottom: 5, right: 5),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Row(
        children: [
          printScore([1]),
          Padding(
            padding: EdgeInsets.only(right: 9, left: 9),
            child: Container(
              width: 1,
              height: 60,
              color: Colors.grey[400],
            ),
          ),
          printScore([1, 1]),
          Padding(
            padding: EdgeInsets.only(right: 9, left: 9),
            child: Container(
              width: 1,
              height: 60,
              color: Colors.grey[400],
            ),
          ),
          printScore([1, 1, 1]),
          Padding(
            padding: EdgeInsets.only(right: 9, left: 9),
            child: Container(
              width: 1,
              height: 60,
              color: Colors.grey[400],
            ),
          ),
          printScore([1, 1, 1, 1]),
          Padding(
            padding: EdgeInsets.only(right: 9, left: 9),
            child: Container(
              width: 1,
              height: 60,
              color: Colors.grey[400],
            ),
          ),
          printScore([1, 1, 1, 1, 1]),
        ],
      ),
    );
  }

  Widget printScore(List starCount) {
    String text;
    var score;
    switch (starCount.length) {
      case 1:
        text = 'ضعیف';
        score = scoreList[0];
        break;
      case 2:
        text = 'بد';
        score = scoreList[1];
        break;
      case 3:
        text = 'معمولی';
        score = scoreList[2];
        break;
      case 4:
        text = 'خوب';
        score = scoreList[3];
        break;
      case 5:
        text = 'عالی';
        score = scoreList[4];
        break;
    }

    return Column(
      children: [
        Row(
          children: starCount.map((e) => printStar()).toList(),
        ),
        Text(
          text,
          style: TextStyle(fontSize: 12),
        ),
        Container(
          padding: EdgeInsets.only(right: 16, left: 16),
          child: Text('($score)',
              style: TextStyle(color: Colors.grey, fontSize: 12)),
        )
      ],
    );
  }

  Widget printStar() {
    return Row(
      children: [
        Icon(
          Icons.star,
          size: 10,
          color: Colors.deepOrange[300],
        ),
      ],
    );
  }

  Widget commentAndBuyBTN(context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          FlatButton.icon(
              onPressed: () {
                //TODO
              },
              icon: Icon(Icons.mode_comment),
              label: Text(
                'ثبت نظر',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              color: Colors.deepOrange,
              textColor: Colors.white,
              padding: EdgeInsets.only(left: 127, right: 127),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(8.0))),
          FlatButton(
              onPressed: () {
                //TODO
              },
              // icon: Icon(Icons),
              child: Text(
                'اضافه کردن به سبد',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              color: Colors.deepOrange[50],
              textColor: Colors.deepOrange,
              padding: EdgeInsets.only(left: 118, right: 118),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(8.0))),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Row(
              children: [
                RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.body1,
                    children: [
                      WidgetSpan(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Icon(
                            Icons.error_outline,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      TextSpan(
                          style: TextStyle(color: Colors.grey, fontSize: 13),
                          text:
                              'برای ثبت نظر باید این محصول را خریداری کرده باشید.'),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget horizontalLine(context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, top: 10, bottom: 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 1,
        color: Colors.grey[300],
      ),
    );
  }

  Widget allCommentsCount() {
    var size = assessmentList.length;

    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Row(children: [
        Text(
          'برای این محصول $size نظر ثبت شده است.',
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[600]),
        )
      ]),
    );
  }
}
