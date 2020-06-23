import 'package:flutter/material.dart';
import 'package:iiitdmjcompanion/components/faculty/faculty_list.dart';
import 'package:iiitdmjcompanion/services/size_config.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => new _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController editingController = TextEditingController();

  var duplicateItems = List<String>();
  var items = List<String>();

  @override
  void initState() {
    duplicateItems.addAll(facultyList.keys);
    print(duplicateItems);
    items.addAll(duplicateItems);
    super.initState();
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = List<String>();
    dummySearchList.addAll(duplicateItems);
    if (query.isNotEmpty) {
      List<String> dummyListData = List<String>();
      dummySearchList.forEach((item) {
        print('Input Item: $item\n');
        if (item.toLowerCase().contains(query.toLowerCase())) {
          print('Query: $query\n');
          print('item: $item\n');
          print(item.contains('g'));
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
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return ListTile(title: facultyList[items[index]]);
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
