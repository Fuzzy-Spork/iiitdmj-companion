import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iiitdmjcompanion/constants.dart';
import 'package:iiitdmjcompanion/services/size_config.dart';

import '../../constants.dart';
import '../../models/instructor/instructor.dart';
import 'faculty_detailed_card.dart';

class SearchFacultyCard extends StatefulWidget {
  SearchFacultyCard({
    @required this.instructor,
    @required this.icon,
  });
  final String icon;
  final Instructor instructor;

  @override
  _SearchFacultyCardState createState() => _SearchFacultyCardState();
}

class _SearchFacultyCardState extends State<SearchFacultyCard> {
  @override
  Widget build(BuildContext context) {
    var horizVal = displaySafeWidthBlocks(context);
    //var vertVal = displaySafeHeightBlocks(context);
    return GestureDetector(
      onTap: () {
        setState(() {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FacultyCard(
                instructor: widget.instructor,
              ),
            ),
          );
        });
      },
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 5),
              child: CircleAvatar(
                radius: horizVal * 7,
                backgroundImage: widget.instructor.image == null
                    ? AssetImage(widget.icon)
                    : CachedNetworkImageProvider(
                        widget.instructor.image,
                      ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      widget.instructor.name,
                      style: TextStyle(
                        fontSize: horizVal * 5,
                        color: kTextColor,
                        fontFamily: 'gilroy',
                        letterSpacing: 1,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      Instructor
                          .designationEnumMap[widget.instructor.designation],
                      style: TextStyle(
                        fontSize: horizVal * 4.5,
                        color: kTextColor,
                        fontFamily: 'gilroy',
                        fontWeight: FontWeight.w800,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
