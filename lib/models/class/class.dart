import 'package:json_annotation/json_annotation.dart';

part 'class.g.dart';

//DONOT CHANGE
//WARNING: Do Not Touch
// **************************************************************************
// DO NOT TOUCH
// **************************************************************************
enum Venue {
@JsonValue('L102')
L102,@JsonValue('L106')
L106,@JsonValue('L201')
L201,@JsonValue('L202')
L202,@JsonValue('L206')
L206,@JsonValue('L207')
L207,@JsonValue('L107')
L107,@JsonValue('CR101')
CR101,@JsonValue('CR102')
CR102,@JsonValue('CR103')
CR103,@JsonValue('CR104')
CR104,@JsonValue('CR106')
CR106,@JsonValue('CR107')
CR107,@JsonValue('CR108')
CR108,@JsonValue('CR109')
CR109,@JsonValue('CR201')
CR201,@JsonValue('CR202')
CR202,@JsonValue('CR203')
CR203,@JsonValue('CR204')
CR204,@JsonValue('CR205')
CR205,@JsonValue('CR206')
CR206,@JsonValue('CR207')
CR207,@JsonValue('CR208')
CR208,@JsonValue('CR209')
CR209,@JsonValue('Upper CC')
UpperCC,@JsonValue('Lower CC')
LowerCC,@JsonValue('Electronics Lab')
ElectronicsLab,@JsonValue('Workshop')
Workshop,@JsonValue('Design Studio')
DesignStudio,}
enum Group {
@JsonValue('A')
A,@JsonValue('B')
B,}

@JsonSerializable()
class Class {
  String course;
  Group group;
  String day;
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
}
