import 'package:flutter/material.dart';
import 'package:mercikala/src/utils/font.dart';

class SubCategory extends StatefulWidget {
  @override
  _SubCategoryState createState() => _SubCategoryState();
}

class _SubCategoryState extends State<SubCategory>
    with TickerProviderStateMixin {
  TabController _nestedTabController;

  @override
  void initState() {
    _nestedTabController = new TabController(length: 6, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _nestedTabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                  color: Colors.blueGrey.withOpacity(0.1),
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(20))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Text("انتخاب براساس دسته بندی", style: TextStyle(
                        fontSize: 14,
                        fontFamily: fontIRANSans,
                        fontWeight: FontWeight.w500
                    ),),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TabBar(
                      controller: _nestedTabController,
                      indicatorColor: Colors.deepOrange,
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelColor: Colors.black54,
                      unselectedLabelColor: Colors.black54,
                      isScrollable: true,
                      onTap: (index) {
                        setState(() {});
                      },
                      physics: BouncingScrollPhysics(),
                      tabs: [0, 1, 2, 3, 4, 5]
                          .map(
                            (e) => Container(
                                child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100)),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color:
                                                  _nestedTabController.index ==
                                                          e
                                                      ? Colors.deepOrange
                                                      : Colors.grey
                                                          .withOpacity(0.5)),
                                          boxShadow: [
                                            BoxShadow(color: Colors.black)
                                          ]),
                                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                                      child: Image.asset(
                                        'assets/image/pdetai2.jpg',
                                        width: 25,
                                      )),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "دسته1 ",
                                  style: TextStyle(fontSize: 12,
                                      fontFamily: fontIRANSans,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            )),
                          )
                          .toList()),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                  controller: _nestedTabController,
                  physics: BouncingScrollPhysics(),
                  children: [1, 2, 3, 4, 5, 6]
                      .map(
                        (e) => Column(
                            children: [1, 2, 3, 4, 5, 6]
                                .map(
                                  (e) => Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: ListTile(
                                      onTap: (){
                                        Navigator.pushNamed(context, '/productListFilter');
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
                                )
                                .toList()),
                      )
                      .toList()),
            )
          ],
        ),
      ),
    );
  }
}
