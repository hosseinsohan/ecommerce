import 'package:flutter/material.dart';

class TopDownWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.blueGrey.withOpacity(0.1),
          shape: BoxShape.circle),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Icon(Icons.keyboard_arrow_up),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Icon(Icons.keyboard_arrow_down),
          ),
        ],
      ),
    );
  }
}
