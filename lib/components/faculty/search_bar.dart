import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iiitdmjcompanion/services/size_config.dart';

import '../../constants.dart';
import '../../models/instructor/instructor.dart';
import 'search_faculty_card.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => new _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController editingController = TextEditingController();
  bool isLoading;
  var duplicateItems = List<String>();
  var items = List<String>();
  List<Instructor> allFaculty = [];
  var facultyMap = {};

  bool searchBarVisible = false;
  bool navigationButtonVisible = true;

  @override
  void initState() {
    getFacultyData().then((value) {
      for (var ins in allFaculty) {
        duplicateItems.add(ins.name);
      }
      items.addAll(duplicateItems);
    });
    super.initState();
  }

  Future getFacultyData() async {
    //isLoading = true;
    CollectionReference db = Firestore.instance.collection('Faculty');
    QuerySnapshot snap = await db.getDocuments();

    for (var doc in snap.documents) {
      allFaculty.add(Instructor.instructorFromSnapshot(doc));
    }
    setState(() {
      isLoading = false;
    });
    facultyMap = {
      for (var instructor in allFaculty)
        instructor: SearchFacultyCard(
          instructor: instructor,
          icon: 'assets/download.png',
        )
    };
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = List<String>();
    dummySearchList.addAll(duplicateItems);
    query = query.toLowerCase();
    if (query.isNotEmpty) {
      List<String> dummyListData = List<String>();
      dummySearchList.forEach((item) {
        Instructor ins = Instructor.instructorFromName(item, allFaculty);
        if (item.toLowerCase().contains(query)) {
          dummyListData.add(item);
        }
        if (Instructor.designationEnumMap[ins.designation]
            .toLowerCase()
            .contains(query)) {
          dummyListData.add(item);
        }
        if (ins.tags != null) {
          for (Tag tag in ins.tags) {
            if ((Instructor.tagEnumMap[tag]).toLowerCase().contains(query)) {
              dummyListData.add(item);
            }
          }
        }
        if (ins.code.toLowerCase().contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(duplicateItems);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var horizVal = displaySafeWidthBlocks(context);
    var vertVal = displaySafeHeightBlocks(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: <Widget>[
              Visibility(
                visible: navigationButtonVisible,
                child: Padding(
                  padding: const EdgeInsets.only(left: 0, right: 0, top: 5),
                  child: Container(
                    height: vertVal * 10,
                    width: (horizVal * 100),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Navigator.pop(context);
                            });
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: kIconColor,
                              size: 20,
                            ),
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              searchBarVisible = true;
                              navigationButtonVisible = false;
                            });
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: Icon(
                              Icons.search,
                              color: kIconColor,
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: searchBarVisible,
                child: Padding(
                  padding: const EdgeInsets.only(left: 2, right: 15, top: 5),
                  child: Container(
                    height: vertVal * 10,
                    width: (horizVal * 100) - 17,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              searchBarVisible = false;
                              navigationButtonVisible = true;
                            });
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: Icon(
                              Icons.clear,
                              color: kIconColor,
                              size: 27,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Expanded(
                          child: Container(
                            height: 55,
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  color: kBackgroundColor,
                                  width: 1,
                                ),
                                left: BorderSide(
                                  color: kBackgroundColor,
                                  width: 1,
                                ),
                                top: BorderSide(
                                  color: kBackgroundColor,
                                  width: 1,
                                ),
                                bottom: BorderSide(
                                  color: kBackgroundColor,
                                  width: 1,
                                ),
                              ),
                              borderRadius: BorderRadius.circular(35),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 5,
                                top: 4,
                                right: 5,
                              ),
                              child: TextField(
                                autofocus: searchBarVisible,
                                onChanged: (value) {
                                  filterSearchResults(value);
                                },
                                style: TextStyle(
                                  color: kTextColor,
                                ),
                                showCursor: false,
                                controller: editingController,
                                decoration: kSearchBarDecoration,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: !searchBarVisible,
                child: Text(
                  'FACULTY',
                  style: TextStyle(
                      fontFamily: 'gilroy',
                      fontWeight: FontWeight.w900,
                      color: kIconColor,
                      fontSize: vertVal * 5),
                ),
              ),
              Visibility(
                visible: !searchBarVisible,
                child: Text(
                  'People',
                  style: TextStyle(
                    fontFamily: 'gilroy',
                    color: kIconColor,
                    fontSize: vertVal * 3.5,
                  ),
                ),
              ),
              Visibility(
                visible: !searchBarVisible,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: horizVal * 10,
                    right: horizVal * 10,
                    top: vertVal,
                    bottom: vertVal,
                  ),
                  child: Divider(
                    thickness: 1,
                    color: kIconColor,
                  ),
                ),
              ),
              Expanded(
                child: (isLoading == true || allFaculty.length == 0)
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                              title: facultyMap[Instructor.instructorFromName(
                                  items[index], allFaculty)]);
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
