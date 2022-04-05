import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp2/components/myText.dart';
import 'package:myapp2/screens/countryData/country.dart';
import 'package:myapp2/services/countryService.dart';
import 'package:myapp2/services/indiaService.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class Countries extends StatefulWidget {
  @override
  _CountriesState createState() => _CountriesState();
}

class _CountriesState extends State<Countries> {
  final TextEditingController _controller = TextEditingController();
  bool _validate = false;
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
              ],
              enabled: true,
              controller: _controller,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.lightGreen.shade300,
                  contentPadding: EdgeInsets.all(15),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25)),
                  hintStyle: TextStyle(color: Colors.black, fontSize: 20),
                  errorText: _validate ? 'Value Can\'t Be Empty' : null,
                  hintText: 'Country Name'),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          InkWell(
            onTap: () {
              print('C' + _controller.text);
              Navigator.of(context).push(MaterialPageRoute(builder: (builder) {
                return CountryDataScreen(
                  countryName: _controller.text,
                );
              }));
            },
            child: Container(
                alignment: Alignment.center,
                height: size.height * 0.075,
                width: size.width * 0.5,
                decoration: BoxDecoration(
                    color: Colors.lightGreen.shade700,
                    borderRadius: BorderRadius.circular(25)),
                child: Mytext(
                  text: 'Search',
                 
                  size: 20,
                )),
          )
        ]),
      ),
    );
  }
}
