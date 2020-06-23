import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iiitdmjcompanion/services/size_config.dart';

import '../../models/instructor/instructor.dart';

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
        backgroundColor: Color(
          0xff24252A,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.arrow_back,
            color: Color(
              0xff24252A,
            ),
          ),
          onPressed: () {
            setState(
              () {
                Navigator.pop(context);
              },
            );
          },
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                widget.instructor.code,
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
                widget.instructor.name,
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
                Instructor.designationEnumMap[widget.instructor.designation],
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
                Instructor.departmentEnumMap[widget.instructor.dept[0]],
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
              widget.instructor.phone == null
                  ? Container()
                  : Card(
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
                          widget.instructor.phone == null
                              ? ''
                              : widget.instructor.phone,
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
                    widget.instructor.email,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      letterSpacing: 4,
                    ),
                  ),
                ),
              ),
              widget.instructor.tags == null
                  ? Container()
                  : Card(
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
                          Instructor.tagEnumMap[widget.instructor.tags.first],
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
                    widget.instructor.tilda,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      letterSpacing: 4,
                    ),
                  ),
                ),
              ),
              widget.instructor.building == null
                  ? Container()
                  : Card(
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
                          Instructor
                              .buildingEnumMap[widget.instructor.building],
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
    );
  }
}
