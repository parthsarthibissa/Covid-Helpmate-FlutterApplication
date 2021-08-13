import 'package:flutter/material.dart';
import 'package:myapp2/components/chartWidget.dart';
import 'package:myapp2/components/dataWidgets.dart';
import 'package:myapp2/components/header.dart';
import 'package:myapp2/components/myText.dart';
import 'package:myapp2/services/worldService.dart';

class WorldScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: FutureBuilder(
            future: WorldService().getWorldApi(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: Column(
                    children: [
                      Header(
                        text: 'World',
                        imageURL:
                            'https://images.unsplash.com/photo-1534709153997-d6659469f951?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjR8fGVhcnRofGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                        color: [
                          [Colors.blue, Colors.transparent, Colors.green],
                          [Colors.blue, Colors.transparent, Colors.green],
                          [Colors.blue, Colors.transparent, Colors.green]
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
                              color: Colors.blue,
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
                      text: 'World',
                      imageURL:
                          'https://images.unsplash.com/photo-1534709153997-d6659469f951?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjR8fGVhcnRofGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                      color: [
                        [Colors.blue, Colors.transparent, Colors.green],
                        [Colors.blue, Colors.transparent, Colors.green],
                        [Colors.blue, Colors.transparent, Colors.green]
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ChartContainer(
                      color: Colors.green,
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
                      color: Colors.blue,
                      data: snapshot.data,
                    )
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
