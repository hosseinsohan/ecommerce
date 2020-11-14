class SellersModel {
  String score;
  String title;
  String deliveryTimeDesc;
  String offPercent;
  String beforePrice;
  String afterPrice;

  SellersModel(this.score, this.title, this.deliveryTimeDesc, this.offPercent,
      this.beforePrice, this.afterPrice);

  static List<SellersModel> fetchAll() {
    return [
      SellersModel('۴.۶', 'راتین رایا', 'ارسال از ۱ روز کاری دیگر', '۲۰٪',
          '۱,۰۷۰,۰۰۰', '۸۵۹,۰۰۰'),
      SellersModel('۴.۸', 'دی جی لند پلاس', 'ارسال از ۳ روز کاری دیگر', '۲۹٪',
          '۳۳۶,۰۰۰', '۲۳۹,۰۰۰'),
      SellersModel('۳.۶', 'مرکز تامین کالای دیجیتال ایران',
          'ارسال از ۶ روز کاری دیگر', '۳۶٪', '۳,۸۹۵,۰۰۰', '۲,۴۹۹,۰۰۰'),
      SellersModel('۴.۰', 'کالا پلاس', 'ارسال از ۲ روز کاری دیگر', '۱۸٪',
          '۱,۲۰۰,۰۰۰', '۹۷۹,۰۰۰'),
    ];
  }
}
