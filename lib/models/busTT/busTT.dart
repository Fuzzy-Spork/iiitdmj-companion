import 'package:iiitdmjcompanion/models/class/class.dart';
import 'package:json_annotation/json_annotation.dart';

part 'busTT.g.dart';

@JsonSerializable()
class BusTT implements Comparable {
  String time;
  String toFrom;
  Day day;

  BusTT({this.time, this.toFrom, this.day});

  factory BusTT.fromJson(Map<String, dynamic> json) => _$BusTTFromJson(json);

  Map<String, dynamic> toJson() => _$BusTTToJson(this);

  @override
  int compareTo(other) {
    if (this.time == null || other == null) {
      return null;
    }
    if (this.time.substring(6, 8) == 'AM' &&
        other.time.substring(6, 8) == 'PM') {
      return -1;
    }
    if (this.time.substring(6, 8) == 'PM' &&
        other.time.substring(6, 8) == 'AM') {
      return 1;
    }
    if (int.parse(this.time[0]) == 0 && int.parse(other.time[0]) == 1) {
      return -1;
    }
    if (int.parse(this.time[0]) == 1 && int.parse(other.time[0]) == 0) {
      return 1;
    }
    if (int.parse(this.time[0]) == 0 && int.parse(other.time[0]) == 0) {
      if (int.parse(this.time[1]) < int.parse(other.time[1])) {
        return -1;
      } else if (int.parse(this.time[1]) > int.parse(other.time[1])) {
        return 1;
      } else if (int.parse(this.time[3]) > int.parse(other.time[3])) {
        return 1;
      } else {
        return -1;
      }
    }
    if (int.parse(this.time[0]) == 1 && int.parse(other.time[0]) == 1) {
      if (int.parse(this.time[1]) < int.parse(other.time[1])) {
        return -1;
      } else {
        return 1;
      }
    }

    return null;
  }
}
