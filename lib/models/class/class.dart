import 'package:json_annotation/json_annotation.dart';

part 'class.g.dart';

//DONOT CHANGE
//WARNING: Do Not Touch
// **************************************************************************
// DO NOT TOUCH
// **************************************************************************
@JsonSerializable()
class Class {
  String course;
  String day;
  DateTime timeStart;
  DateTime timeEnd;
  String venue;

  Class(this.course, this.day, this.timeStart, this.timeEnd, this.venue);

  factory Class.fromJson(Map<String, dynamic> json) => _$ClassFromJson(json);

  Map<String, dynamic> toJson() => _$ClassToJson(this);
}
