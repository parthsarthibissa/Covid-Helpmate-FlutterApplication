import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Mytext extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight weight;
  final Color color;
  Mytext({@required this.text, this.weight, this.size, this.color});
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      this.text,
      textAlign: TextAlign.center,
      style: GoogleFonts.balooThambi(
          color: color, fontSize: size, fontWeight: weight),
    );
  }
}
