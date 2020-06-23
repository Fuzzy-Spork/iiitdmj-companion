import 'package:flutter/material.dart';
import 'package:iiitdmjcompanion/screens/login_screen.dart';
import 'package:iiitdmjcompanion/services/storage_service.dart';
import 'screens/dashboard.dart';

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
        primaryColor: Color(0xff24252A),
        backgroundColor: Color(0xff24252A),
        fontFamily: 'code-bold',
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          headline6: TextStyle(fontSize: 24.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
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
                //TODO: Implement User Logged In Home
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
