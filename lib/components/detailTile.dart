import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp2/components/myText.dart';
import 'package:myapp2/utils/utils.dart';

class DetailTile extends StatelessWidget {
  final String text;
  final String data;
  final String metadata;

  DetailTile(
      {@required this.data, @required this.text, @required this.metadata});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          border:
              Border.all(width: 0.75, color: MainUtils().getColor(metadata)),
          borderRadius: BorderRadius.circular(15)),
      width: size.width * 0.4,
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(MainUtils().getImage(metadata))),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              text,
              style: TextStyle(fontSize: 18),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              data,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          )
        ],
      ),
    );
  }
}
