import 'package:flutter/material.dart';

import 'package:myapp2/components/detailTile.dart';
import 'package:myapp2/components/myText.dart';

class TodayDataWidget extends StatelessWidget {
  final dynamic data;
  TodayDataWidget({@required this.data});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.25,
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.transparent, borderRadius: BorderRadius.circular(25)),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            width: size.width * 0.4,
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.green, width: 0.75),
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('starfiles/recovered.png'))),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Mytext(
                    text: 'Recovered',
                    size: 22,
                    weight: FontWeight.w500,
                    color: Colors.green,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Mytext(
                    text: data.todayRecovered.toString(),
                    size: 20,
                    weight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(12),
            width: size.width * 0.4,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.yellow.shade600, width: 0.75),
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('starfiles/cases.png'))),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Mytext(
                    text: 'Cases',
                    size: 22,
                    weight: FontWeight.w500,
                    color: Colors.amber,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Mytext(
                    text: data.todayCases.toString(),
                    size: 20,
                    weight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: size.width * 0.4,
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.red, width: 0.75),
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('starfiles/death.png'))),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Mytext(
                    text: 'Deaths',
                    size: 22,
                    color: Colors.red,
                    weight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Mytext(
                    text: data.todayRecovered.toString(),
                    size: 20,
                    weight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AvgData extends StatelessWidget {
  final dynamic data;
  final Color color;

  AvgData({@required this.data, @required this.color});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.3,
      width: size.width,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(25)),
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.all(15),
        children: [
          DetailTile(
            metadata: 'Cases',
            data: data.activePerOneMillion.toString(),
            text: 'ActivePerOneMillion',
          ),
          DetailTile(
            metadata: 'Cases',
            data: data.casesPerOneMillion.toString(),
            text: 'CasesPerOneMillion',
          ),
          DetailTile(
            metadata: 'Cases',
            data: data.criticalPerOneMillion.toString(),
            text: 'CriticalPerOneMillion',
          ),
          DetailTile(
            metadata: 'Death',
            data: data.deathsPerOneMillion.toString(),
            text: 'DeathsPerOneMillion',
          ),
          DetailTile(
            metadata: 'Recovered',
            data: data.recoveredPerOneMillion.toString(),
            text: 'RecoveredPerOneMillion',
          ),
          DetailTile(
            metadata: 'Test',
            data: data.testsPerOneMillion.toString(),
            text: 'TestsPerOneMillion',
          ),
          DetailTile(
            metadata: 'Cases',
            data: data.oneCasePerPeople.toString(),
            text: 'OneCasePerPeople',
          ),
          DetailTile(
            metadata: 'Test',
            data: data.oneTestPerPeople.toString(),
            text: 'OneTestPerPeople',
          ),
          DetailTile(
            metadata: 'Death',
            data: data.oneDeathPerPeople.toString(),
            text: 'OneDeathPerPeople',
          ),
        ],
      ),
    );
  }
}
