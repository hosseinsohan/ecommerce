import 'package:flutter/material.dart';
import 'package:mercikala/src/ui/widgets/search_widget.dart';
import 'package:mercikala/src/utils/font.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SearchBarWidget(
            text: 'دسته و مارک محصول',
          ),
          Column(
            children: [1,2,3,4,5,6].map(
                    (e) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        onTap: (){
                          Navigator.pushNamed(context, '/subCategory');
                        },
                        leading: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [BoxShadow(color: Colors.black)]),
                              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                              child: Image.asset(
                                'assets/image/pdetai2.jpg',
                                width: 50,
                              )),
                        ),
                        title: Text("دسته 1 ", style: TextStyle(fontSize: 16,
                            fontFamily: fontIRANSans,
                            fontWeight: FontWeight.w700),),
                      ),
                    ),
            ).toList()
          )
        ],
      ),
    );
  }
}
