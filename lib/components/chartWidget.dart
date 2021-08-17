import 'package:flutter/material.dart';
import 'package:myapp2/components/chart.dart';
import 'package:myapp2/models/indiaModel.dart';

class ChartContainer extends StatelessWidget {
  final dynamic data;
  final Color color;
  ChartContainer({@required this.data, @required this.color});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.37,
      width: size.width,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(25)),
      child: ChartBar(
          text: 'Active',
          deaths: data.deaths,
          recovered: data.recovered,
          active: data.active,
          cases: data.cases),
    );
  }
}
