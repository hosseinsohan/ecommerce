class AssessmentModel {
  String commenterName;
  int productScore;
  String commentDate;
  String comment;
  bool byFromThisStore;
  List<String> imgUrls;
  String storeName;
  int commentLike;
  int commentDislike;

  AssessmentModel(
      this.commenterName,
      this.productScore,
      this.commentDate,
      this.comment,
      this.byFromThisStore,
      this.imgUrls,
      this.storeName,
      this.commentLike,
      this.commentDislike);

  static List<AssessmentModel> fetchAll() {
    return [
      AssessmentModel(
          'یونس یزدان پور',
          3,
          '۱۹ آبان ۱۳۹۹',
          'خوبیه ولی به این قیمت نمی ارزه کیفیت دوربین سلفیش خیلی خوبه واصلا مناسب بازی کردن نیست و گاهی اوقات هنگ می‌کنه و کنده و سرعت حسگر اثر انگشت خیلی ضعیفه از نظر باتری خوبه ولی به مرور زمان دوربینش ضعیف میشه و کندتر میشه',
          true,
          [],
          'راتین رایا',
          23,
          2),
      AssessmentModel(
          'محمد نصاری',
          4,
          '۱۹ آبان ۱۳۹۹',
          'من این گوشی رو از نمایندگی سامسونگ مشهد احمدآباد گرفتم. در کل گوشی خوبیه،فقط کیفیت دوربین سلفیش کمه',
          true,
          [
            'https://dkstatics-public.digikala.com/digikala-comment-files/6a4310824ed6ae61f669c6c1901a516be0bc1134_1596772524.jpg?x-oss-process=image/resize,m_lfit,h_1024,w_1024/quality,q_80',
            'https://dkstatics-public.digikala.com/digikala-comment-files/2aaa2c0bb083488c54391e8b4cb599433ece9404_1596772576.jpg?x-oss-process=image/resize,m_lfit,h_1024,w_1024/quality,q_80'
          ],
          'دی جی لند پلاس',
          46,
          0),
      AssessmentModel(
          'الهام بازرگان',
          1,
          '۱۹ آبان ۱۳۹۹',
          '‌a11 رقیب بی نظیر تمام گوشی های رنج خودش هست که تمام مزایا رو داره کافیه فقط رو کاغذ ‌مقایسه ‌کنید بعد ببینید. تو عملکرد چه کیفیت عالی بهتون میده سامسونگ عالی‌تر از همیشه',
          false,
          [],
          'کالا پلاس',
          3,
          12),
    ];
  }

  static List scoreCounter() {
    var list = fetchAll();
    var one = 0;
    var two = 0;
    var three = 0;
    var four = 0;
    var five = 0;
    for (var i in list) {
      switch (i.productScore) {
        case 1:
          one += 1;
          break;
        case 2:
          two += 1;
          break;
        case 3:
          three += 1;
          break;
        case 4:
          four += 1;
          break;
        case 5:
          five += 1;
          break;
      }
    }
    return [one, two, three, four, five];
  }

  static List midScoreAndStarCount() {
    double starCount;
    double midScore = 0;

    // count the average of scores
    var list = fetchAll();
    for (int a = 0; a <= list.length - 1; a++) {
      midScore += list[a].productScore;
    }
    midScore /= list.length;
    midScore = double.parse((midScore).toStringAsFixed(1));

    // count the stars will be shown

    if (midScore == 5) {
      starCount = 2;
    } else if (midScore > 4.5) {
      starCount = 9;
    } else if (midScore >= 4.5) {
      starCount = 11;
    } else if (midScore > 4) {
      starCount = 13;
    } else if (midScore == 4) {
      starCount = 28;
    } else if (midScore > 3.5) {
      starCount = 33;
    } else if (midScore == 3.5) {
      starCount = 35;
    } else if (midScore > 3) {
      starCount = 38;
    } else if (midScore == 3) {
      starCount = 52;
    } else if (midScore > 2.5) {
      starCount = 56;
    } else if (midScore == 2.5) {
      starCount = 59;
    } else if (midScore > 2) {
      starCount = 62;
    } else if (midScore == 2) {
      starCount = 76;
    } else if (midScore > 1.5) {
      starCount = 82;
    } else if (midScore == 1.5) {
      starCount = 84;
    } else if (midScore > 1) {
      starCount = 86;
    } else if (midScore == 1) {
      starCount = 100;
    } else if (midScore > 0.5) {
      starCount = 105;
    } else if (midScore == 0.5) {
      starCount = 108;
    } else if (midScore > 0.0) {
      starCount = 110;
    } else if (midScore == 0.0) {
      starCount = 120;
    }

    return [midScore, starCount];
  }
}
