import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:auto_size_text/auto_size_text.dart';

class Indiapage extends StatefulWidget {
  Indiapagestate createState() => new Indiapagestate();
}

class Indiapagestate extends State<Indiapage> {
  final String url = 'https://covid-19india-api.herokuapp.com/all';
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
    if(this.mounted) {
      setState(() {

      });
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
                'Corona Virus India Data',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
        ),
        body: new FutureBuilder(
            future: getdata(),
            builder: (ctx, snapshot) {
              if (snapshot.hasData) {
                return new ListView.builder(
                    itemCount: x[0] == null ? 0 : 1,
                    itemBuilder: (context, position) {
                      return new Container(
                          child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                            new Card(
                                child: new AutoSizeText(
                                    'Active Cases : ' +
                                        x[0]['active_cases'].toString() +
                                        '\n\n',
                                    minFontSize: 15,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                color: Colors.blue[400]),
                            new Card(
                                child: new AutoSizeText(
                                    'Active Rate : ' +
                                        x[0]['active_rate'].toString() +
                                        '\n\n',
                                    minFontSize: 15,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                color: Colors.blue[400]),
                            new Card(
                                child: new AutoSizeText(
                                    'Confirmed Cases : ' +
                                        x[0]['confirmed_cases'].toString() +
                                        '\n\n',
                                    minFontSize: 15,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                color: Colors.blue[400]),
                            new Card(
                                child: new AutoSizeText(
                                    'Death Cases : ' +
                                        x[0]['death_cases'].toString() +
                                        '\n\n',
                                    minFontSize: 15,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                color: Colors.blue[400]),
                            new Card(
                                child: new AutoSizeText(
                                    'Death Rate : ' +
                                        x[0]['death_rate'].toString() +
                                        '\n\n',
                                    minFontSize: 15,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                color: Colors.blue[400]),
                            new Card(
                                child: new AutoSizeText(
                                    'Recovered Cases : ' +
                                        x[0]['recovered_cases'].toString() +
                                        '\n\n',
                                    minFontSize: 15,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                color: Colors.blue[400]),
                            new Card(
                                child: new AutoSizeText(
                                    'Recovery Rate : ' +
                                        x[0]['recovered_rate'].toString() +
                                        '\n\n',
                                    minFontSize: 15,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                color: Colors.blue[400])
                          ]));
                    });
              } else if (snapshot.hasError) {
                return new Center(
                    child: new AutoSizeText(
                        "<.<. Error Connecting to the Internet .>.>"));
              } else {
                return new Center(child: new CircularProgressIndicator());
              }
            }));
  }
}
