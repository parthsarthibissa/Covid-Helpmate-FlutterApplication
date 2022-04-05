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

    return Scaffold(
      appBar: AppBar(),
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
                  size: 22, text: 'No Data Found For the Country you entered'),
            ));
          } else {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Mytext(
                      text: 'Search Result',
                      size: 30,
                      weight: FontWeight.w400,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue.withOpacity(0.5)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                              child: Mytext(
                            size: 25,
                            text: countryName.toUpperCase(),
                          )),
                          Container(
                            height: size.height * 0.15,
                            width: size.width * 0.35,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(snapshot
                                      .data.countryInfo['flag']
                                      .toString())),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Mytext(
                      text: 'Current Data',
                      size: 30,
                      weight: FontWeight.w400,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ChartContainer(
                      color: Colors.blue.withOpacity(0.5),
                      data: snapshot.data,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Mytext(
                      text: 'Today\'s Data',
                      size: 30,
                      weight: FontWeight.w400,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TodayDataWidget(
                      data: snapshot.data,
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
