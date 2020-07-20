import 'package:flutter/material.dart';

import '../constants.dart';

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
