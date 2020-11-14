class DescriptionModel {
  String img_url;
  String desciption;

  DescriptionModel(this.img_url, this.desciption);

  static List<DescriptionModel> fetchAll() {
    return [
      DescriptionModel(
          'http://img.talkandroid.com/uploads/2015/02/Samsung-Logo-Wordmark-RGB.png',
          'لپ تاپ ایسوس مدل GX550LWS از جدید ترین سری لپ تاپ های REPUBLIC OF GAMERS شرکت ایسوس می باشد و در دسته بندی گیمینگ جزء پرچمداران این برند محسوب می گردد. بنابر ادعای شرکت ایسوس این لپ تاپ سبکترین و حرفه ای ترین لپ تاپ 15 اینچ مجهز به کارت گرافیک RTX2070 دنیا می باشد. این لپ تاپ در اصل مدل پیشرفته ی GX501 در بازار تکنولوژی است و تفاوت آن با این مدل در داشتن صفحه نمایش ثانویه ی لمسی و پردازنده ی گرافیکی است ، به نحوی که قدرت آن کاملا افزایش پیدا کرده است. '),
    ];
  }
}
