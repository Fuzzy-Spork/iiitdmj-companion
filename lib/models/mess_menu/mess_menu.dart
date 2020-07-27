import 'package:iiitdmjcompanion/models/class/class.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mess_menu.g.dart';

@JsonSerializable()
class MessMenu {
  Day day;
  List<String> breakfast;
  List<String> lunch;
  List<String> dinner;

  MessMenu({this.day, this.breakfast, this.lunch, this.dinner});

  factory MessMenu.fromJson(Map<String, dynamic> json) =>
      _$MessMenuFromJson(json);

  Map<String, dynamic> toJson() => _$MessMenuToJson(this);
}
