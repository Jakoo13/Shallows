import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';

import 'NotificationSettings.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 58, 123, 213),
            Color.fromARGB(255, 58, 96, 115),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            'Settings',
            textScaleFactor: 1,
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          children: [
            // Padding(
            //   padding: const EdgeInsets.only(
            //     top: 100.0,
            //     left: 30,
            //     right: 30,
            //     bottom: 0,
            //   ),
            //   child: Card(
            //     child: ListTile(
            //       tileColor: Colors.yellow,
            //       leading: Icon(Icons.add),
            //       title: Text(
            //         'Notifications',
            //         textScaleFactor: 1.5,
            //         textAlign: TextAlign.center,
            //       ),
            //       trailing: Icon(Icons.done),
            //       selected: false,
            //       onTap: () {
            //         Navigator.push(
            //           context,
            //           PageTransition(
            //             type: PageTransitionType.rightToLeftWithFade,
            //             alignment: Alignment.bottomCenter,
            //             child: NotificationSettings(),
            //           ),
            //         );
            //       },
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(
                top: 30.0,
                left: 30,
                right: 30,
                bottom: 0,
              ),
              child: Card(
                child: ListTile(
                  tileColor: Colors.yellow,
                  leading: Icon(Icons.add),
                  title: Text(
                    'Contact',
                    textScaleFactor: 1.5,
                    textAlign: TextAlign.center,
                  ),
                  trailing: Icon(Icons.done),
                  selected: false,
                  onTap: () {
                    _launchURL();
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 30.0,
                left: 30,
                right: 30,
                bottom: 0,
              ),
              child: Card(
                child: ListTile(
                  tileColor: Colors.yellow,

                  leading: Icon(Icons.add),
                  title: Text(
                    'Logout',
                    textScaleFactor: 1.5,
                    textAlign: TextAlign.center,
                  ),
                  trailing: Icon(Icons.done),
                  //subtitle: Text('This is subtitle'),
                  selected: false,
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (_) => CupertinoAlertDialog(
                              title: Text(
                                "Log Out?",
                                textScaleFactor: 1,
                                style: TextStyle(fontSize: 20),
                              ),
                              actions: [
                                CupertinoDialogAction(
                                  child: Text(
                                    "Yes",
                                    textScaleFactor: 1,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  onPressed: () async {
                                    await _auth.signOut();
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pop();
                                  },
                                ),
                                CupertinoDialogAction(
                                  child: Text(
                                    "No",
                                    textScaleFactor: 1,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            ));
                  },
                ),
              ),
            ),
          ],
        ),

        // bottomNavigationBar: new BottomNavigationBar(
        //   currentIndex: index,
        //   onTap: () {
        //     _getBody(index);
        //   },
        //   backgroundColor: Colors.lightBlue[700],
        //   unselectedItemColor: Colors.black45,
        //   selectedItemColor: Colors.black45,
        //   elevation: 0,
        //   items: [
        //     new BottomNavigationBarItem(
        //         icon: Icon(
        //           Icons.document_scanner,
        //         ),
        //         label: "Patent Pending",
        //         backgroundColor: Colors.black),
        //     new BottomNavigationBarItem(
        //         icon: Icon(Icons.contact_page), label: "Contact"),
        //   ],
        // ),
      ),
    );
  }

  void _launchURL() async {
    const String _url = "https://netscaledigital.com/contact-us";
    if (!await launch(_url)) throw 'Could not launch $_url';
  }
}
