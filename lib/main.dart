import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mercikala/src/route_generator.dart';
import 'package:mercikala/src/ui/screen/cart.dart';
import 'package:mercikala/src/ui/screen/category.dart';
import 'package:mercikala/src/ui/screen/checkout.dart';
import 'package:mercikala/src/ui/screen/home.dart';
import 'package:mercikala/src/ui/screen/product_details.dart';
import 'package:mercikala/src/ui/screen/product_list.dart';
import 'package:mercikala/src/ui/screen/product_list_filter.dart';
import 'package:mercikala/src/ui/screen/profile.dart';
import 'package:mercikala/src/ui/screen/show_order.dart';
import 'package:mercikala/src/ui/screen/show_order_details.dart';
import 'package:mercikala/src/ui/screen/sub_category.dart';
import 'package:mercikala/src/ui/widgets/search_widget.dart';
import 'package:mercikala/src/utils/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('fa', ''),
      ],
      debugShowCheckedModeBanner: false,
      locale: Locale('fa', ''),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute
     // home: MyHomePage(title: 'مرسی کالا'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex;
  @override
  void initState() {
    selectedIndex = 0;
    super.initState();
  }

  Widget getBody(int index){
    switch(index){
      case 0: return HomePage();break;
      case 1: return CategoryScreen();break;
      case 2: return CartScreen();break;
      case 3: return ShowOrders();break;
      case 4: return ProfileScreen();break;
      default: return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: getBody(selectedIndex)
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: (selected){
          setState(() {
            selectedIndex = selected;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "خانه"),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: "دسته بندی"),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.cart), label: "سبد خرید"),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.cube_box_fill), label: "سفارش‌های‌من"),
          BottomNavigationBarItem(
              icon: Container(
               width: 24,
               height: 24,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: Colors.grey
                  )
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset('assets/image/person.png', fit: BoxFit.cover,),
                )
              ),
              label: "پروفایل"),
        ],
      ),
    );
  }
}
