
import 'package:mercikala/src/utils/homeFakeClass/Product.dart';

class Horizontal {
    List<Product> products;
    String title;

    Horizontal({this.products, this.title});

    factory Horizontal.fromJson(Map<String, dynamic> json) {
        return Horizontal(
            products: json['products'] != null ? (json['products'] as List).map((i) => Product.fromJson(i)).toList() : null,
            title: json['title'], 
        );
    }
}