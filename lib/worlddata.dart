import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:http/http.dart' as http;

class Worldpage extends StatefulWidget {
  Worldpagestate createState() => new Worldpagestate();
}

class Worldpagestate extends State<Worldpage> {
  final String url = 'https://api.covid19api.com/summary';
  var x;
  void initState() {
    super.initState();
    this.getdata();
  }

  Future<String> getdata() async {
    var response = await http.get(
      Uri.encodeFull(url),
    );
    x = json.decode(response.body);

    if (this.mounted) {
      setState(() {});
    }
    return 'Success';
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          title: FittedBox(
              fit: BoxFit.fitWidth,
              child: new Text(
                'Corona Virus World Data',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
        ),
        body: new FutureBuilder(
            future: getdata(),
            builder: (ctx, snapshot) {
              if (snapshot.hasData) {
                return new ListView.builder(
                    itemCount: x == null ? 0 : 1,
                    itemBuilder: (context, position) {
                      return new Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          new Card(
                              child: new AutoSizeText(
                                  'Total Confirmed : ' +
                                      x['Global']['TotalConfirmed'].toString() +
                                      '\n\n',
                                  minFontSize: 15,
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              color: Colors.blue[400]),
                          new Card(
                              child: new AutoSizeText(
                                  'New Confirmed : ' +
                                      x['Global']['NewConfirmed'].toString() +
                                      '\n\n',
                                  minFontSize: 15,
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              color: Colors.blue[400]),
                          new Card(
                              child: new AutoSizeText(
                                'Total Deaths : ' +
                                    x['Global']['TotalDeaths'].toString() +
                                    '\n\n',
                                minFontSize: 15,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              color: Colors.blue[400]),
                          new Card(
                              child: new AutoSizeText(
                                  'New Deaths : ' +
                                      x['Global']['NewDeaths'].toString() +
                                      '\n\n',
                                  minFontSize: 15,
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              color: Colors.blue[400]),
                          new Card(
                              child: new AutoSizeText(
                                  'Total Recovered : ' +
                                      x['Global']['TotalRecovered'].toString() +
                                      '\n\n',
                                  minFontSize: 15,
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              color: Colors.blue[400]),
                          new Card(
                              child: new AutoSizeText(
                                  'New Recovered : ' +
                                      x['Global']['NewRecovered'].toString() +
                                      '\n\n',
                                  minFontSize: 15,
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              color: Colors.blue[400]),
                        ],
                      );
                    });
              } else if (snapshot.hasError) {
                return new Center(
                    child:
                        new Text("<.<. Error Connecting to the Internet .>.>"));
              } else {
                return new Center(child: new CircularProgressIndicator());
              }
            }));
  }
}
