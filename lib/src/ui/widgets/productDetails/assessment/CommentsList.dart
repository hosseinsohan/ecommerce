import 'package:flutter/material.dart';
import 'package:mercikala/src/ui/widgets/productDetails/assessment/CommentImageView.dart';
import 'package:mercikala/src/utils/productDetails/assessmentModel.dart';

class CommentsList extends StatelessWidget {
  int index;
  var context;

  CommentsList(this.index, this.context);

  List<AssessmentModel> assessmentList = AssessmentModel.fetchAll();
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      //name, rate, date
      Padding(
        padding: EdgeInsets.only(top: 15, right: 15, left: 15),
        child: Row(
          children: [
            // name
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: Colors.grey[200]),
              child: Center(
                child: Text(
                  '${assessmentList[index].commenterName[0]}${assessmentList[index].commenterName[1]}',
                  style: TextStyle(
                      color: Colors.grey[800], fontWeight: FontWeight.bold),
                ),
              ),
            ),
            // rate
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Row(children: [
                printCommentRatingStars(assessmentList[index].productScore)
              ]),
            ),
            // date
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Text(assessmentList[index].commentDate,
                  style: TextStyle(color: Colors.grey[600])),
            )
          ],
        ),
      ),
      // Comment
      Padding(
        padding: EdgeInsets.all(15),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.grey[200],
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  assessmentList[index].comment,
                  style: TextStyle(fontSize: 12, color: Colors.grey[800]),
                ),
              ),
              // horizon line
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, right: 10, left: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 1,
                  color: Colors.grey[300],
                ),
              ),
              // set store name in comment
              Padding(
                padding: EdgeInsets.only(bottom: 10.0, right: 10.0),
                child: Row(
                  children: [
                    Text('صاحب نظر این محصول را از',
                        style:
                            TextStyle(fontSize: 12, color: Colors.grey[600])),
                    Padding(
                      padding: EdgeInsets.only(right: 2, left: 2),
                      child: Text(assessmentList[index].storeName,
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.blue[800],
                              fontWeight: FontWeight.bold)),
                    ),
                    Text('خریداری کرده است.',
                        style:
                            TextStyle(fontSize: 12, color: Colors.grey[600])),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      // coment photos
      commentPhotos(index),
      //likes and dislikes
      likeAndDislike(index)
    ]);
  }

  Row printCommentRatingStars(count) {
    return Row(
      children: [
        Icon(
          Icons.star,
          size: 12,
          color: count > 0 ? Colors.deepOrange[300] : Colors.deepOrange[100],
        ),
        Icon(
          Icons.star,
          size: 12,
          color: count > 1 ? Colors.deepOrange[300] : Colors.deepOrange[100],
        ),
        Icon(
          Icons.star,
          size: 12,
          color: count > 2 ? Colors.deepOrange[300] : Colors.deepOrange[100],
        ),
        Icon(
          Icons.star,
          size: 12,
          color: count > 3 ? Colors.deepOrange[300] : Colors.deepOrange[100],
        ),
        Icon(
          Icons.star,
          size: 12,
          color: count > 4 ? Colors.deepOrange[300] : Colors.deepOrange[100],
        )
      ],
    );
  }

  Widget commentPhotos(itemIndex) {
    return Container(
      margin: EdgeInsets.only(right: 5, left: 5, bottom: 10),
      height: assessmentList[itemIndex].imgUrls.length != 0 ? 60 : 0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: assessmentList[itemIndex].imgUrls.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.all(2.0),
                child: FlatButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CommentImageView(itemIndex, index))),
                  child: Image.network(
                    assessmentList[itemIndex].imgUrls[index],
                  ),
                ));
          }),
    );
  }
}

class likeAndDislike extends StatefulWidget {
  int index;

  likeAndDislike(this.index);
  @override
  _likeAndDislikeState createState() => _likeAndDislikeState(index);
}

class _likeAndDislikeState extends State<likeAndDislike> {
  int index;

  _likeAndDislikeState(this.index);

  String message = 'این نظر برای شما مفید بود؟';
  bool visibility = true;

  List<AssessmentModel> assessmentList = AssessmentModel.fetchAll();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Row(
            children: [
              Text(
                message,
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.grey[700],
                    fontSize: 14),
              ),
            ],
          ),
        ),
        Visibility(
            visible: visibility,
            child: Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5, right: 20),
              child: Row(
                children: [
                  FlatButton(
                      minWidth: 70,
                      highlightColor: Colors.green,
                      onPressed: () {
                        setState(() {
                          message = 'تشکر';
                          visibility = false;
                        });
                      },
                      child: Row(
                        children: [
                          Text(
                            'بله',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.0),
                          ),
                          Text(
                            ' (${assessmentList[index].commentLike})',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                color: Colors.grey),
                          )
                        ],
                      ),
                      color: Colors.grey[200],
                      textColor: Colors.grey[800],
                      padding: EdgeInsets.only(left: 5, right: 5),
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20.0))),
                  Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: FlatButton(
                        minWidth: 70,
                        highlightColor: Colors.red,
                        onPressed: () {
                          setState(() {
                            message = 'تشکر';
                            visibility = false;
                          });
                        },
                        child: Row(
                          children: [
                            Text(
                              'خیر',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14.0),
                            ),
                            Text(
                              ' (${assessmentList[index].commentDislike})',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                  color: Colors.grey),
                            )
                          ],
                        ),
                        color: Colors.grey[200],
                        textColor: Colors.grey[800],
                        padding: EdgeInsets.only(left: 5, right: 5),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(20.0))),
                  )
                ],
              ),
            ))
      ],
    );
  }
}
