import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mercikala/src/component/message_clipper.dart';
import 'package:mercikala/src/ui/widgets/checkout/address_page_widget.dart';
import 'package:mercikala/src/ui/widgets/checkout/choose_payment_widget.dart';
import 'package:mercikala/src/ui/widgets/checkout/review_checkout.dart';
import 'package:mercikala/src/utils/font.dart';
import 'package:intl/intl.dart' as intl;

class CheckOut extends StatefulWidget {
  final int page;

  CheckOut({this.page = 1});

  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  Size screenSize() => MediaQuery.of(context).size;

  @override
  Widget build(BuildContext context) {
    var formatter = intl.NumberFormat("#,###");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icon/shield.svg',
              width: 24,
            ),
            SizedBox(
              width: 5,
            ),
            Text("خرید با اطمینان",
                style: TextStyle(
                    color: Color(0xFF1A9F15),
                    fontSize: 16,
                    fontFamily: fontIRANSans,
                    fontWeight: FontWeight.w600))
          ],
        ),
        actions: [IconButton(icon: Icon(CupertinoIcons.cart), onPressed: null)],
      ),
      body: Stack(
        children: [

          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 56,),
                SizedBox(
                  height: 20,
                ),
                widget.page==1?
                AddressPageWidget()
                    :widget.page==2?ChoosePayment():ReviewCheckout(),
                SizedBox(height: 100,)
              ],
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: getBottomWidget(context, widget.page+1),
          ),
          Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 56,
                  child: getTopStepWidget())),
        ],
      ),
    );
  }


  Widget getTopStepWidget(){
    return AppBar(
      automaticallyImplyLeading: false,
      actions: [
        Container(
          width: screenSize().width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.page == 1
                  ? Padding(
                    padding: const EdgeInsets.only(left: 10, top: 2),
                    child: containerCustomPath("آدرس تحویل"),
                  )
                  : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(Icons.check_circle, size: 30, color: Colors.indigo,),
                  ),
              SizedBox(
                width: 30,
                child: Divider(
                    color: Colors.blueGrey.withOpacity(0.5)),
              ),
              widget.page == 2
                  ? Padding(
                padding: const EdgeInsets.only(left: 10, top: 2, right: 10),
                child: containerCustomPath( "پرداخت"),
              ):
              widget.page == 1?
              getCircleContainer(2)
              :Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Icon(Icons.check_circle, size: 30, color: Colors.indigo,),
              ),
              SizedBox(
                width: 30,
                child: Divider(
                    color: Colors.blueGrey.withOpacity(0.5)),
              ),
              widget.page == 3
                  ? Padding(
                padding: const EdgeInsets.only(right: 10, top: 2),
                child: containerCustomPath("تکمیل خرید"),
              ):
              getCircleContainer(3),
            ],
          ),
        )
      ],
    );
  }
}
