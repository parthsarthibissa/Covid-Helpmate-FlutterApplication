import 'package:flutter/material.dart';
import 'package:myapp2/components/myText.dart';
import 'package:myapp2/services/indiaService.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class Header extends StatefulWidget {
  final String imageURL;
  final String text;
  final List<List<Color>> color;
  Header({@required this.imageURL, @required this.color, @required this.text});

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              alignment: Alignment.center,
              image: NetworkImage(widget.imageURL)),
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25))),
      child: Stack(
        children: [
          Align(
              alignment: Alignment.center,
              heightFactor: 4,
              widthFactor: 5,
              child: Mytext(
                text: widget.text,
                size: 50,
                color: Colors.white,
              )),
          WaveWidget(
            config: CustomConfig(
              gradients: widget.color,
              durations: [5000, 5000, 5000],
              heightPercentages: [0.18, 0.42, 0.75],
              gradientBegin: Alignment.bottomLeft,
              gradientEnd: Alignment.topRight,
            ),
            waveAmplitude: 0,
            size: Size(size.width, size.height * 0.28),
          ),
        ],
      ),
    );
  }
}
