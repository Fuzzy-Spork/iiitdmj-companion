import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iiitdmjcompanion/components/faculty/faculty_list.dart';
import 'package:iiitdmjcompanion/services/size_config.dart';

import '../../models/instructor/instructor.dart';
import '../../models/instructor/instructor.dart';
import '../../models/instructor/instructor.dart';
import 'faculty_detailed_card.dart';
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
  List<Instructor> faculty = [];
  @override
  void initState() {
    getFacultyData();
    duplicateItems.addAll(facultyList.keys);
    print(duplicateItems);
    items.addAll(duplicateItems);
    super.initState();
  }

  Future getFacultyData() async {
    //isLoading = true;
    CollectionReference db = Firestore.instance.collection('Faculty');
    QuerySnapshot snap = await db.getDocuments();

    for (var doc in snap.documents) {
      faculty.add(Instructor.instructorFromSnapshot(doc));
    }
    setState(() {
      isLoading = false;
    });
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = List<String>();
    dummySearchList.addAll(duplicateItems);
    if (query.isNotEmpty) {
      List<String> dummyListData = List<String>();
      dummySearchList.forEach((item) {
        print('Input Item: $item\n');
        if (item.toLowerCase().contains(query.toLowerCase())) {
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
                child: (isLoading == true||faculty.length == 0)
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: faculty.length,
                        itemBuilder: (context, index) {
                          if (faculty.length != 0) {
                            return ListTile(
                              title: SearchFacultyCard(
                                icon: 'assets/download.png',
                                desc: Instructor.designationEnumMap[
                                    faculty[index].designation],
                                text: faculty[index].name,
                              ),
                            );
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
