import 'dart:async';

import 'package:fl_chart/fl_chart.dart' as fl;
import 'package:flutter/material.dart';
import 'package:myapp2/components/myText.dart';

class ChartBar extends StatefulWidget {
  final String text;
  final dynamic active;
  final dynamic deaths;
  final dynamic recovered;
  final dynamic cases;
  ChartBar(
      {@required this.text,
      @required this.deaths,
      @required this.cases,
      @required this.recovered,
      @required this.active});

  @override
  _ChartBarState createState() => _ChartBarState();
}

class _ChartBarState extends State<ChartBar> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white24, borderRadius: BorderRadius.circular(25)),
          height: size.height * 0.25,
          margin: EdgeInsets.all(20),
          width: size.width / 2,
          child: fl.PieChart(
              fl.PieChartData(
                  borderData: fl.FlBorderData(show: false),
                  sectionsSpace: 0,
                  startDegreeOffset: 120,
                  sections: [
                    fl.PieChartSectionData(
                        color: Colors.green,
                        radius: 50,
                        showTitle: false,
                        value: widget.recovered.toDouble()),
                    fl.PieChartSectionData(
                        color: Colors.red,
                        showTitle: false,
                        radius: 60,
                        value: widget.deaths.toDouble()),
                    fl.PieChartSectionData(
                        color: Colors.yellow,
                        showTitle: false,
                        radius: 40,
                        value: widget.cases.toDouble())
                  ]),
              swapAnimationDuration: Duration(seconds: 1), // Optional
              swapAnimationCurve: Curves.easeInCirc),
        ),
        Container(
          height: size.height * 0.25,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Mytext(
                text: widget.recovered.toString(),
                color: Colors.green,
                size: 22,
              ),
              Mytext(size: 18, text: 'Recovered'),
              Mytext(
                size: 22,
                text: widget.active.toString(),
                color: Colors.yellow,
              ),
              Mytext(
                text: 'Cases',
                size: 18,
              ),
              Mytext(
                size: 22,
                text: widget.deaths.toString(),
                color: Colors.red,
              ),
              Mytext(size: 18, text: 'Deaths'),
            ],
          ),
        )
      ],
    );
  }
}
