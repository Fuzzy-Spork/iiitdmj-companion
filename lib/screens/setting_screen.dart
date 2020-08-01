import 'package:flutter/material.dart';
import 'package:iiitdmjcompanion/constants.dart';
import 'about_screen.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
                    radius: size.height * 0.045,
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
              'SETTINGS',
              style: TextStyle(
                color: kBackgroundColor,
                fontSize: size.height * 0.050,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Divider(
                color: kBackgroundColor,
                thickness: 1.2,
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AboutScreen()));
                });
              },
              child: Text(
                'About the App',
                style: TextStyle(
                  color: kBackgroundColor,
                  fontSize: size.height * 0.035,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Text(
              'Edit Profile',
              style: TextStyle(
                color: kBackgroundColor,
                fontSize: size.height * 0.035,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Text(
              'Contact Us',
              style: TextStyle(
                color: kBackgroundColor,
                fontSize: size.height * 0.035,
                fontWeight: FontWeight.w300,
              ),
            ),
            Spacer(),
            Container(
              height: size.height * 0.11,
              width: size.width,
              margin: EdgeInsets.all(size.height * 0.03),
              decoration: BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  'Log Out',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: size.height * 0.035,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
