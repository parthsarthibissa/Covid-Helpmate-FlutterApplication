import 'package:flutter/material.dart';
import 'package:myapp2/components/header.dart';

class Countries extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(
              text: 'Country',
              imageURL:
                  'https://images.unsplash.com/photo-1526778548025-fa2f459cd5c1?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8d29ybGQlMjBtYXB8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
              color: [
                [
                  Colors.yellow,
                  Colors.transparent,
                  Colors.green,
                ],
                [
                  Colors.blue,
                  Colors.transparent,
                  Colors.green,
                ],
                [
                  Colors.black,
                  Colors.transparent,
                  Colors.yellow,
                ],
              ],
            )
          ],
        ),
      ),
    ));
  }
}
