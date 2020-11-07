import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderWidget extends StatefulWidget {
  final bool isGridLayout;
  SliderWidget(this.isGridLayout);
  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {

  List<String> sliders = new List();
  int selectedItem;
  @override
  void initState() {
    sliders.add('assets/image/pdetail1.jpg');
    sliders.add('assets/image/pdetai2.jpg');
    sliders.add('assets/image/pdetai3.jpg');
    selectedItem = 0;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: widget.isGridLayout?200.0:300.0,
              initialPage: selectedItem,
            onPageChanged: (index, reason){
                setState(() {
                  selectedItem = index;
                });
            }
          ),
          items: sliders.map((slide) {
            return Builder(
              builder: (BuildContext context) {
                return Image.asset(slide);
              },
            );
          }).toList(),
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: sliders.map(
                  (slide) => Container(
                    width: 20,
                    height: 2,
                    margin: EdgeInsets.symmetric(horizontal: 1),
                    color: selectedItem==sliders.indexOf(slide)?Colors.deepOrange: Colors.grey,
                  )
          ).toList(),
        )
      ],
    );
  }
}
