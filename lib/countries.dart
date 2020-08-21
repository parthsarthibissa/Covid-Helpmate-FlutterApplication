import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:http/http.dart' as http;

class Countrypage extends StatefulWidget {
  Countrypagestate createState() => new Countrypagestate();
}

class Countrypagestate extends State<Countrypage> {
  final String url = 'https://api.covid19api.com/summary';
  var x;
  void initState() {
    super.initState();
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
            elevation: 5,
            centerTitle: true,
            title: FittedBox(
              fit: BoxFit.fitWidth,
              child: new Text('Corona Virus CountryWise Data'),
            )),
        body: new FutureBuilder(
            future: getdata(),
            builder: (ctx, snapshot) {
              if (snapshot.hasData) {
                return new ListView.builder(
                    itemCount: x == null ? 0 : x['Countries'].length,
                    itemBuilder: (context, position) {
                      return new Card(
                        child: new Column(children: <Widget>[
                          new AutoSizeText(
                            x['Countries'][position]['Country'].toUpperCase() +
                                '\n\n' +
                                'Total Confirmed : ' +
                                x['Countries'][position]['TotalConfirmed']
                                    .toString() +
                                '\n\n' +
                                'Total Deaths : ' +
                                x['Countries'][position]['TotalConfirmed']
                                    .toString() +
                                '\n\n' +
                                'Total Recovered : ' +
                                x['Countries'][position]['TotalRecovered']
                                    .toString(),
                            wrapWords: false,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ]),
                        color: Colors.blue[400],
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
