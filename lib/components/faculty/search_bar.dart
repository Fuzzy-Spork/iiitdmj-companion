import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iiitdmjcompanion/services/size_config.dart';

import '../../models/instructor/instructor.dart';
import '../../models/instructor/instructor.dart';
import '../../models/instructor/instructor.dart';
import '../../models/instructor/instructor.dart';
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
    query.toLowerCase();
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
        backgroundColor: Color(0xff24252A),
        body: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value) {
                    filterSearchResults(value);
                  },
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  showCursor: false,
                  controller: editingController,
                  decoration: InputDecoration(
                    filled: false,
                    labelText: "Search",
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.white70),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(horizVal * 16)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1.0),
                      borderRadius:
                          BorderRadius.all(Radius.circular(horizVal * 16)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                      borderRadius:
                          BorderRadius.all(Radius.circular(horizVal * 16)),
                    ),
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
                          if (facultyMap.keys.length != 0) {
                            return ListTile(
                                title: facultyMap[Instructor.instructorFromName(
                                    items[index], allFaculty)]);
                          }
                          return Container();
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

//Text(
//'${items[index]}',
//style: TextStyle(color: Colors.white),
//),
