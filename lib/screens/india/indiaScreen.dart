import 'package:flutter/material.dart';
import 'package:myapp2/components/chartWidget.dart';
import 'package:myapp2/components/dataWidgets.dart';
import 'package:myapp2/components/myText.dart';
import 'package:myapp2/services/indiaService.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class IndiaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
            padding: EdgeInsets.all(15),
            child: FutureBuilder(
              future: IndiaService().getIndiaApi(context),
              builder: (builder, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: Column(
                      children: [
                        Container(
                          height: size.height / 3.5,
                          width: size.width / 1.5,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Mytext(text: 'Loading...'),
                              SizedBox(
                                width: 20,
                              ),
                              CircularProgressIndicator(
                                color: Colors.orange,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Mytext(
                        text: 'Current Data',
                        size: 30,
                        weight: FontWeight.w400,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ChartContainer(
                        color: Colors.orange.withOpacity(0.5),
                        data: snapshot.data,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(),
                      Mytext(
                        text: 'Today\'s Data',
                        weight: FontWeight.w400,
                        size: 30,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TodayDataWidget(
                        data: snapshot.data,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(),
                      Mytext(
                        text: 'More Details',
                        weight: FontWeight.w400,
                        size: 30,
                      ),
                      AvgData(
                        color: Colors.transparent,
                        data: snapshot.data,
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  );
                }
              },
            )),
      ),
    );

    // child: Scaffold(
    //   backgroundColor: Colors.transparent,
    //   body: Center(
    //     child: SingleChildScrollView(
    //         padding: EdgeInsets.all(15),
    //         child: FutureBuilder(
    //           future: IndiaService().getIndiaApi(),
    //           builder: (builder, snapshot) {
    //             if (!snapshot.hasData) {
    //               return Center(
    //                 child: Column(
    //                   children: [
    //                     Container(
    //                       child: Row(
    //                         mainAxisAlignment: MainAxisAlignment.center,
    //                         children: [
    //                           Mytext(text: 'Loading...'),
    //                           SizedBox(
    //                             width: 20,
    //                           ),
    //                           CircularProgressIndicator(
    //                             color: Colors.orange,
    //                           )
    //                         ],
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               );
    //             } else {
    //               return Column(
    //                 children: [
    //                   ChartContainer(
    //                     color: Colors.orange,
    //                     data: snapshot.data,
    //                   ),
    //                   SizedBox(
    //                     height: 10,
    //                   ),
    //                   TodayDataWidget(
    //                     data: snapshot.data,
    //                   ),
    //                   SizedBox(
    //                     height: 10,
    //                   ),
    //                   AvgData(
    //                     color: Colors.green,
    //                     data: snapshot.data,
    //                   )
    //                 ],
    //               );
    //             }
    //           },
    //         )),
    //   ),
    // ),
  }
}
