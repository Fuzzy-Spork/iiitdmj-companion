import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iiitdmjcompanion/components/dashboard_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FacultySearchScreen()));
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: NewDashboardCard(
                    icon: FontAwesomeIcons.cookie,
                    text: 'FACULTY',
                    desc: 'VKG ko chull machi h exams ki',
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
