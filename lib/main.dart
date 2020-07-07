import 'package:flutter/material.dart';
import 'package:iiitdmjcompanion/screens/dashboard_sample.dart';
import 'package:iiitdmjcompanion/screens/login_screen.dart';
import 'package:iiitdmjcompanion/services/storage_service.dart';

//Use Future builder to access database to access app database
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'gilroy',
          textTheme: TextTheme()),
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: StorageService.getInstance(),
      builder: (context, AsyncSnapshot<StorageService> snapshot) {
        if (snapshot.hasError || !snapshot.hasData) {
          print('error');
          return Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.hasData) {
            try {
              if (snapshot.data.userInDB == null) {
                print('new user');
                return UserSignUpScreen(
                  title: 'User Sign Up',
                );
              } else {
                return DashBoard();
              }
            } catch (e) {
              print('Error: $e');
              return UserSignUpScreen(
                title: 'User Sign Up',
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }
      },
    );
  }
}
