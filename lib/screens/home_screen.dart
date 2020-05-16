import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iiitdmjcompanion/main.dart';
import 'package:iiitdmjcompanion/services/storage_service.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var _controller = RoundedLoadingButtonController();
    return FutureBuilder(
      initialData: StorageService(),
      future: StorageService.getInstance(),
      builder: (context, AsyncSnapshot<StorageService> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting ||
            snapshot.hasError ||
            !snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        try {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(snapshot.data.userInDB.name),
                  FlatButton(
                    color: Colors.blue,
                    child: Text(
                      'Sign Out',
                    ),
                    onPressed: () {
                      setState(
                            () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                                return LandingPage();
                              }));
                          snapshot.data.deleteKey(StorageService.UserKey);
                        },
                      );
                    },
                  ),
                  RoundedLoadingButton(
                    color: Colors.blue,
                    child: Text(
                      'Upload Courses',
                    ),
                    controller: _controller,
                    onPressed: () async {
                      setState(
                            () {
                          _controller.start();
                          Future.delayed(Duration(seconds: 1), () {
                            _controller.success();
                          });
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        } catch (e) {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
