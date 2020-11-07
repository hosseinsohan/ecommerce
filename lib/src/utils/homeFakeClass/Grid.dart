
import 'package:mercikala/src/utils/homeFakeClass/Product.dart';

class Grid {
    List<Product> products;
    String title;

    Grid({this.products, this.title});

    factory Grid.fromJson(Map<String, dynamic> json) {
        return Grid(
            products: json['products'] != null ? (json['products'] as List).map((i) => Product.fromJson(i)).toList() : null,
            title: json['title'], 
        );
    }
}