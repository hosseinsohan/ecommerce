import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mercikala/src/ui/widgets/product_grid_view_list.dart';
import 'package:mercikala/src/ui/widgets/product_horizontal_list.dart';
import 'package:mercikala/src/ui/widgets/search_widget.dart';
import 'package:mercikala/src/ui/widgets/show_banner_list.dart';
import 'package:mercikala/src/utils/data.dart';
import 'package:mercikala/src/utils/homeFakeClass/HomeFakeData.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeFakeData homeFakeData;
  @override
  void initState() {
    homeFakeData = HomeFakeData.fromJson(HomeData);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SearchBarWidget(
              text: '20 میلیون محصول',
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  child: Image.asset(homeFakeData.top_banner1.url)),
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: CarouselSlider(
                options: CarouselOptions(
                    initialPage: 0,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    autoPlayCurve: Curves.fastOutSlowIn,
                  viewportFraction: 0.94
                ),
                items: homeFakeData.top_banner2.map((banner) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(16.0)),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(16.0)),
                            child: Image.asset(banner.url, ),
                          ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),

            SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(width: 16,),
                Expanded(
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      child: Image.asset(
                        homeFakeData.top_banner3[0].url,
                      ),
                    ),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    child: Image.asset(
                      homeFakeData.top_banner3[1].url,
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    child: Image.asset(
                        homeFakeData.top_banner3[2].url
                    ),
                  ),
                ),
                SizedBox(width: 16,),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                child: Image.asset(homeFakeData.top_banner4.url),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ProductHorizontalList('تخفیفات ویژه',homeFakeData.disCountList ,showAll: true,),
            SizedBox(
              height: 20,
            ),
            Column(
              children: homeFakeData.slider_list.map(
                      (slider) => Column(
                        children: [
                          ShowBannerList(
                            slider.title,
                            slider.sliders
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      )
              ).toList()
            ),
            Column(
              children: homeFakeData.horizontal_list.map(
                      (list) => Column(
                        children: [
                          ProductHorizontalList(list.title, list.products),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      )).toList(),
            ),
            ProductGridViewList(homeFakeData.grid_list),
          ],
        ),
      ),
    );
  }
}
