import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/rendering.dart';
import 'package:auto_size_text/auto_size_text.dart';

class StateWiseData extends StatefulWidget {
  @override
  _StateWiseDataState createState() => _StateWiseDataState();
}

class _StateWiseDataState extends State<StateWiseData> {
  final String url = 'https://covid-19india-api.herokuapp.com/all';

  List<String> stateresuts;
  var x;
  void initState() {
    super.initState();
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
            elevation: 5,
            centerTitle: true,
            title: FittedBox(
              fit: BoxFit.fitWidth,
              child: new Text('Corona Virus India Statewise Data'),
            )),
        body: new FutureBuilder(
            future: getdata(),
            builder: (ctx, snapshot) {
              if (snapshot.hasData) {
                return new ListView.builder(
                    itemCount: x == null ? 0 : x[1]['state_data'].length,
                    itemBuilder: (context, position) {
                      return new Card(
                        child: new Column(children: <Widget>[
                          new AutoSizeText(
                            x[1]['state_data'][position]['state']
                                    .toUpperCase() +
                                '\n\n' +
                                'Total Active Cases : ' +
                                x[1]['state_data'][position]['active']
                                    .toString() +
                                '\n\n' +
                                'Total Confirmed Cases : ' +
                                x[1]['state_data'][position]['confirmed']
                                    .toString() +
                                '\n\n' +
                                'Total Deaths : ' +
                                x[1]['state_data'][position]['deaths']
                                    .toString() +
                                '\n\n' +
                                'Total Recovered : ' +
                                x[1]['state_data'][position]['recovered']
                                    .toString() +
                                '\n\n',
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
