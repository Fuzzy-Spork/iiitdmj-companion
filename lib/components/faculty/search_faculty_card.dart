import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'faculty_detailed_card.dart';
import 'package:iiitdmjcompanion/services/size_config.dart';

class SearchFacultyCard extends StatefulWidget {
  SearchFacultyCard({
    @required this.text,
    @required this.icon,
    @required this.desc,
  });
  final String text;
  final String icon;
  final String desc;

  @override
  _SearchFacultyCardState createState() => _SearchFacultyCardState();
}

class _SearchFacultyCardState extends State<SearchFacultyCard> {
  @override
  Widget build(BuildContext context) {
    var horizVal = displaySafeWidthBlocks(context);
    var vertVal = displaySafeHeightBlocks(context);
    return GestureDetector(
      onTap: () {
        setState(() {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => FacultyCard()));
        });
      },
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Color(0xff24252A),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 5),
              child: CircleAvatar(
                radius: horizVal * 7,
                backgroundImage: AssetImage(widget.icon),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      widget.text,
                      style: TextStyle(
                          fontSize: horizVal * 4.3,
                          color: Colors.white,
                          fontFamily: 'code-bold'),
                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                    Text(
                      widget.desc,
                      style: TextStyle(
                          fontSize: horizVal * 4,
                          color: Colors.white,
                          fontFamily: 'code-light',
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
