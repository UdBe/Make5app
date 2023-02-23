// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:makeathon5_app/FirstPage/google_sign_in.dart';
import 'package:makeathon5_app/FirstPage/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../SharedPreferences.dart';

class HeaderFooter extends StatefulWidget {
  @override
  State<HeaderFooter> createState() => _HeaderFooterState();
}

class _HeaderFooterState extends State<HeaderFooter> {
  String? name;
  var TeamName;

  loadTeamName() async {
    String teamname = await getTeamName() ?? "";
    TeamName = teamname;
    setState(() {});
    return TeamName;
  }

  Future<void> userLogout(context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().disconnect();
    Navigator.push(context, MaterialPageRoute(builder: (ctx) {
      return FirstPage();
    }));
    // Navigator.pushAndRemoveUntil(context,
    //     MaterialPageRoute(builder: (context) => FirstPage()), (route) => false);
  }

  @override
  void initState() {
    super.initState();
    loadTeamName();
    Future.delayed(Duration(milliseconds: 1000), () {
      loadTeamName();
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 4.5;
    return Column(
      children: [
        Container(
          child: Stack(
            children: [
              Image.asset(
                "Assets/rectangle36.png",
                width: MediaQuery.of(context).size.width,
                height: height,
                fit: BoxFit.fill,
              ),
              Image.asset('Assets/ellipse7.png',
                  height: MediaQuery.of(context).size.height / 9,
                  fit: BoxFit.fill),
              Image.asset('Assets/ellipse6.png',
                  height: MediaQuery.of(context).size.height / 12,
                  fit: BoxFit.fill),
              Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 10,
                    right: MediaQuery.of(context).size.width / 16,
                    top: 1.9 * height / 6),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 2.2 * height / 12,
                      backgroundImage: NetworkImage(
                        FirebaseAuth.instance.currentUser == null
                            ? ""
                            : FirebaseAuth.instance.currentUser!.providerData[0]
                                .photoURL!,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello, ${FirebaseAuth.instance.currentUser == null ? "" : FirebaseAuth.instance.currentUser!.providerData[0].displayName!.split(" ")[0]}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          FirebaseAuth.instance.currentUser == null
                              ? ""
                              : FirebaseAuth
                                  .instance.currentUser!.providerData[0].email!,
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        FutureBuilder(
                            future: loadTeamName(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text(TeamName,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15));
                              } else
                                return CircularProgressIndicator();
                            }),
                      ],
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.topCenter,
                      child: GestureDetector(
                        child: Icon(Icons.logout_outlined),
                        onTap: () {
                          userLogout(context);
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Spacer(),
        Container(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  "Assets/rectangle35.png",
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: MediaQuery.of(context).size.height / 8.5,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 7,
                          child: FloatingActionButton.small(
                            heroTag: "Instagram Button 2",
                            backgroundColor: Colors.white,
                            onPressed: () {
                              launchUrl(
                                  Uri.parse('https://instagr.am/mlsc_tiet'),
                                  mode:
                                      LaunchMode.externalNonBrowserApplication);
                            },
                            child: Image.asset(
                              'Assets/instagramlogo.png',
                              height: 30,
                              width: 30,
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 7,
                          child: FloatingActionButton.small(
                            heroTag: "Twitter Button 2",
                            backgroundColor: Colors.white,
                            onPressed: () {
                              launchUrl(
                                  Uri.parse('https://twitter.com/mlsc_tiet'),
                                  mode:
                                      LaunchMode.externalNonBrowserApplication);
                            },
                            child: Image.asset(
                              'Assets/twitter-1.png',
                              height: 28,
                              width: 28,
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 7,
                          child: FloatingActionButton.small(
                            heroTag: "LinkedIn Button 2",
                            backgroundColor: Colors.white,
                            onPressed: () {
                              launchUrl(
                                  Uri.parse(
                                      'https://www.linkedin.com/company/microsoft-learn-student-chapter'),
                                  mode:
                                      LaunchMode.externalNonBrowserApplication);
                            },
                            child: Image.asset(
                              'Assets/linkedIn-1.png',
                              height: 30,
                              width: 30,
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 7,
                          child: FloatingActionButton.small(
                            heroTag: "Web Button 2",
                            backgroundColor: Colors.white,
                            onPressed: () {
                              launchUrl(
                                  Uri.parse('https://makeathon5.mlsctiet.com/'),
                                  mode: LaunchMode.externalApplication);
                            },
                            child: Image.asset(
                              'Assets/website-1.png',
                              height: 30,
                              width: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
