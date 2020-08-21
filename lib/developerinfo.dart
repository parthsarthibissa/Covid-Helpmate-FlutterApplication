import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Developerspage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: new AutoSizeText('Developers Info'),
        ),
        body: new ListView(
          children: [
            new AutoSizeText('Programming Corner : \n',
                textAlign: TextAlign.center,
                minFontSize: 20,
                style: TextStyle(fontWeight: FontWeight.bold)),
            new Text('Parth Sarthi Bissa\n',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic)),
            new Text('Nitesh Mehto\n',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic)),
            new Text('Pooja Bhather\n',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic)),
            new Divider(
              color: Colors.red[200],
            ),
            new Text('UI Designed By : \n',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            new Text('Neha Khichi',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic))
          ],
        ));
  }
}
