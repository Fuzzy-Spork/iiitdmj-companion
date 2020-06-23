import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../components/faculty/search_bar.dart';
import '../models/instructor/instructor.dart';

class FacultySearchScreen extends StatefulWidget {
  FacultySearchScreen({Key key}) : super(key: key);

  @override
  _FacultySearchScreenState createState() => _FacultySearchScreenState();
}

class _FacultySearchScreenState extends State<FacultySearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Navigator.pop(context);
          });
        },
        backgroundColor: Colors.white70,
        child: Icon(
          Icons.arrow_back,
          color: Color(0xff24252A),
        ),
      ),
      body: SearchBar(),
    );
  }
}
