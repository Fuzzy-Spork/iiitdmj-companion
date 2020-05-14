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
        print(snapshot);
        print('\n\n\n\n\n\n\n\n\n\n');
        if (snapshot.hasError) {
          print('error');
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData) {
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
        }
        return Center(child: CircularProgressIndicator());
      },
    ) ??
        CircularProgressIndicator();
  }
}
