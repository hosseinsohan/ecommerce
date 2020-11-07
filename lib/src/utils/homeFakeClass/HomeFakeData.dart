

import 'package:mercikala/src/utils/homeFakeClass/Grid.dart';
import 'package:mercikala/src/utils/homeFakeClass/Horizontal.dart';
import 'package:mercikala/src/utils/homeFakeClass/Product.dart';
import 'package:mercikala/src/utils/homeFakeClass/Slider_list.dart';
import 'package:mercikala/src/utils/homeFakeClass/TopBanner1.dart';
import 'package:mercikala/src/utils/homeFakeClass/TopBanner2.dart';
import 'package:mercikala/src/utils/homeFakeClass/TopBanner3.dart';
import 'package:mercikala/src/utils/homeFakeClass/TopBanner4.dart';

class HomeFakeData {
    List<Product> disCountList;
    List<Grid> grid_list;
    List<Horizontal> horizontal_list;
    List<Sliders> slider_list;
    TopBanner1 top_banner1;
    List<TopBanner2> top_banner2;
    List<TopBanner3> top_banner3;
    TopBanner4 top_banner4;

    HomeFakeData({this.disCountList, this.grid_list, this.horizontal_list, this.slider_list, this.top_banner1, this.top_banner2, this.top_banner3, this.top_banner4});

    factory HomeFakeData.fromJson(Map<String, dynamic> json) {
        return HomeFakeData(
            disCountList: json['disCountList'] != null ? (json['disCountList'] as List).map((i) => Product.fromJson(i)).toList() : null,
            grid_list: json['grid_list'] != null ? (json['grid_list'] as List).map((i) => Grid.fromJson(i)).toList() : null, 
            horizontal_list: json['horizontal_list'] != null ? (json['horizontal_list'] as List).map((i) => Horizontal.fromJson(i)).toList() : null, 
            slider_list: json['slider_list'] != null ? (json['slider_list'] as List).map((i) => Sliders.fromJson(i)).toList() : null,
            top_banner1: json['top_banner1'] != null ? TopBanner1.fromJson(json['top_banner1']) : null, 
            top_banner2: json['top_banner2'] != null ? (json['top_banner2'] as List).map((i) => TopBanner2.fromJson(i)).toList() : null, 
            top_banner3: json['top_banner3'] != null ? (json['top_banner3'] as List).map((i) => TopBanner3.fromJson(i)).toList() : null, 
            top_banner4: json['top_banner4'] != null ? TopBanner4.fromJson(json['top_banner4']) : null, 
        );
    }
}