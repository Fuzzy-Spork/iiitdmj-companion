import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iiitdmjcompanion/services/size_config.dart';

class UserSignUp extends StatefulWidget {
  UserSignUp({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _UserSignUpState createState() => _UserSignUpState();
}

class _UserSignUpState extends State<UserSignUp> {
  String selectedBranch = 'CSE';
  List<String> branches = ['CSE', 'ECE', 'ME', 'Design'];

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String branch in branches) {
      var newItem = DropdownMenuItem(
        child: Text(
          branch,
          style: TextStyle(
            fontFamily: 'code-bold',
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        value: branch,
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      value: selectedBranch,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedBranch = value;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var horizVal = displaySafeWidthBlocks(context);
    var vertVal = displaySafeHeightBlocks(context);
    return Scaffold(
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: SafeArea(
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: vertVal * 20,
                ),
                Text(
                  'IIITDMJ\nOfficial App',
                  style: Theme.of(context).textTheme.headline1,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: vertVal * 6,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: vertVal * 7,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.white60, width: 2),
                      ),
                    ),
                    child: IntrinsicHeight(
                      child: Row(
                        children: <Widget>[
                          Text(
                            '@',
                            style: TextStyle(
                              fontFamily: 'code-light',
                              color: Colors.white,
                              fontSize: 35,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                              right: 15,
                            ),
                            child: Container(
                              width: 1,
                              color: Colors.white,
                              child: VerticalDivider(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                              width: horizVal * 75,
                              child: TextField(
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                                decoration: InputDecoration(
                                  labelText: 'name',
                                  labelStyle: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 15,
                                    fontFamily: 'code-bold',
                                  ),
                                  border: InputBorder.none,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: vertVal * 7,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.white60, width: 2),
                      ),
                    ),
                    child: IntrinsicHeight(
                      child: Row(
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.codeBranch,
                            color: Colors.white,
                            size: 33,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                              right: 15,
                            ),
                            child: Container(
                              width: 1,
                              color: Colors.white,
                              child: VerticalDivider(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Theme(
                            data: Theme.of(context).copyWith(
                              canvasColor: Color(0xff24252A),
                            ),
                            child: Container(
                              width: horizVal * 75,
                              child: Container(
                                height: 150.0,
                                child: androidDropdown(),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LandingTextField extends StatefulWidget {
  final String fieldName;
  final Widget icon;

  LandingTextField({this.fieldName, this.icon});

  @override
  _LandingTextFieldState createState() => _LandingTextFieldState();
}

class _LandingTextFieldState extends State<LandingTextField> {
  @override
  Widget build(BuildContext context) {
    var horizVal = displaySafeWidthBlocks(context);
    var vertVal = displaySafeHeightBlocks(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: vertVal * 7,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.white60, width: 2),
          ),
        ),
        child: IntrinsicHeight(
          child: Row(
            children: <Widget>[
              widget.icon,
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 15,
                ),
                child: Container(
                  width: 1,
                  color: Colors.white,
                  child: VerticalDivider(
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                  width: horizVal * 75,
                  child: TextField(
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      labelText: widget.fieldName,
                      labelStyle: TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                        fontFamily: 'code-bold',
                      ),
                      border: InputBorder.none,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
//ListTile(
//leading: Padding(
//padding: const EdgeInsets.all(0),
//child: Container(
//decoration: BoxDecoration(
//border: Border(right: BorderSide(color: Colors.white60)),
//),
//child: Text(
//'@',
//style: TextStyle(
//fontFamily: 'code-light',
//color: Colors.white,
//fontSize: 30,
//),
//),
//),
//),
//title: TextField(
//style: TextStyle(
//fontSize: 24,
//color: Colors.white,
//),
//decoration: InputDecoration(
//labelText: 'Name',
//labelStyle: TextStyle(
//color: Colors.white70,
//fontSize: 20,
//fontFamily: 'code-bold',
//),
//border: InputBorder.none,
//),
//));
