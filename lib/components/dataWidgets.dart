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
        height: size.height * 0.2,
        width: size.width - 50,
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(25)),
        child: Column(children: [
          Mytext(
            text: 'Today',
            size: 30,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Mytext(
                    text: 'Recovered',
                    size: 22,
                    color: Colors.green,
                  ),
                  Mytext(
                    text: data.todayRecovered.toString(),
                    size: 20,
                  )
                ],
              ),
              SizedBox(
                width: 30,
              ),
              Column(
                children: [
                  Mytext(
                    text: 'Cases',
                    size: 22,
                    color: Colors.yellow,
                  ),
                  Mytext(
                    text: data.todayCases.toString(),
                    size: 20,
                  ),
                ],
              ),
              SizedBox(
                width: 30,
              ),
              Column(
                children: [
                  Mytext(
                    text: 'Deaths',
                    size: 22,
                    color: Colors.red,
                  ),
                  Mytext(
                    text: data.todayDeaths.toString(),
                    size: 20,
                  ),
                ],
              ),
            ],
          ),
        ]));
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
      height: size.height * 0.55,
      width: size.width - 50,
      decoration: BoxDecoration(
          color: color.withOpacity(0.75),
          borderRadius: BorderRadius.circular(25)),
      child: ListView(
        padding: EdgeInsets.all(15),
        children: [
          Mytext(
            text: 'More Details',
            size: 30,
          ),
          DetailTile(
            data: data.activePerOneMillion.toString(),
            text: 'ActivePerOneMillion',
          ),
          DetailTile(
            data: data.casesPerOneMillion.toString(),
            text: 'CasesPerOneMillion',
          ),
          DetailTile(
            data: data.criticalPerOneMillion.toString(),
            text: 'CriticalPerOneMillion',
          ),
          DetailTile(
            data: data.deathsPerOneMillion.toString(),
            text: 'DeathsPerOneMillion',
          ),
          DetailTile(
            data: data.recoveredPerOneMillion.toString(),
            text: 'RecoveredPerOne....',
          ),
          DetailTile(
            data: data.testsPerOneMillion.toString(),
            text: 'TestsPerOneMillion',
          ),
          DetailTile(
            data: data.oneCasePerPeople.toString(),
            text: 'OneCasePerPeople',
          ),
          DetailTile(
            data: data.oneTestPerPeople.toString(),
            text: 'OneTestPerPeople',
          ),
          DetailTile(
            data: data.oneDeathPerPeople.toString(),
            text: 'OneDeathPerPeople',
          ),
        ],
      ),
    );
  }
}
