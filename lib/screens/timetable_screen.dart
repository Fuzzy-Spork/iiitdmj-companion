import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iiitdmjcompanion/components/timetable_card.dart';
import 'package:iiitdmjcompanion/constants.dart';

import '../models/class/class.dart';

class TimeTableScreen extends StatefulWidget {
  @override
  _TimeTableScreenState createState() => _TimeTableScreenState();
}

class _TimeTableScreenState extends State<TimeTableScreen> {
  List items = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri'];
  int _index = 0;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    if (DateTime.now().weekday > 5) {
      _index = 0;
    } else {
      _index = DateTime.now().weekday - 1;
    }
    getTimeTable().then((value) {
      setState(() {
        isLoading = false;
      });
    });
  }

  List<List<Class>> classes;
  Future getTimeTable() async {
    QuerySnapshot db =
        await Firestore.instance.collection('Classes').getDocuments();
    classes = await Class.classesFromQuerySnapshot(db);
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
              child: isLoading == true
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: classes[_index].length,
                      itemBuilder: (context, i) {
                        if (i != (classes[_index].length - 1)) {
                          return TimeTableCard(
                            visible: true,
                            size: size,
                            courseCode: classes[_index][i].course,
                            time: classes[_index][i].timeStart,
                            venue: Class.venueEnumMap[classes[_index][i].venue],
                          );
                        } else {
                          return TimeTableCard(
                            visible: false,
                            size: size,
                            courseCode: classes[_index][i].course,
                            time: classes[_index][i].timeStart,
                            venue: Class.venueEnumMap[classes[_index][i].venue],
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
