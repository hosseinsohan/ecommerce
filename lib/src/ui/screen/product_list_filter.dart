import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart' as intl;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mercikala/src/ui/widgets/slider_widget.dart';
import 'package:mercikala/src/utils/font.dart';

class ProductListFilter extends StatefulWidget {
  @override
  _ProductListFilterState createState() => _ProductListFilterState();
}

class _ProductListFilterState extends State<ProductListFilter> {
  int crossAxisCount;

  @override
  void initState() {
    crossAxisCount = 2;
    super.initState();
  }

  changeLayout(int crossAxisCount) {
    setState(() {
      this.crossAxisCount = crossAxisCount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'نام دسته',
          style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: fontIRANSans,
              fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          Icon(
            CupertinoIcons.search,
            color: Colors.grey,
          ),
          IconButton(
            icon: Icon(CupertinoIcons.person),
            padding: EdgeInsets.only(right: 0),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            CustomScrollView(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              slivers: [
                SliverAppBar(
                    expandedHeight: 70.0,
                    floating: true,
                    pinned: false,
                    snap: true,
                    automaticallyImplyLeading: false,
                    backgroundColor: Colors.white,
                    elevation: 0,
                    actions: <Widget>[
                      CustomAppBar(this.changeLayout, crossAxisCount)
                    ]),
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (context, index) => ShowContent(crossAxisCount),
                        childCount: 1))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  final Function changeLayout;
  final int crossAxisCount;

  CustomAppBar(this.changeLayout, this.crossAxisCount);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width - 32,
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          color: Colors.blueGrey.withOpacity(0.1),
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                changeLayout(crossAxisCount == 1 ? 2 : 1);
              },
              icon: Icon(
                crossAxisCount == 1
                    ? CupertinoIcons.rectangle_grid_2x2
                    : CupertinoIcons.rectangle_grid_1x2,
                color: Colors.black45,
              )),
          Container(
            width: 1,
            height: 30,
            color: Colors.black45,
          ),
          Row(
            children: [
              Icon(
                MdiIcons.sort,
                color: Colors.black45,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'جدیدترین',
                style: TextStyle(
                    color: Colors.black45,
                    fontSize: 13,
                    fontFamily: fontIRANSans,
                    fontWeight: FontWeight.w500),
                strutStyle: StrutStyle(height: 1.5),
              )
            ],
          ),
          Container(
            width: 1,
            height: 30,
            color: Colors.black45,
          ),
          Row(
            children: [
              Icon(
                MdiIcons.filter,
                color: Colors.black45,
              ),
              SizedBox(
                width: 2,
              ),
              Text(
                'فیلترها',
                style: TextStyle(
                    color: Colors.black45,
                    fontSize: 13,
                    fontFamily: fontIRANSans,
                    fontWeight: FontWeight.w500),
                strutStyle: StrutStyle(height: 1.5),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class ShowContent extends StatefulWidget {
  final int crossAxisCount;

  ShowContent(this.crossAxisCount);

  @override
  _ShowContentState createState() => _ShowContentState();
}

class _ShowContentState extends State<ShowContent> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return widget.crossAxisCount == 2
        ? GridView(
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio:
                    (screenSize.width / widget.crossAxisCount) / 450,
                crossAxisCount: widget.crossAxisCount,
                crossAxisSpacing: 0),
            shrinkWrap: true,
            children:
                [1, 2, 3, 4, 5, 6, 7].map((product) => getGridItem()).toList(),
          )
        : ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [1, 2, 3, 4, 5, 6, 7]
                .map((product) => getVerticalItem())
                .toList(),
          );
  }

  Widget getVerticalItem() {
    final formatter = new intl.NumberFormat("#,###");
    var screenSize = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/productDetails');
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                //Image.asset('assets/image/product14.jpg'),
                SliderWidget(false),
                IconButton(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    icon: Icon(CupertinoIcons.heart))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 15),
              child: Text(
                'گوشی سامسونگ گلگسی نوت 10 لایت 128 گیگ (گارانتی نمایندگی سامسونگ)',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12,
                    fontFamily: fontIRANSans,
                    fontWeight: FontWeight.w700
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RatingBar(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    itemCount: 5,
                    itemSize: 20,
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.deepOrangeAccent,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '(25 رای)',
                    style: TextStyle(fontSize: 12,
                          fontFamily: fontIRANSans,
                          height: 0.7,
                          fontWeight: FontWeight.w300,
                    ),
                    strutStyle: StrutStyle(height: 1.2),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Text(
                      '%5',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      strutStyle: StrutStyle(height: 1.5),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${formatter.format(1100000)} ',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontFamily: fontIRANSans,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.lineThrough),
                      ),
                      Text(
                        '${formatter.format(1000000)} تومان',
                        style: TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 14,
                            fontFamily: fontIRANSans,
                            height: 0.7,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(1),
                    child: Align(
                      alignment: Alignment.center,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            side: BorderSide(color: Colors.deepOrangeAccent)),
                        color: Colors.deepOrangeAccent,
                        textColor: Colors.white,
                        onPressed: () {
                          print(
                            "sebet",
                          );
                        },
                        child: Text(
                          "اضافه به سبد خرید",
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: fontIRANSans,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'این محصول انواع مختلفی دارد',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: fontIRANSans,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Divider(),
            )
          ],
        ),
      ),
    );
  }

  Widget getGridItem() {
    final formatter = new intl.NumberFormat("#,###");
    var screenSize = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/productDetails');
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                //Image.asset('assets/image/product14.jpg'),
                SliderWidget(true),
                IconButton(icon: Icon(CupertinoIcons.heart))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Text(
                'گوشی سامسونگ گلگسی نوت 10 لایت 128 گیگ ',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 11,
                    fontFamily: fontIRANSans,
                    fontWeight: FontWeight.w500
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  RatingBar(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    itemCount: 5,
                    itemSize: 20,
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.deepOrangeAccent,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '(25 رای)',
                    style: TextStyle(fontSize: 11,
                        fontFamily: fontIRANSans,
                        fontWeight: FontWeight.w300),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Text(
                      '%5',
                      style: TextStyle(
                        color: Colors.white,
                          fontSize: 14,
                          fontFamily: fontIRANSans,
                          fontWeight: FontWeight.w700
                      ),
                      strutStyle: StrutStyle(height: 2),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${formatter.format(1100000)} ',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontFamily: fontIRANSans,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.lineThrough),
                      ),
                      Text(
                        '${formatter.format(1000000)} تومان',
                        style: TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 14,
                            fontFamily: fontIRANSans,
                            height: 0.7,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'این محصول انواع مختلفی دارد',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: fontIRANSans,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(1),
              child: Align(
                alignment: Alignment.center,
                child: OutlineButton(
                  onPressed: () {
                    print("sebet");
                  },
                  child: Text(
                    "اضافه به سبد خرید",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: fontIRANSans,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
