import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iiitdmjcompanion/models/course/course.dart';
import 'package:iiitdmjcompanion/services/storage_service.dart';
import 'package:json_annotation/json_annotation.dart';

part 'class.g.dart';

//DONOT CHANGE
//WARNING: Do Not Touch
// **************************************************************************
// DO NOT TOUCH
// **************************************************************************

enum Day {
  @JsonValue('Monday')
  Monday,
  @JsonValue('Tuesday')
  Tuesday,
  @JsonValue('Wednesday')
  Wednesday,
  @JsonValue('Thursday')
  Thursday,
  @JsonValue('Friday')
  Friday,
  @JsonValue('Saturday')
  Saturday,
  @JsonValue('Sunday')
  Sunday,
}

enum Venue {
  @JsonValue('L102')
  L102,
  @JsonValue('L106')
  L106,
  @JsonValue('L201')
  L201,
  @JsonValue('L202')
  L202,
  @JsonValue('L206')
  L206,
  @JsonValue('L207')
  L207,
  @JsonValue('L107')
  L107,
  @JsonValue('CR101')
  CR101,
  @JsonValue('CR102')
  CR102,
  @JsonValue('CR103')
  CR103,
  @JsonValue('CR104')
  CR104,
  @JsonValue('CR106')
  CR106,
  @JsonValue('CR107')
  CR107,
  @JsonValue('CR108')
  CR108,
  @JsonValue('CR109')
  CR109,
  @JsonValue('CR201')
  CR201,
  @JsonValue('CR202')
  CR202,
  @JsonValue('CR203')
  CR203,
  @JsonValue('CR204')
  CR204,
  @JsonValue('CR205')
  CR205,
  @JsonValue('CR206')
  CR206,
  @JsonValue('CR207')
  CR207,
  @JsonValue('CR208')
  CR208,
  @JsonValue('CR209')
  CR209,
  @JsonValue('Upper CC')
  UpperCC,
  @JsonValue('Lower CC')
  LowerCC,
  @JsonValue('Electronics Lab')
  ElectronicsLab,
  @JsonValue('Workshop')
  Workshop,
  @JsonValue('Design Studio')
  DesignStudio,
}
enum Group {
  @JsonValue('A')
  A,
  @JsonValue('B')
  B,
}

@JsonSerializable()
class Class {
  String course;
  Group group;
  Day day;
  int timeStart;
  int timeEnd;
  Venue venue;

  Class({
    this.course,
    this.day,
    this.timeStart,
    this.timeEnd,
    this.venue,
    this.group,
  });

  factory Class.fromJson(Map<String, dynamic> json) => _$ClassFromJson(json);

  Map<String, dynamic> toJson() => _$ClassToJson(this);

  static Future<List<Class>> getUserClassesToday() async {
    //TODO: Uncomment this
    //DateTime today = DateTime.now();
    List<Class> userClasses = List<Class>();
    //TODO: Uncomment this
    //var day = dayIntMap[today.weekday];
    var day = Day.Monday;
    var classes = await Firestore.instance.collection('Classes').getDocuments();
    for (var classs in classes.documents) {
      var c = Class.fromJson(classs.data);
      var isUser = await isUsers(Class.fromJson(classs.data));
      if (isUser && c.day == day) {
        userClasses.add(Class.fromJson(classs.data));
      }
    }
    print(userClasses.first.course);
    userClasses.sort((a, b)=> a.timeStart.compareTo(b.timeStart));
    return userClasses;
  }

  sort(Class a, Class b){

  }

  static Future<bool> isUsers(Class k) async {
    var user = await StorageService.getInstance();
    var course = await Course.courseFromName(k.course);
    if (course.year == user.userInDB.year && k.group == user.userInDB.group) {
      print(course.year);
      return true;
    } else
      return false;
  }

  static const Map<int, Day> dayIntMap = {
    1: Day.Monday,
    2: Day.Tuesday,
    3: Day.Wednesday,
    4: Day.Thursday,
    5: Day.Friday,
    6: Day.Saturday,
    7: Day.Sunday,
  };
  static const dayEnumMap = {
    Day.Monday: 'Monday',
    Day.Tuesday: 'Tuesday',
    Day.Wednesday: 'Wednesday',
    Day.Thursday: 'Thursday',
    Day.Friday: 'Friday',
    Day.Saturday: 'Saturday',
    Day.Sunday: 'Sunday',
  };
}
