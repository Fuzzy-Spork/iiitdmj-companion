import 'package:flutter/material.dart';
import '../components/faculty/search_bar.dart';
import 'package:iiitdmjcompanion/constants.dart';

class FacultySearchScreen extends StatefulWidget {
  FacultySearchScreen({Key key}) : super(key: key);

  @override
  _FacultySearchScreenState createState() => _FacultySearchScreenState();
}

class _FacultySearchScreenState extends State<FacultySearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SearchBar(),
    );
  }
}
