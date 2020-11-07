import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mercikala/src/utils/font.dart';
import 'package:mercikala/src/utils/homeFakeClass/Slider.dart' as sliderModel;
import 'package:intl/intl.dart' as intl;

class ShowBannerList extends StatefulWidget {
  final String title;
  final List<sliderModel.Slider> sliders;
  ShowBannerList(this.title, this.sliders);
  @override
  _ShowBannerListState createState() => _ShowBannerListState();
}

class _ShowBannerListState extends State<ShowBannerList> {
  final formatter = new intl.NumberFormat("#,###");

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      child: Container(
        width: screenSize.width,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.title, style: TextStyle(color: Colors.black, fontSize: 15,
                      fontFamily: fontIRANSans,
                      fontWeight: FontWeight.w700),),
                  SizedBox(width: 5,)
                ],
              ),
            ),
            SizedBox(height: 5,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: widget.sliders
                    .map((data) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.0))
                  ),
                  margin:
                  EdgeInsets.only(right: widget.sliders.indexOf(data) == 0 ? 16 : 5, left: 5),
                  child: ClipRRect(
                     borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      child: Image.asset(data.url, height: 150,))
                ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
