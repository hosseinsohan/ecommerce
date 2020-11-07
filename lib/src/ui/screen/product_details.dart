import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mercikala/src/ui/widgets/details_show_seler.dart';
import 'package:mercikala/src/ui/widgets/product_horizontal_list.dart';
import 'package:mercikala/src/utils/data.dart';
import 'package:mercikala/src/utils/font.dart';
import 'package:mercikala/src/utils/homeFakeClass/HomeFakeData.dart';
import 'package:intl/intl.dart' as intl;

class ProductDetails extends StatefulWidget {
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails>
    with SingleTickerProviderStateMixin {
  int sliderIndexChanged = 0;
  double sliderIndexAcpectRatio = 0.0;
  AnimationController _controller;
  Duration _duration = Duration(milliseconds: 1500);
  Tween<Offset> _tween = Tween(begin: Offset(0, 1), end: Offset(0, 0));
  HomeFakeData homeFakeData;

  @override
  void initState() {
    super.initState();
    homeFakeData = HomeFakeData.fromJson(HomeData);
    _controller = AnimationController(vsync: this, duration: _duration);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Directionality(
              textDirection: TextDirection.rtl,
              child: CarouselSlider(
                options: CarouselOptions(
                    initialPage: 0,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    viewportFraction: 1,
                    height: screenSize.height * 0.5,
                    onPageChanged:
                        (int index, CarouselPageChangedReason reason) {
                      setState(() {
                        sliderIndexChanged = index;
                        sliderIndexAcpectRatio =
                            (index) / (productDetailsData.length - 1);
                      });
                    }),
                items: productDetailsData.map((banner) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                          child: Image.asset(
                            banner,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            SizedBox.expand(
              child: SlideTransition(
                position: _tween.animate(_controller),
                child: DraggableScrollableSheet(
                  initialChildSize: 0.5,
                  minChildSize: 0.5,
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return SingleChildScrollView(
                      controller: scrollController,
                      physics: BouncingScrollPhysics(),
                      child: Container(
                          width: screenSize.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(35),
                                topRight: Radius.circular(35),
                              )),
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: 50,
                                  margin: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: sliderIndexAcpectRatio * 50,
                                        height: 5,
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15))),
                                      ),
                                      Expanded(
                                        child: Container(
                                          height: 5,
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.grey.withOpacity(0.3),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15))),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Text("سامسونگ",
                                  style: TextStyle(
                                      color: Colors.indigo,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: fontIRANSans,
                                      fontSize: 13)),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                  'گوشی سامسونگ گلگسی نوت 10 لایت 128 گیگ (گارانتی نمایندگی سامسونگ)',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15,
                                    fontFamily: fontIRANSans,
                                  )),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '4.8',
                                    strutStyle: StrutStyle(
                                      height: 1.8,
                                    ),
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: fontIRANSans,
                                    ),
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Color(0xFFFF9529),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    'تعداد کل رای (156)',
                                    strutStyle: StrutStyle(
                                      height: 1.8,
                                    ),
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: fontIRANSans,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Divider(),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'فروشنده',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontFamily: fontIRANSans,
                                      fontSize: 15
                                    ),
                                  ),
                                  Text("حسین سوهان",
                                      style: TextStyle(
                                          color: Colors.indigo, fontSize: 14,fontWeight: FontWeight.w700,
                                          fontFamily: fontIRANSans,
                                          )),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Divider(),
                              SizedBox(
                                height: 10,
                              ),
                              SelerPrice(),
                              SizedBox(
                                height: 25,
                              ),
                              ProductHorizontalList(
                                  'خریداران این محصول، این کالا را هم خریده اند',
                                  homeFakeData.disCountList),
                              SizedBox(
                                height: 25,
                              ),
                              ProductHorizontalList(
                                  'پرفروش ترین محصولات در این دسته',
                                  homeFakeData.horizontal_list[0].products),
                              SizedBox(
                                height: 25,
                              ),
                              ProductHorizontalList(
                                  'محبوب ترین محصولات در این دسته',
                                  homeFakeData.horizontal_list[1].products),
                              SizedBox(
                                height: 100,
                              ),
                            ],
                          )),
                    );
                  },
                ),
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: bottomWidget(screenSize))
          ],
        ),
      ),
    );
  }

  Widget bottomWidget(Size size) {
    final formatter = new intl.NumberFormat("#,###");
    return Container(
      width: size.width,
      height: 80,
      decoration: BoxDecoration(
          color: Colors.white, boxShadow: [BoxShadow(color: Colors.grey)]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("8% تخفیف در سبد خرید",
                    style: TextStyle(color: Colors.green, fontSize: 11,
                      fontWeight: FontWeight.w400,
                      fontFamily: fontIRANSans,)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text(
                          '${formatter.format(11000000)}',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              fontFamily: fontIRANSans,
                              color: Colors.green,height: 1.7),
                        ),
                        Text(
                          '${formatter.format(10200000)} ',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                              fontFamily: fontIRANSans,
                              fontSize: 13,
                              decoration: TextDecoration.lineThrough),
                          strutStyle: StrutStyle(height: 1),
                        ),
                      ],
                    ),
                    SizedBox(width: 5,),
                    Text(
                      'تومان',
                      style: TextStyle(
                          color: Colors.green,
                        fontFamily: fontDroidArabicKufi,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        height: 1.7),
                    ),
                  ],
                )
              ],
            ),
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blueGrey.withOpacity(0.1)),
                padding: EdgeInsets.all(10),
                child: Icon(
                  CupertinoIcons.heart,
                  size: 30,
                  color: Colors.black45,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                child: Text(
                  "اضافه به سبد",
                  style: TextStyle(color: Colors.white,fontFamily: fontIRANSans,
                    fontSize: 12,
                    height: 1.5,
                    fontWeight: FontWeight.bold,),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
