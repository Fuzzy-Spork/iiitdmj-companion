import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iiitdmjcompanion/services/size_config.dart';
import '../../constants.dart';
import '../../models/instructor/instructor.dart';
import 'package:iiitdmjcompanion/constants.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class FacultyCard extends StatefulWidget {
  final Instructor instructor;
  FacultyCard({this.instructor});
  @override
  _FacultyCardState createState() => _FacultyCardState();
}

class _FacultyCardState extends State<FacultyCard> {
  @override
  Widget build(BuildContext context) {
    var vertVal = displaySafeHeightBlocks(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                      });
                    },
                    child: CircleAvatar(
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
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 5,
                  ),
                  CircleAvatar(
                    radius: vertVal * 8,
                    backgroundImage: AssetImage('assets/download.png'),
                  ),
//                  CircleAvatar(
//                    radius: vertVal * 8,
//                    backgroundImage: AssetImage('assets/download.png'),
//                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.instructor.code,
                    style: TextStyle(
                        color: kTextColor,
                        fontSize: 15.0,
                        letterSpacing: 4,
                        fontFamily: 'code-bold'),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    widget.instructor.name,
                    style: TextStyle(
                        color: kTextColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'code-light',
                        letterSpacing: 2),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    Instructor
                        .designationEnumMap[widget.instructor.designation],
                    style: TextStyle(
                        color: kTextColor,
                        fontSize: 15.0,
                        letterSpacing: 4,
                        fontFamily: 'code-light',
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    Instructor.departmentEnumMap[widget.instructor.dept[0]],
                    style: TextStyle(
                      color: kTextColor,
                      fontSize: 15.0,
                      letterSpacing: 4,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                    width: 150.0,
                    child: Divider(
                      color: Colors.teal.shade500,
                    ),
                  ),
                  widget.instructor.phone == null
                      ? Container()
                      : Card(
                          color: Color(0xFFFFFFFF),
                          borderOnForeground: false,
                          shadowColor: Colors.transparent,
                          margin: EdgeInsets.symmetric(horizontal: 25.0),
                          child: ListTile(
                            leading: Icon(
                              Icons.phone,
                              color: kIconColor,
                            ),
                            title: Text(
                              widget.instructor.phone == null
                                  ? ''
                                  : widget.instructor.phone,
                              style: TextStyle(
                                color: kTextColor,
                                fontSize: 15.0,
                                letterSpacing: 3,
                              ),
                            ),
                          ),
                        ),
                  Card(
                    color: Color(0xffFFFFFF),
                    borderOnForeground: false,
                    shadowColor: Colors.transparent,
                    margin: EdgeInsets.symmetric(horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.alternate_email,
                        color: kIconColor,
                      ),
                      title: Text(
                        widget.instructor.email,
                        style: TextStyle(
                          color: kTextColor,
                          fontSize: 15.0,
                          letterSpacing: 3,
                        ),
                      ),
                    ),
                  ),
                  widget.instructor.tags == null
                      ? Container()
                      : Card(
                          color: Color(0xffFFFFFF),
                          borderOnForeground: false,
                          shadowColor: Colors.transparent,
                          margin: EdgeInsets.symmetric(horizontal: 25.0),
                          child: ListTile(
                            leading: Icon(
                              Icons.supervisor_account,
                              color: kIconColor,
                            ),
                            title: Text(
                              Instructor
                                  .tagEnumMap[widget.instructor.tags.first],
                              style: TextStyle(
                                color: kTextColor,
                                fontSize: 15.0,
                                letterSpacing: 3,
                              ),
                            ),
                          ),
                        ),
                  Card(
                    color: Color(0xffFFFFFF),
                    borderOnForeground: false,
                    shadowColor: Colors.transparent,
                    margin: EdgeInsets.symmetric(horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.details,
                        color: kIconColor,
                      ),
                      title: Text(
                        widget.instructor.tilda,
                        style: TextStyle(
                          color: kTextColor,
                          fontSize: 15.0,
                          letterSpacing: 3,
                        ),
                      ),
                    ),
                  ),
                  widget.instructor.building == null
                      ? Container()
                      : Card(
                          color: Color(0xffFFFFFF),
                          borderOnForeground: false,
                          shadowColor: Colors.transparent,
                          margin: EdgeInsets.symmetric(horizontal: 25.0),
                          child: ListTile(
                            leading: Icon(
                              Icons.location_on,
                              color: kIconColor,
                            ),
                            title: Text(
                              Instructor
                                  .buildingEnumMap[widget.instructor.building],
                              style: TextStyle(
                                color: kTextColor,
                                fontSize: 15.0,
                                letterSpacing: 4,
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ),
            Container(
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Center(
                child: Row(
                  children: [
                    Spacer(),
                    Icon(
                      LineAwesomeIcons.envelope_1,
                      color: Colors.white,
                      size: 25,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Send an Email',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Spacer(),
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
