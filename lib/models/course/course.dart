import 'package:json_annotation/json_annotation.dart';

part 'course.g.dart';

//DONOT CHANGE
//WARNING: Do Not Touch
// **************************************************************************
// DO NOT TOUCH
// **************************************************************************

enum Semester {
  @JsonValue('Even')
  even,
  @JsonValue('Odd')
  odd,
}
enum Year {
@JsonValue('First')
first,@JsonValue('Second')
second,@JsonValue('Third')
third,@JsonValue('Fourth')
fourth,}

@JsonSerializable()
class Course {
  String name;
  String code;
  List<String> instructors;
  Year year;
  Semester sem;
  bool group;
  bool lab;
  String branch;
  int credits;

  Course({
    this.name,
    this.code,
    this.sem,
    this.instructors,
    this.year,
    this.group,
    this.lab,
    this.branch,
    this.credits,
  });

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseToJson(this);
}

const SemesterEnumMap = {
  Semester.even: 'Even',
  Semester.odd: 'Odd',
};
