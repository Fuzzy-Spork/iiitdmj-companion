import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iiitdmjcompanion/main.dart';
import 'package:iiitdmjcompanion/models/user/user.dart';
import 'package:iiitdmjcompanion/services/size_config.dart';
import 'package:iiitdmjcompanion/services/storage_service.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class UserSignUp extends StatefulWidget {
  UserSignUp({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _UserSignUpState createState() => _UserSignUpState();
}

class _UserSignUpState extends State<UserSignUp> {
  String name = '';
  String selectedBranch = 'CSE';
  String selectedYear = 'First';
  List<String> branches = ['CSE', 'ECE', 'ME', 'Design'];
  List<String> years = ['First', 'Second', 'Third', 'Fourth'];
  Group selectedGroup = Group.A;
  final _btnController = RoundedLoadingButtonController();

  DropdownButton<String> branchDropDown() {
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

  DropdownButton<String> yearDropDown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String year in years) {
      var newItem = DropdownMenuItem(
        child: Text(
          year,
          style: TextStyle(
            fontFamily: 'code-bold',
            color: Colors.white,
            fontSize: 20,
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
        unselectedWidgetColor: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Radio<Group>(
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
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            width: 10.0,
          ),
          Radio<Group>(
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
            style: TextStyle(color: Colors.white),
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
    return Scaffold(
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: SafeArea(
          child: Center(
            child: ListView(
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
                          Icon(
                            Icons.person,
                            color: Colors.white,
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
                                onChanged: (typed) {
                                  name = typed;
                                  print(name);
                                },
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
                        bottom: BorderSide(color: Colors.white60, width: 2),
                      ),
                    ),
                    child: IntrinsicHeight(
                      child: Row(
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.calendarTimes,
                            color: Colors.white,
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
                RoundedLoadingButton(
                  controller: _btnController,
                  color: Colors.black,
                  child: Text(
                    'Get Started',
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline1
                        .copyWith(fontSize: 20),
                  ),
                  onPressed: () async {
                    var storageService = await StorageService.getInstance();
                    _btnController.start();
                    if (name.isEmpty) {
                      //TODO: Create Prompt
                      print('Name is Null');
                      _btnController.reset();
                    } else {
                      try {
                        User user = User(
                            name: name,
                            branch: (BranchEnumMap.keys.where(
                                    (k) => BranchEnumMap[k] == selectedBranch))
                                .first,
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LandingPage()));
                        });
                      } catch (e) {
                        print('Error $e');
                        _btnController.reset();
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
