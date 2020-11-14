
import 'package:flutter/material.dart';
import 'package:mercikala/main.dart';
import 'package:mercikala/src/ui/screen/category.dart';
import 'package:mercikala/src/ui/screen/checkout.dart';
import 'package:mercikala/src/ui/screen/edit_profile.dart';
import 'package:mercikala/src/ui/screen/favorite.dart';
import 'package:mercikala/src/ui/screen/login_screen.dart';
import 'package:mercikala/src/ui/screen/product_details.dart';
import 'package:mercikala/src/ui/screen/product_list_filter.dart';
import 'package:mercikala/src/ui/screen/show_order_details.dart';
import 'package:mercikala/src/ui/screen/sub_category.dart';
import 'package:mercikala/src/ui/screen/user_comment.dart';


class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;
    switch (settings.name) {
      case '/': return MaterialPageRoute(builder: (_)=>LoginScreen());
      case '/productDetails': return MaterialPageRoute(builder: (_)=>ProductDetails());
      case '/category': return MaterialPageRoute(builder: (_)=>CategoryScreen());
      case '/subCategory': return MaterialPageRoute(builder: (_)=>SubCategory());
      case '/productListFilter': return MaterialPageRoute(builder: (_)=>ProductListFilter());
      case '/orderDetails': return MaterialPageRoute(builder: (_)=>ShowOrderDetailsScreen());
      case '/checkOut': return createRoute(args);
      case '/home': return MaterialPageRoute(builder: (_)=>MyHomePage());
      case '/editProfile': return MaterialPageRoute(builder: (_)=>EditProfileScreen());
      case '/showUserComment': return MaterialPageRoute(builder: (_)=>ShowUserCommentScreen());
      case '/favoriteScreen': return MaterialPageRoute(builder: (_)=>FavoriteScreen());
      default: return MaterialPageRoute(builder: (_)=>MyHomePage());
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
  static Route createRoute(int page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => CheckOut(page: page,),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.1, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve,));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
