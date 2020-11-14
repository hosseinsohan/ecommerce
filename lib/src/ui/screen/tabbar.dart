import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mercikala/src/ui/widgets/productDetails/assessment/assessment.dart';
import 'package:mercikala/src/ui/widgets/productDetails/description.dart';
import 'package:mercikala/src/ui/widgets/productDetails/sellers.dart';
import 'package:mercikala/src/ui/widgets/productDetails/specifications.dart';

class Tabbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("fa", "IR"),
      ],
      locale: Locale("fa", "IR"),
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              bottom: TabBar(
                  unselectedLabelColor: Colors.grey,
                  labelColor: Colors.deepOrange,
                  tabs: [
                    Tab(
                      text: 'فروشندگان',
                    ),
                    Tab(
                      text: 'ارزیابی',
                    ),
                    Tab(
                      text: 'توضیحات',
                    ),
                    Tab(
                      text: 'مشخصات',
                    ),
                  ]),
              title: Text('tabs demo'),
            ),
            body: TabBarView(children: [
              Sellers(),
              Assessment(),
              Description(),
              Specifications(),
            ]),
          )),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
