import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iiitdmjcompanion/components/timetable_card.dart';
import 'package:iiitdmjcompanion/constants.dart';
import 'package:iiitdmjcompanion/models/course/course.dart';
import 'package:iiitdmjcompanion/models/user/user.dart';
import 'package:iiitdmjcompanion/services/storage_service.dart';

import '../models/class/class.dart';

class TimeTableScreen extends StatefulWidget {
  @override
  _TimeTableScreenState createState() => _TimeTableScreenState();
}

class _TimeTableScreenState extends State<TimeTableScreen> {
  List items = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri'];
  int _index = 0;
  Map<String, Course> courses;
  User user;
  @override
  void initState() {
    super.initState();

    getCoursesAndUser().then((value) {
      setState(() {});
    });
    if (DateTime.now().weekday > 5) {
      _index = 0;
    } else {
      _index = DateTime.now().weekday - 1;
    }
  }

  Future getCoursesAndUser() async {
    courses = await Course.getAllCoursesMap();
    var prefs = await StorageService.getInstance();
    user = prefs.userInDB;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                  child: CircleAvatar(
                    radius: size.height * 0.04,
                    backgroundColor: Colors.transparent,
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: kIconColor,
                      size: 23,
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Text(
              'TIME TABLE',
              style: TextStyle(
                color: kBackgroundColor,
                fontSize: size.height * 0.047,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(
              height: size.height * 0.005,
            ),
            Text(
              'Class Schedules',
              style: TextStyle(
                color: kBackgroundColor,
                fontSize: size.height * 0.040,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Divider(
                color: kBackgroundColor,
                thickness: 1.2,
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 80, // card height
                child: timeTableSwipeableCards(),
              ),
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.only(
                  left: size.width * 0.05,
                  right: size.width * 0.05,
                  bottom: size.height * 0.02),
              height: size.height * 0.53,
              width: size.width - size.width * 0.15,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: StreamBuilder(
                stream: Firestore.instance.collection('Classes').snapshots(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData || user == null) {
                    return Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    List<List<Class>> finalClasses = [[], [], [], [], []];
                    finalClasses = Class.finalClassesList(
                        snapshot.data.documents, courses, user);
                    List<TimeTableCard> list = [];
                    for (int i = 0; i != finalClasses[_index].length; i++) {
                      if (i != (finalClasses[_index].length - 1)) {
                        list.add(
                          TimeTableCard(
                            visible: true,
                            size: size,
                            courseCode: finalClasses[_index][i].course,
                            time: finalClasses[_index][i].timeStart,
                            venue: Class
                                .venueEnumMap[finalClasses[_index][i].venue],
                          ),
                        );
                      } else {
                        list.add(
                          TimeTableCard(
                            visible: false,
                            size: size,
                            courseCode: finalClasses[_index][i].course,
                            time: finalClasses[_index][i].timeStart,
                            venue: Class
                                .venueEnumMap[finalClasses[_index][i].venue],
                          ),
                        );
                      }
                    }
                    return ListView(
                      children: list,
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  PageView timeTableSwipeableCards() {
    return PageView.builder(
      itemCount: 5,
      onPageChanged: (int index) {
        setState(() {
          return _index = index;
        });
      },
      itemBuilder: (_, i) {
        return Transform.scale(
          scale: i == _index ? 0.9 : 0.75,
          child: Card(
            color: kBackgroundColor,
            elevation: 6,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: Text(
                items[i],
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        );
      },
      controller: PageController(viewportFraction: 0.25),
    );
  }
}
