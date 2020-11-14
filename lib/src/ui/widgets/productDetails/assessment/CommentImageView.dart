import 'package:flutter/material.dart';
import 'package:mercikala/src/utils/productDetails/assessmentModel.dart';

class CommentImageView extends StatelessWidget {
  int itemIndex;
  int index;
  CommentImageView(this.itemIndex, this.index);

  List<AssessmentModel> assessmentList = AssessmentModel.fetchAll();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton.extended(
          onPressed: () => Navigator.pop(context),
          label: Text('X'),
          backgroundColor: Colors.grey,
        ),
      ),
      body: Center(
        child: Image.network(
          assessmentList[itemIndex].imgUrls[index],
        ),
      ),
    );
  }
}
