import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iiitdmjcompanion/constants.dart';
import 'package:iiitdmjcompanion/main.dart';
import 'package:iiitdmjcompanion/models/class/class.dart';
import 'package:iiitdmjcompanion/models/user/user.dart';
import 'package:iiitdmjcompanion/services/size_config.dart';
import 'package:iiitdmjcompanion/services/storage_service.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../constants.dart';

class UserSignUpScreen extends StatefulWidget {
  UserSignUpScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _UserSignUpScreenState createState() => _UserSignUpScreenState();
}

class _UserSignUpScreenState extends State<UserSignUpScreen> {
  String name = '';
  String selectedBranch = 'Branch';
  String selectedYear = 'Year';
  List<String> branches = ['Branch', 'CSE', 'ECE', 'ME', 'Design'];
  List<String> years = ['Year', 'First', 'Second', 'Third', 'Fourth'];
  Group selectedGroup = Group.A;
  final _btnController = RoundedLoadingButtonController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  DropdownButton<String> branchDropDown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String branch in branches) {
      var newItem = DropdownMenuItem(
        child: Text(
          branch,
          style: TextStyle(
            fontFamily: 'gilroy',
            color: kTextColor,
            fontSize: 20,
            fontWeight: branch == 'Branch' ? FontWeight.w300 : FontWeight.w700,
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

  DropdownButton<String> yearDropDown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String year in years) {
      var newItem = DropdownMenuItem(
        child: Text(
          year,
          style: TextStyle(
            fontFamily: 'gilroy',
            color: kTextColor,
            fontSize: 20,
            fontWeight: year == 'Year' ? FontWeight.w300 : FontWeight.w700,
          ),
        ),
        value: year,
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      value: selectedYear,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedYear = value;
        });
      },
    );
  }

  Theme groupRadio() {
    return Theme(
      data: ThemeData(
        unselectedWidgetColor: kBackgroundColor,
        primaryColor: kBackgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Radio<Group>(
            focusColor: kBackgroundColor,
            activeColor: kBackgroundColor,
            value: Group.A,
            groupValue: selectedGroup,
            onChanged: (Group value) {
              setState(() {
                selectedGroup = value;
              });
            },
          ),
          Text(
            'Group A',
            style: TextStyle(color: kTextColor),
          ),
          SizedBox(
            width: 10.0,
          ),
          Radio<Group>(
            focusColor: kBackgroundColor,
            activeColor: kBackgroundColor,
            value: Group.B,
            groupValue: selectedGroup,
            onChanged: (Group value) {
              setState(() {
                selectedGroup = value;
              });
            },
          ),
          Text(
            'Group B',
            style: TextStyle(color: kTextColor),
          ),
          SizedBox(
            width: 1.0,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var horizVal = displaySafeWidthBlocks(context);
    var vertVal = displaySafeHeightBlocks(context);
    Size size = MediaQuery.of(context).size;
    final noNamesnackbar = SnackBar(
      content: Text('Please Enter A Valid Name'),
    );
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        child: SafeArea(
          child: Center(
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: vertVal * 20,
                ),
                Text(
                  'IIITDMJ\nCOMPANION',
                  style: TextStyle(
                    fontSize: size.height * 0.05,
                    color: kTextColor,
                    fontFamily: 'gilroy',
                    fontWeight: FontWeight.w900,
                  ),
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
                        bottom: BorderSide(color: kBackgroundColor, width: 2),
                      ),
                    ),
                    child: IntrinsicHeight(
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.person,
                            color: kIconColor,
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
                                thickness: 2,
                                color: kBackgroundColor,
                              ),
                            ),
                          ),
                          Container(
                              width: horizVal * 75,
                              child: TextField(
                                style: TextStyle(
                                  fontSize: 24,
                                  fontFamily: 'gilroy',
                                  color: kTextColor,
                                ),
                                onChanged: (typed) {
                                  setState(() {
                                    name = typed;
                                    print(name);
                                  });
                                },
                                decoration: InputDecoration(
                                  labelText: name == '' ? 'Name' : '',
                                  labelStyle: TextStyle(
                                    color: kTextColor,
                                    fontSize: 15,
                                    fontFamily: 'gilroy',
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
                        bottom: BorderSide(color: kBackgroundColor, width: 2),
                      ),
                    ),
                    child: IntrinsicHeight(
                      child: Row(
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.codeBranch,
                            color: kIconColor,
                            size: 25,
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
                                thickness: 2,
                                color: kBackgroundColor,
                              ),
                            ),
                          ),
                          Theme(
                            data: Theme.of(context).copyWith(
                              canvasColor: Colors.white,
                            ),
                            child: Container(
                              width: horizVal * 75,
                              child: Container(
                                height: 150.0,
                                child: DropdownButtonHideUnderline(
                                    child: branchDropDown()),
                              ),
                            ),
                          )
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
                        bottom: BorderSide(color: kBackgroundColor, width: 2),
                      ),
                    ),
                    child: IntrinsicHeight(
                      child: Row(
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.calendarTimes,
                            color: kIconColor,
                            size: 25,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                              right: 15,
                            ),
                            child: Container(
                              width: 2,
                              color: Colors.white,
                              child: VerticalDivider(
                                thickness: 2,
                                color: kBackgroundColor,
                              ),
                            ),
                          ),
                          Theme(
                            data: Theme.of(context).copyWith(
                              canvasColor: Colors.white,
                            ),
                            child: Container(
                              width: horizVal * 75,
                              child: Container(
                                height: 150.0,
                                child: DropdownButtonHideUnderline(
                                    child: yearDropDown()),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Center(
                  child: groupRadio(),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                RoundedLoadingButton(
                  controller: _btnController,
                  color: kBackgroundColor,
                  child: Text('Get Started',
                      style: TextStyle(
                        fontSize: size.height * 0.025,
                        fontFamily: 'gilroy',
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      )),
                  onPressed: () async {
                    var storageService = await StorageService.getInstance();
                    _btnController.start();
                    if (name.isEmpty) {
                      print('Name is Null');
                      _scaffoldKey.currentState.showSnackBar(noNamesnackbar);
                      _btnController.error();
                      Future.delayed(Duration(seconds: 2), () {
                        _btnController.reset();
                      });
                    } else {
                      if (selectedBranch == 'Branch') {
                        _scaffoldKey.currentState.showSnackBar(SnackBar(
                          content: Text('Select a Branch to Proceed'),
                        ));
                        _btnController.error();
                        Future.delayed(Duration(seconds: 2), () {
                          _btnController.reset();
                        });
                      } else {
                        if (selectedYear == 'Year') {
                          _scaffoldKey.currentState.showSnackBar(SnackBar(
                            content: Text('Select an year to Continue'),
                          ));
                          _btnController.error();
                          Future.delayed(Duration(seconds: 2), () {
                            _btnController.reset();
                          });
                        } else {
                          try {
                            User user = User(
                                name: name,
                                branch: (BranchEnumMap.keys.where((k) =>
                                    BranchEnumMap[k] == selectedBranch)).first,
                                year: (YearEnumMap.keys.where(
                                        (k) => YearEnumMap[k] == selectedYear))
                                    .first,
                                group: selectedGroup);
                            print(user.toJson());
                            storageService.saveUserInDB(user);
                            _btnController.success();
                            Future.delayed(Duration(seconds: 1), () {
                              Navigator.of(context)
                                  .popUntil((route) => route.isFirst);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LandingPage()));
                            });
                            Future.delayed(Duration(seconds: 1), () {
                              _btnController.reset();
                            });
                          } catch (e) {
                            print('Error $e');
                            _btnController.reset();
                          }
                        }
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
