import 'package:flutter/material.dart';
import 'package:iiitdmjcompanion/models/user/user.dart';
import 'package:iiitdmjcompanion/services/storage_service.dart';

//Use Future builder to access database to access app database
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: StorageService.getInstance(),
        builder: (context, AsyncSnapshot<StorageService> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              print(snapshot.connectionState);
              return Center(
                child: CircularProgressIndicator(),
              );
            default:
              if (!snapshot.hasError) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //Text(snapshot.data.userInDB.name),
                      OutlineButton(
                        child: Text('Add User'),
                        onPressed: () {
                          User user = User(
                              year: Year.second,
                              name: 'Sehej',
                              branch: Branch.CSE,
                              group: Group.A);
                          snapshot.data.saveUserInDB(user);
                          print(user.year);
                        },
                      ),

                      Text(snapshot.data.userInDB.name),
                      Text(
                        'You have pushed the button this many times:',
                        style: TextStyle(fontFamily: 'code-bold'),
                      ),
                      Text(
                        '$_counter',
                      ),
                    ],
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
          }
        },
//        child: Center(
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              Text(
//                'You have pushed the button this many times:',
//                style: TextStyle(fontFamily: 'code-bold'),
//              ),
//              Text(
//                '$_counter',
//              ),
//            ],
//          ),
//        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
