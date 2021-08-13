import 'package:flutter/material.dart';
import 'package:myapp2/components/chartWidget.dart';
import 'package:myapp2/components/dataWidgets.dart';
import 'package:myapp2/components/header.dart';
import 'package:myapp2/components/myText.dart';
import 'package:myapp2/services/indiaService.dart';

class IndiaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: FutureBuilder(
          future: IndiaService().getIndiaApi(),
          builder: (builder, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Column(
                  children: [
                    Header(
                      imageURL:
                          'https://images.unsplash.com/photo-1521427185932-e69b86608ff6?ixid=MnwxMjA3fDB8MHxzZWFyY2h8ODZ8fGluZGlhfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                      text: 'India',
                      color: [
                        [Colors.orange, Colors.transparent, Colors.orange],
                        [Colors.white, Colors.transparent, Colors.white],
                        [Colors.green, Colors.transparent, Colors.green],
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Mytext(text: 'Loading...'),
                          SizedBox(
                            width: 20,
                          ),
                          CircularProgressIndicator(
                            color: Colors.orange,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Column(
                children: [
                  Header(
                    imageURL:
                        'https://images.unsplash.com/photo-1521427185932-e69b86608ff6?ixid=MnwxMjA3fDB8MHxzZWFyY2h8ODZ8fGluZGlhfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                    text: 'India',
                    color: [
                      [Colors.orange, Colors.transparent, Colors.orange],
                      [Colors.white, Colors.transparent, Colors.white],
                      [Colors.green, Colors.transparent, Colors.green],
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ChartContainer(
                    color: Colors.orange,
                    data: snapshot.data,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TodayDataWidget(
                    data: snapshot.data,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AvgData(
                    color: Colors.green,
                    data: snapshot.data,
                  )
                ],
              );
            }
          },
        )),
      ),
    );
  }
}
