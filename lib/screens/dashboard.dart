import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iiitdmjcompanion/components/dashboard_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/instructor/instructor.dart';
import '../models/instructor/instructors_list.dart';
import 'faculty_search_screen.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff24252A),
        body: ListView(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FacultySearchScreen()));
              },
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: NewDashboardCard(
                  icon: FontAwesomeIcons.cookie,
                  text: 'FACULTY',
                  desc: 'VKG ko chull machi h exams ki',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
