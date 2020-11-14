class SpecificationsModel {
  String title;
  String value;

  SpecificationsModel(this.title, this.value);

  static List<SpecificationsModel> fetchAll() {
    return [
      SpecificationsModel('ابعاد', '159.3x73.1x8.6 میلی‌مت'),
      SpecificationsModel(
          'توضیحات سیم کارت', 'سایز نانو (8.8 × 12.3 میلی‌متر) '),
      SpecificationsModel('وزن ', '185 گرم'),
      SpecificationsModel('ویژگی‌های خاص', 'فبلت , مناسب عکاسی'),
      SpecificationsModel('تعداد سیم کارت', 'دو سیم کارت '),
      SpecificationsModel('شیار مجزا برای کارت حافظه', 'دارد '),
      SpecificationsModel('زمان معرفی', '27 آوریل 2020'),
    ];
  }
}
