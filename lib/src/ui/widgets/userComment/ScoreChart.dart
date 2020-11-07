import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:mercikala/src/utils/font.dart';

class ScoreChart extends StatelessWidget {
  double constructionQuality;
  double innovation;
  double easeOfUse;
  double purchaseValueRelativeToPrice;
  double featuresAndCapabilities;
  double easeOfDesignAndAppearance;

  ScoreChart(
      this.constructionQuality,
      this.innovation,
      this.easeOfUse,
      this.purchaseValueRelativeToPrice,
      this.featuresAndCapabilities,
      this.easeOfDesignAndAppearance);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 20, 5, 20),
      child: Column(
        children: [
          //TODO set percents from JSON
          setNewRow('کیفیت ساخت: ', constructionQuality),
          setNewRow('نو آوری: ', innovation),
          setNewRow('سهولت استفاده: ', easeOfUse),
          setNewRow('ارزش خرید به نسبت قیمت: ', purchaseValueRelativeToPrice),
          setNewRow('امکانات و قابلیت ها: ', featuresAndCapabilities),
          setNewRow('سهولت طراحی و ظاهر: ', easeOfDesignAndAppearance),
        ],
      ),
    );
  }

  // set every item with title and quality Line Chart
  Padding setNewRow(String title, double percent) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
      child: Row(
        children: [
          // Title
          Container(
            width: 135,
            child: Text(title, style: TextStyle(
                fontFamily: fontIRANSans,
              fontSize: 12,
              fontWeight: FontWeight.w500
            ),),
          ),
          // Line Chart
          SizedBox(width: 15,),
          Expanded(child: drawLineChart(percent)),
          SizedBox(width: 10,),
          setQualityText(percent)
        ],
      ),
    );
  }

  // paint simple row with Canvas
  Column drawLineChart(double percent) {
    double blueChartWidth = ((110 * percent) / 100);
    return Column(
      children: [
        Container(
          child: Container(
            height: 4,
            color: Colors.grey[300],
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: Container(
              width: 50,
              color: Colors.lightBlue,
              constraints: BoxConstraints(
                  maxHeight: 300.0,
                  maxWidth: 110.0,
                  minWidth: blueChartWidth,
                  minHeight: 150.0),
            ),
          ),
        )
      ],
    );
  }

  // set quality text to end of line chart
  Widget setQualityText(double percent) {
    String text;
    int percentInt = percent.toInt();
    if (percentInt <= 30) {
      text = 'ضعیف';
    } else if (percentInt <= 50) {
      text = 'معمولی';
    } else if (percentInt <= 80) {
      text = 'خوب';
    } else if (percentInt <= 100) {
      text = 'عالی';
    }

    return Container(
        width: 45,
        child: Text(
          text,
          style: TextStyle(
            fontFamily: fontIRANSans,
            fontSize: 12
          ),
        ));
  }
}