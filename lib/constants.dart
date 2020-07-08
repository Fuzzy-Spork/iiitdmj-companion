import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//const kBackgroundColor = Color(0xFF24252A);

const kTextColor = Color(0xFF008CAB);

const kCardColor = Color(0xFFFFFFFF);

var kBackgroundColor = Color(0xFF008CAB);

var kIconColor = Color(0xFF008CAB);

const kFABColor = Colors.white;

const kFacultyCardTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 15.0,
    letterSpacing: 4,
    fontFamily: 'SourceSansPro');

const kSearchBarDecoration = InputDecoration(
  filled: false,
  hintText: "Search",
  hintStyle: TextStyle(color: kTextColor),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent),
  ),
);
