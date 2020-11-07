import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mercikala/src/utils/font.dart';
import 'package:intl/intl.dart' as intl;

class ShowOrders extends StatefulWidget {
  @override
  _ShowOrdersState createState() => _ShowOrdersState();
}

class _ShowOrdersState extends State<ShowOrders> with TickerProviderStateMixin{
  TabController tabController;

  Size screenSize() => MediaQuery.of(context).size;
  @override
  void initState() {
    tabController = new TabController(length: 5, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('سفارش های من - مرسیکلا', style: TextStyle(
          fontWeight: FontWeight.w700,
          fontFamily: fontIranYekan,
          fontSize: 18
        ),),
      ),
      body: Column(
        children: [
          TabBar(
            controller: tabController,
            indicatorColor: Colors.deepOrangeAccent,
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: Colors.deepOrangeAccent,
            unselectedLabelColor: Color(0xffcbcbcb),
            isScrollable: true,
            labelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: fontIRANSans,
            ),
            tabs: <Widget>[
              Tab(
                text: 'همه',
              ),
              Tab(
                text: 'لغوشده ها',
              ),
              Tab(
                text: 'تایید شده ها',
              ),
              Tab(
                text: 'ارسال شده ها',
              ),
              Tab(
                text: 'تحویل شده ها',
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                ShowOrderItem(),
                ShowOrderItem(),
                ShowOrderItem(),
                ShowOrderItem(),
                ShowOrderItem(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
class ShowOrderItem extends StatefulWidget {
  @override
  _ShowOrderItemState createState() => _ShowOrderItemState();
}

class _ShowOrderItemState extends State<ShowOrderItem> {

  Size screenSize() => MediaQuery.of(context).size;
  @override
  Widget build(BuildContext context) {
    var formatter = intl.NumberFormat("#,###");
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 25,),
            Column(
              children: [1,2,3,4,5].map(
                      (e) => FlatButton(
                          onPressed: (){
                            Navigator.pushNamed(context, '/orderDetails');
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2,),
                            child: Card(
                              child: Container(
                                width: screenSize().width,
                                margin: EdgeInsets.all(10),
                                height: 80,
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Stack(
                                          children: [
                                            Container(width: 30,height: 30,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.red,
                                              ),),
                                            Container(
                                              width: 30,height: 30,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.black,
                                              ),
                                              margin: EdgeInsets.only(top: 10),
                                            ),
                                            Container(width: 30,height: 30,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.blue,
                                              ),
                                              margin: EdgeInsets.only(top: 20),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 10,),
                                        Column(
                                          children: [
                                            Text('Km-1232454'),
                                            SizedBox(height: 15,),
                                            RichText(
                                              text: TextSpan(
                                                  text: '${formatter.format(125000)} ',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.w700,
                                                      fontFamily: fontIRANSans,
                                                      fontSize: 14),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                        text: 'تومان',
                                                        style: TextStyle(
                                                            color: Colors.deepOrangeAccent,
                                                            fontSize: 12,
                                                            fontFamily: fontDroidArabicKufi,
                                                            fontWeight: FontWeight.w700))
                                                  ]),
                                            ),
                                          ],
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Text('1399/8/5',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey,
                                                    fontFamily: fontIRANSans,
                                                    fontWeight: FontWeight.w700
                                                ),
                                                textAlign: TextAlign.left,),
                                              SizedBox(height: 15,),
                                              Icon(Icons.keyboard_arrow_left)
                                            ],
                                          ),
                                        )

                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ))
              ).toList(),
            )
          ],
        ),
      ),
    );
  }
}

