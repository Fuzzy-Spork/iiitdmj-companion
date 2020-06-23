import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iiitdmjcompanion/services/size_config.dart';

import '../../models/instructor/instructor.dart';
import '../../models/instructor/instructor.dart';

class FacultyCard extends StatefulWidget {
  Instructor instructor;
  FacultyCard({instructor});
  @override
  _FacultyCardState createState() => _FacultyCardState();
}

class _FacultyCardState extends State<FacultyCard> {
  @override
  Widget build(BuildContext context) {
    var vertVal = displaySafeHeightBlocks(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff24252A),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.arrow_back,
            color: Color(0xff24252A),
          ),
          onPressed: () {
            setState(() {
              Navigator.pop(context);
            });
          },
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: vertVal * 8,
                  backgroundImage: AssetImage('assets/download.png'),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'VKG',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      letterSpacing: 4,
                      fontFamily: 'code-bold'),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Vijay Kumar Gupta',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'code-light',
                      letterSpacing: 2),
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  'ASSISTANT PROFESSOR',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      letterSpacing: 4,
                      fontFamily: 'code-light',
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  'ME',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    letterSpacing: 4,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                  width: 150.0,
                  child: Divider(
                    color: Colors.teal.shade100,
                  ),
                ),
                Card(
                  color: Color(0xff24252A),
                  borderOnForeground: false,
                  shadowColor: Colors.transparent,
                  margin: EdgeInsets.symmetric(horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.white,
                    ),
                    title: Text(
                      '+91 - 7272028125',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        letterSpacing: 4,
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Color(0xff24252A),
                  borderOnForeground: false,
                  shadowColor: Colors.transparent,
                  margin: EdgeInsets.symmetric(horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.alternate_email,
                      color: Colors.white,
                    ),
                    title: Text(
                      'vkg@examkichull.com',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        letterSpacing: 4,
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Color(0xff24252A),
                  borderOnForeground: false,
                  shadowColor: Colors.transparent,
                  margin: EdgeInsets.symmetric(horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.supervisor_account,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Dean Students',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        letterSpacing: 4,
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Color(0xff24252A),
                  borderOnForeground: false,
                  shadowColor: Colors.transparent,
                  margin: EdgeInsets.symmetric(horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.details,
                      color: Colors.white,
                    ),
                    title: Text(
                      'tilda rhega idhar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        letterSpacing: 4,
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Color(0xff24252A),
                  borderOnForeground: false,
                  shadowColor: Colors.transparent,
                  margin: EdgeInsets.symmetric(horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.location_on,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Computer Center',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        letterSpacing: 4,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
