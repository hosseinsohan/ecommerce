import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mercikala/src/ui/widgets/profile/profile_widget.dart';
import 'package:mercikala/src/utils/font.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: Icon(Icons.arrow_back),
            title: Text(
              'صفحه پروفایل',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                  padding: EdgeInsets.only(left: 10),
                  icon: Stack(
                    children: [
                      IconButton(icon: Icon(CupertinoIcons.bell)),
                      Positioned(
                        bottom: 1,
                        right: 1,
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.red, shape: BoxShape.circle),
                          child: Text(
                            '2',
                            style: TextStyle(
                              color: Colors.white,
                                fontFamily: fontIRANSans,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                            strutStyle: StrutStyle(
                              height: 1.3
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  onPressed: () {})
            ],
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) {
              return GetProfileScreen();
            },
            childCount: 1,
          ))
        ],
      ),
    );
  }
}
