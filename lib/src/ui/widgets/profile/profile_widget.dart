import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mercikala/src/utils/font.dart';

class GetProfileScreen extends StatefulWidget {
  final Function callBack;
  GetProfileScreen({this.callBack});
  @override
  _GetProfileScreenState createState() => _GetProfileScreenState();
}

class _GetProfileScreenState extends State<GetProfileScreen> {
  Size screenSize() => MediaQuery.of(context).size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                  width: screenSize().width / 4,
                  height: screenSize().width / 4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        screenSize().width / 4,
                      ),
                      border: Border.all(color: Colors.grey)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      screenSize().width / 4,
                    ),
                    child: Image.asset(
                      'assets/image/person.png',
                      fit: BoxFit.cover,
                    ),
                  )),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'حسین سوهان',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: fontIRANSans),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '09016718255',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: fontIRANSans),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          width: screenSize().width,
          height: 1,
          color: Colors.blueGrey.withOpacity(0.1),
        ),
        Row(
          children: [
            Expanded(
                child: Column(
              children: [
                Text(
                  "1225 تومان",
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: fontIRANSans,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  'کیف پول',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: fontIRANSans,
                      fontWeight: FontWeight.w300),
                )
              ],
            )),
            Container(
              width: 1,
              height: 75,
              color: Colors.blueGrey.withOpacity(0.1),
            ),
            Expanded(
                child: Column(
              children: [
                Text(
                  '15',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: fontIRANSans,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  'تعداد سفارش',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: fontIRANSans,
                      fontWeight: FontWeight.w300),
                )
              ],
            ))
          ],
        ),
        Container(
          width: screenSize().width,
          height: 1,
          color: Colors.blueGrey.withOpacity(0.1),
        ),
        SizedBox(height: 25),
        listItem(CupertinoIcons.person, 'اطلاعات حساب کاربری', null, onTab: () {
          Navigator.pushNamed(context, '/editProfile');
        }),
        listItem(CupertinoIcons.heart, 'لیست علاقه مندی ها', null, onTab: (){
          Navigator.pushNamed(context, '/favoriteScreen');
        }),
        listItem(CupertinoIcons.cube_box, 'سفارش ها', null, onTab: (){
          widget.callBack(3);
        }),
        listItem(CupertinoIcons.chat_bubble, 'نظرات من', null,onTab: (){
          Navigator.pushNamed(context, '/showUserComment');
        }),
        SizedBox(height: 15),
        Container(
          width: screenSize().width,
          height: 1,
          color: Colors.blueGrey.withOpacity(0.1),
        ),
        SizedBox(height: 15),
        listItem(FontAwesomeIcons.powerOff, 'خروج از حساب کاربری',
            Colors.deepOrange),
      ],
    );
  }

  Widget listItem(IconData icon, String title, Color textColor,
      {Function onTab}) {
    return InkWell(
      onTap: onTab,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.deepOrangeAccent,
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: fontIRANSans,
                  fontSize: 14,
                  color: textColor != null ? textColor : null),
              strutStyle: StrutStyle(height: 1.4),
            )
          ],
        ),
      ),
    );
  }
}
