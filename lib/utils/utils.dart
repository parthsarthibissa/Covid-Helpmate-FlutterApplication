import 'package:flutter/material.dart';

class MainUtils {
  Color getColor(String metaData) {
    if (metaData == 'Test') {
      return Colors.blue;
    } else if (metaData == 'Death') {
      return Colors.red;
    } else if (metaData == 'Recovered') {
      return Colors.green;
    } else if (metaData == 'Cases') {
      return Colors.yellow.shade600;
    } else {
      return Colors.blue.withOpacity(0.5);
    }
  }

  String getImage(String metaData) {
    if (metaData == 'Test') {
      return 'starfiles/test.png';
    } else if (metaData == 'Death') {
      return 'starfiles/death.png';
    } else if (metaData == 'Recovered') {
      return 'starfiles/recovered.png';
    } else if (metaData == 'Cases') {
      return 'starfiles/cases.png';
    } else {
      return 'starfiles/coronavirus.png';
    }
  }
}
