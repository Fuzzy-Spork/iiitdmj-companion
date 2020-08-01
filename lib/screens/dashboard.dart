import 'package:flutter/material.dart';
import 'package:iiitdmjcompanion/screens/faculty_search_screen.dart';
import 'package:iiitdmjcompanion/services/storage_service.dart';

import '../constants.dart';
import 'bus_schedule_screen.dart';
import 'login_screen.dart';
import 'mess_menu_screen.dart';
import 'setting_screen.dart';
import 'timetable_screen.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: StorageService.getInstance(),
      builder: (context, AsyncSnapshot<StorageService> snapshot) {
        if (snapshot.data == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return SafeArea(
            child: Scaffold(
                body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          var prefs = await StorageService.getInstance();
                          prefs.signOut();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UserSignUpScreen(),
                            ),
                          );
                        },
                        child: Icon(
                          Icons.account_circle,
                          color: kIconColor,
                          size: 32,
                        ),
                      ),
                      Spacer(),
                      Text(
                        'IIITDMJ ',
                        style: TextStyle(
                            color: kTextColor,
                            fontSize: size.height * 0.02,
                            fontWeight: FontWeight.w900),
                      ),
                      Text(
                        'Companion',
                        style: TextStyle(
                            color: kTextColor,
                            fontSize: size.height * 0.02,
                            fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.08,
                  ),
                  Row(
                    children: [
                      Text(
                        'Hello, ',
                        style: TextStyle(
                          color: kTextColor,
                          fontSize: size.height * 0.03,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      Text(
                        snapshot.data.userInDB.name,
                        style: TextStyle(
                          color: kTextColor,
                          fontSize: size.height * 0.03,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Visibility(
                    visible: false,
                    child: Text(
                      '2019148',
                      style: TextStyle(
                          color: kTextColor,
                          fontSize: size.height * 0.02,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Text(
                    'What are you looking for today ?',
                    style: TextStyle(
                      color: kTextColor,
                      fontSize: size.height * 0.02,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TimeTableScreen()));
                          });
                        },
                        child: Card(
                          elevation: 0,
                          child: Container(
                            height: size.width * 0.35,
                            width: size.width * 0.35,
                            decoration: BoxDecoration(
                                color: kBackgroundColor,
                                borderRadius: BorderRadius.circular(30.0)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Spacer(),
                                Icon(
                                  Icons.today,
                                  color: Colors.white,
                                  size: size.width * 0.12,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Timetable',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Spacer()
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        FacultySearchScreen()));
                          });
                        },
                        child: Card(
                          elevation: 0,
                          child: Container(
                            height: size.width * 0.35,
                            width: size.width * 0.35,
                            decoration: BoxDecoration(
                                color: kIconColor,
                                borderRadius: BorderRadius.circular(30.0)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Spacer(),
                                Icon(
                                  Icons.people,
                                  color: Colors.white,
                                  size: size.width * 0.12,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Faculty',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Spacer()
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BusScheduleScreen()));
                          });
                        },
                        child: Card(
                          elevation: 0,
                          child: Container(
                            height: size.width * 0.35,
                            width: size.width * 0.35,
                            decoration: BoxDecoration(
                                color: kIconColor,
                                borderRadius: BorderRadius.circular(30.0)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Spacer(),
                                Icon(
                                  Icons.airport_shuttle,
                                  color: Colors.white,
                                  size: size.width * 0.12,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Bus Schedule',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Spacer()
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MessMenuScreen()));
                          });
                        },
                        child: Card(
                          elevation: 0,
                          child: Container(
                            height: size.width * 0.35,
                            width: size.width * 0.35,
                            decoration: BoxDecoration(
                                color: kIconColor,
                                borderRadius: BorderRadius.circular(30.0)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Spacer(),
                                Icon(
                                  Icons.restaurant,
                                  color: Colors.white,
                                  size: size.width * 0.12,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Mess Menu',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Spacer()
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Spacer(),
                  Spacer(),
                  Spacer(),
                  Row(
                    children: [
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SettingsScreen()));
                          });
                        },
                        child: Icon(
                          Icons.settings,
                          color: kIconColor,
                          size: 22,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          //Provider.of<StorageService>(context, listen: false).deleteUser();
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SettingsScreen()));
                          });
                        },
                        child: Text(
                          'Settings',
                          style: TextStyle(
                              color: kTextColor,
                              fontSize: 17,
                              fontWeight: FontWeight.w200),
                        ),
                      ),
                      Spacer()
                    ],
                  ),
                  Spacer()
                ],
              ),
            )),
          );
        }
      },
    );
  }
}
