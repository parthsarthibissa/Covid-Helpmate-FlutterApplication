import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp2/components/myText.dart';

class DetailTile extends StatelessWidget {
  final String text;
  final String data;

  DetailTile({@required this.data, @required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white24, borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Mytext(
            text: text,
            size: 18,
          ),
          Mytext(
            text: data,
            size: 18,
          )
        ],
      ),
    );
  }
}
