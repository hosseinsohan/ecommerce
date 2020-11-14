import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mercikala/src/utils/productDetails/sellersModel.dart';

class Sellers extends StatelessWidget {
  List<SellersModel> sellersList = SellersModel.fetchAll();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: sellersList.length,
      itemBuilder: (context, index) {
        return Card(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Title
            scoreAndtitle(index),
            // Delivery description
            Container(
              padding: EdgeInsets.only(right: 15, top: 10),
              child: Text(sellersList[index].deliveryTimeDesc),
            ),
            // off, prices, buy btn
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: offAndPrices(index),
                ),
                //shop btn
                FlatButton.icon(
                    onPressed: () {
                      //TODO
                    },
                    icon: Icon(Icons.add_shopping_cart),
                    label: Text(
                      'اضافه کردن به سبد',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    color: Colors.deepOrange,
                    textColor: Colors.white,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(8.0)))
              ],
            )
          ],
        ));
      },
    );
  }

  Container scoreAndtitle(index) {
    return Container(
      padding: EdgeInsets.only(top: 15, right: 15),
      child: Row(
        children: [
          //Score
          Container(
            padding: EdgeInsets.only(top: 1, bottom: 1, right: 10, left: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.green),
            child: Text(
              sellersList[index].score,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          //Store Name (Title)
          Container(
            padding: EdgeInsets.only(right: 10),
            child: Text(
              sellersList[index].title,
              style: TextStyle(color: Colors.blue, fontSize: 18),
            ),
          )
        ],
      ),
    );
  }

  Row offAndPrices(index) {
    return Row(
      children: [
        // OFF percent
        Container(
          padding: EdgeInsets.only(top: 12, bottom: 12, right: 7, left: 7),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(2)),
              color: Colors.red),
          child: Text(
            sellersList[index].offPercent,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        // Prices
        Padding(
          padding: EdgeInsets.only(right: 5, bottom: 8),
          child: Container(
            width: 130,
            child: RichText(
                text: TextSpan(children: [
              //before price
              TextSpan(
                  text: sellersList[index].beforePrice + '\n',
                  style: TextStyle(
                      fontSize: 14,
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey)),
              //after price
              TextSpan(
                  text: sellersList[index].afterPrice,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black))
            ])),
          ),
        )
      ],
    );
  }
}
