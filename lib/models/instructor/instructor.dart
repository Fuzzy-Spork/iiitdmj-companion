import 'package:json_annotation/json_annotation.dart';

part 'instructor.g.dart';

//DO NOT CHANGE
//WARNING: Do Not Touch
// **************************************************************************
// DO NOT TOUCH
// **************************************************************************

enum Tag {
@JsonValue('Dean Students')
DeanStudents,@JsonValue('Dean PnD')
DeanPnD,@JsonValue('Dean RSPC')
DeanRSPC,@JsonValue('Dean Academic')
DeanAcad,@JsonValue('Chair Placement')
ChairPlacement,@JsonValue('HOD-CSE')
HODCSE,@JsonValue('HOD-ECE')
HODECE,@JsonValue('HOD-ME')
HODME,@JsonValue('HOD-Design')
HODDesign,@JsonValue('HOD-NS')
HODNS,@JsonValue('Cultural Counsellor')
CulturalCounsellor,@JsonValue('Technical Counsellor')
TechnicalCounsellor,@JsonValue('Head TT')
HeadTT,@JsonValue('Head Counseling Service')
HeadCounselingService,}
enum Building {
  @JsonValue('Computer Center')
  CC,
  @JsonValue('LHTC')
  LHTC,
  @JsonValue('Core Lab Complex')
  CLC,
  @JsonValue('Academic Block')
  Acad,
  @JsonValue('Near Bank')
  Bank,
}

enum Designation {
  @JsonValue('Assistant Professor')
  Assistant,
  @JsonValue('Associate Professor')
  Associate,
  @JsonValue('Professor')
  Professor,
}
enum Department {
  @JsonValue('CSE')
  CSE,
  @JsonValue('ECE')
  ECE,
  @JsonValue('Design')
  Design,
  @JsonValue('ME')
  ME,
  @JsonValue('NS')
  NS,
}

@JsonSerializable()
class Instructor {
  String name;
  Building building;
  Designation designation; //Ass, Assoc, Prof
  List<Department> dept; //Special for Puneet Tandon
  String code; //Ex: Manish Kumar Bajpai = MKB lolololol
  String email;
  String tilda;
  String phone;
  List<Tag> tags;

  Instructor({
    this.name,
    this.building,
    this.designation,
    this.dept,
    this.code,
    this.email,
    this.tilda,
    this.phone,
    this.tags,
  });

  factory Instructor.fromJson(Map<String, dynamic> json) =>
      _$InstructorFromJson(json);

  Map<String, dynamic> toJson() => _$InstructorToJson(this);
}
