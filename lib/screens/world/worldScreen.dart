import 'package:flutter/material.dart';
import 'package:myapp2/components/chartWidget.dart';
import 'package:myapp2/components/dataWidgets.dart';

import 'package:myapp2/components/myText.dart';
import 'package:myapp2/services/worldService.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class WorldScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white70,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1534709153997-d6659469f951?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjR8fGVhcnRofGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'))),
            child: Stack(children: [
              Align(
                  alignment: Alignment.center,
                  heightFactor: 4,
                  widthFactor: 5,
                  child: Mytext(
                    text: "GLOBAL",
                    size: 50,
                    color: Colors.white,
                  )),
              WaveWidget(
                config: CustomConfig(
                  gradients: [
                    [Colors.blue, Colors.transparent, Colors.blue],
                    [Colors.white, Colors.transparent, Colors.white],
                    [Colors.green, Colors.transparent, Colors.green],
                  ],
                  durations: [5000, 5000, 5000],
                  heightPercentages: [0.18, 0.42, 0.75],
                  gradientBegin: Alignment.bottomLeft,
                  gradientEnd: Alignment.topRight,
                ),
                waveAmplitude: 0,
                size: Size(size.width, size.height * 0.28),
              ),
              Scaffold(
                backgroundColor: Colors.transparent,
                body: Center(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(15),
                    child: FutureBuilder(
                      future: WorldService().getWorldApi(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: Column(
                              children: [
                                Container(
                                  height: size.height / 3.5,
                                  width: size.width / 1.5,
                                  decoration: BoxDecoration(
                                      color: Colors.white60,
                                      borderRadius: BorderRadius.circular(20)),
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
                              ChartContainer(
                                color: Colors.white60,
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
                                color: Colors.white60,
                                data: snapshot.data,
                              )
                            ],
                          );
                        }
                      },
                    ),
                  ),
                ),
              )
            ])));
  }
}
