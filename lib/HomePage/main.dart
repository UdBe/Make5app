import 'package:flutter/material.dart';
import 'expandable_cards.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Image.asset(
                  'Assets/vector4.png',
                  width: MediaQuery.of(context).size.width,
                  // height: MediaQuery.of(context).size.height / 3,
                  fit: BoxFit.fill,
                ),
              ],
            ),
            Column(
              children: [
                Image.asset(
                  'Assets/vector7.png',
                  width: MediaQuery.of(context).size.width,
                  // height: MediaQuery.of(context).size.height / 5.5,
                  fit: BoxFit.fill,
                ),
                Spacer(),
                ExpandableCards(),
                Spacer(),
              ],
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 30, bottom: 40, left: 20, right: 20),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Spacer(),
                      Image.asset(
                        'Assets/MLSClogo.png',
                        scale: 2.75,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 8,
                  left: MediaQuery.of(context).size.width / 10),
              child: Text(
                "Timeline",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontFamily: 'Jejugothic',
                ),
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}