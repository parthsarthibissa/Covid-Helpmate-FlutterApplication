import 'package:flutter/material.dart';
import 'package:myapp2/components/chartWidget.dart';
import 'package:myapp2/components/dataWidgets.dart';
import 'package:myapp2/components/myText.dart';
import 'package:myapp2/services/countryService.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class CountryDataScreen extends StatelessWidget {
  final String countryName;
  CountryDataScreen({@required this.countryName});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
        decoration: BoxDecoration(
            color: Colors.white70,
            image: DecorationImage(
                fit: BoxFit.cover,
                alignment: Alignment.center,
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1526778548025-fa2f459cd5c1?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8d29ybGQlMjBtYXB8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'))),
        child: Stack(children: [
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
            body: FutureBuilder(
              future: CountryService(country: countryName).getCountryApi(),
              builder: (builder, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                                color: Colors.yellow,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (!snapshot.hasData) {
                  return Center(
                      child: Container(
                    height: size.height / 3.5,
                    width: size.width / 1.5,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.circular(25)),
                    child: Mytext(
                        size: 22,
                        text: 'No Data Found For the Country you entered'),
                  ));
                } else {
                  return SingleChildScrollView(
                    padding: EdgeInsets.only(top: 75, left: 5, right: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                                child: Mytext(
                              size: 25,
                              color: Colors.white,
                              text: countryName.toUpperCase(),
                            )),
                            Container(
                              height: size.height * 0.15,
                              width: size.width * 0.35,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white60,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Image.network(
                                  snapshot.data.countryInfo['flag'].toString()),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        ChartContainer(
                          color: Colors.white70,
                          data: snapshot.data,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TodayDataWidget(
                          data: snapshot.data,
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ]));
  }
}
