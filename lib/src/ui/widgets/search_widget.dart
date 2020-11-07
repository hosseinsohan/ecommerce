import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mercikala/src/utils/font.dart';

class SearchBarWidget extends StatefulWidget {
  final Function callback;
  final String text;
  SearchBarWidget({this.callback, this.text});

  @override
  _SearchBarWidgetState createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  String search;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      child: TextField(
        onChanged: (value) {
          setState(() {
            search = value;
          });
        },
        textInputAction: TextInputAction.search,
        onSubmitted: (value){
          widget.callback(value);
        },
        decoration: new InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
          border: new OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(8.0),
            ),
          ),
          prefixIcon: IconButton(onPressed: () => widget.callback(search), icon: Icon(Icons.search, color: Colors.black,)),
          filled: true,
          hintStyle: new TextStyle(
              color: Colors.black,
              fontFamily: fontIRANSans,
              fontWeight: FontWeight.w500,
              fontSize: 13),
          hintText: widget.text==null?"جستجو ...":"جستجو در ${widget.text}",
          fillColor: Color(0xffe8edef),
          focusedBorder: OutlineInputBorder(
            gapPadding: 0.0,
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.1)),
            borderRadius: BorderRadius.circular(8.0),
          ),
          enabledBorder: OutlineInputBorder(
            gapPadding: 0.0,
            borderSide: BorderSide(color: Color(0xffe8edef)),
            borderRadius: BorderRadius.circular(8.0),
          ),
          errorBorder: OutlineInputBorder(
            gapPadding: 0.0,
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            gapPadding: 0.0,
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
