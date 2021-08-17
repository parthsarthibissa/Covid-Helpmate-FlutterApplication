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
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white70,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1526778548025-fa2f459cd5c1?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8d29ybGQlMjBtYXB8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'))),
            child: Stack(children: [
              Align(
                  alignment: Alignment.center,
                  heightFactor: 4,
                  widthFactor: 5,
                  child: Mytext(
                    text: "COUNTRY",
                    size: 50,
                    color: Colors.white,
                  )),
              WaveWidget(
                config: CustomConfig(
                  gradients: [
                    [Colors.yellow, Colors.transparent, Colors.blue],
                    [Colors.orange, Colors.transparent, Colors.green],
                    [Colors.red, Colors.transparent, Colors.indigo],
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
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Container(
                            height: size.height * 0.1,
                            width: size.width,
                            padding: EdgeInsets.all(20),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25)),
                            child: TextField(
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp("[a-zA-Z]")),
                              ],
                              enabled: true,
                              controller: _controller,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(15),
                                  focusColor: Colors.white,
                                  icon: Icon(FontAwesomeIcons.globe),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25)),
                                  hintStyle: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                  errorText: _validate
                                      ? 'Value Can\'t Be Empty'
                                      : null,
                                  hintText: 'Country Name'),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        InkWell(
                          onTap: () {
                            print('C' + _controller.text);
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (builder) {
                              return CountryDataScreen(
                                countryName: _controller.text,
                              );
                            }));
                          },
                          child: Container(
                              alignment: Alignment.center,
                              height: size.height * 0.05,
                              width: size.width * 0.5,
                              decoration: BoxDecoration(
                                  color: Colors.yellow,
                                  borderRadius: BorderRadius.circular(25)),
                              child: Mytext(
                                text: 'Search',
                                size: 20,
                              )),
                        )
                      ]),
                ),
              )
            ])));
  }
}
