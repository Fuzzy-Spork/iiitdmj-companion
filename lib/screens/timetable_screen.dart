import 'package:flutter/material.dart';
import 'package:iiitdmjcompanion/constants.dart';
import 'package:iiitdmjcompanion/components/timetable.dart';

class TimeTableScreen extends StatefulWidget {
  @override
  _TimeTableScreenState createState() => _TimeTableScreenState();
}

class _TimeTableScreenState extends State<TimeTableScreen> {
  List items = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri'];
  int _index = 0;

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
              child: ListView.builder(
                itemCount: courseCode[_index].length,
                itemBuilder: (context, i) {
                  if (i != (courseCode[_index].length - 1)) {
                    return TimeTableCard(
                      visible: true,
                      size: size,
                      courseCode: courseCode[_index][i],
                      time: time[_index][i],
                      venue: venue[_index][i],
                    );
                  } else {
                    return TimeTableCard(
                      visible: false,
                      size: size,
                      courseCode: courseCode[_index][i],
                      time: time[_index][i],
                      venue: venue[_index][i],
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

class TimeTableCard extends StatelessWidget {
  const TimeTableCard({
    Key key,
    @required this.size,
    @required this.courseCode,
    @required this.time,
    @required this.venue,
    @required this.visible,
  }) : super(key: key);

  final Size size;
  final String courseCode;
  final String time;
  final String venue;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: size.height * 0.085,
            width: size.width - size.width * 0.15,
            decoration: BoxDecoration(
              color: kBackgroundColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    courseCode,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size.height * 0.024,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    time,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size.height * 0.024,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    venue,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size.height * 0.024,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: visible,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
              child: Container(
                width: 1.2,
                height: size.height * 0.03,
                color: Colors.white,
                child: VerticalDivider(
                  thickness: 1.2,
                  color: kBackgroundColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
