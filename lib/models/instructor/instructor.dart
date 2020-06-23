import 'package:cloud_firestore/cloud_firestore.dart';
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
HOD_CSE,@JsonValue('HOD-ECE')
HOD_ECE,@JsonValue('HOD-ME')
HOD_ME,@JsonValue('HOD-Design')
HOD_Design,@JsonValue('HOD-NS')
HOD_NS,@JsonValue('Cultural Counsellor')
CulturalCounsellor,@JsonValue('Associate Cultural Counsellor')
AssociateCulturalCounsellor,@JsonValue('Science & Technology Counsellor')
ScienceAndTechCounsellor,@JsonValue('Head TT')
HeadTT,@JsonValue('Head Counseling Service')
HeadCounselingService,@JsonValue('Sports Counsellor')
SportsCounsellor,@JsonValue('FIC PHC')
FIC_PHC,@JsonValue('FIC Mess')
FIC_Mess,@JsonValue('Associate FIC Mess')
AssociateFIC_Mess,@JsonValue('Convener CC')
Convener_CC,@JsonValue('Co-Convener CC')
CoConvener_CC,@JsonValue('Warden - Hall 1')
Warden_H1,@JsonValue('Associate Warden - Hall 1')
AssociateWarden_H1,@JsonValue('Warden - Hall 4')
Warden_H4,@JsonValue('Warden - Hall 3')
Warden_H3,@JsonValue('Warden - PG Hostel')
Warden_PGHostel,}
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


  static instructorFromSnapshot(DocumentSnapshot snap){
    return Instructor.fromJson(snap.data);
  }


  static const designationEnumMap = {
  Designation.Assistant: 'Assistant Professor',
  Designation.Associate: 'Associate Professor',
  Designation.Professor: 'Professor',
};

}
