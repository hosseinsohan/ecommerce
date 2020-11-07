
import 'package:mercikala/src/utils/homeFakeClass/Slider.dart';

class Sliders {
    List<Slider> sliders;
    String title;

    Sliders({this.sliders, this.title});

    factory Sliders.fromJson(Map<String, dynamic> json) {
        return Sliders(
            sliders: json['sliders'] != null ? (json['sliders'] as List).map((i) => Slider.fromJson(i)).toList() : null,
            title: json['title'], 
        );
    }
}