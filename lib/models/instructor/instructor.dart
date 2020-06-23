import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

import 'instructors_list.dart';
import 'instructors_list.dart';

part 'instructor.g.dart';

//DO NOT CHANGE
//WARNING: Do Not Touch
// **************************************************************************
// DO NOT TOUCH
// **************************************************************************

enum Tag {
  @JsonValue('Dean Students')
  DeanStudents,
  @JsonValue('Dean PnD')
  DeanPnD,
  @JsonValue('Dean RSPC')
  DeanRSPC,
  @JsonValue('Dean Academic')
  DeanAcad,
  @JsonValue('Chair Placement')
  ChairPlacement,
  @JsonValue('HOD-CSE')
  HOD_CSE,
  @JsonValue('HOD-ECE')
  HOD_ECE,
  @JsonValue('HOD-ME')
  HOD_ME,
  @JsonValue('HOD-Design')
  HOD_Design,
  @JsonValue('HOD-NS')
  HOD_NS,
  @JsonValue('Cultural Counsellor')
  CulturalCounsellor,
  @JsonValue('Associate Cultural Counsellor')
  AssociateCulturalCounsellor,
  @JsonValue('Science & Technology Counsellor')
  ScienceAndTechCounsellor,
  @JsonValue('Head TT')
  HeadTT,
  @JsonValue('Head Counseling Service')
  HeadCounselingService,
  @JsonValue('Sports Counsellor')
  SportsCounsellor,
  @JsonValue('FIC PHC')
  FIC_PHC,
  @JsonValue('FIC Mess')
  FIC_Mess,
  @JsonValue('Associate FIC Mess')
  AssociateFIC_Mess,
  @JsonValue('Convener CC')
  Convener_CC,
  @JsonValue('Co-Convener CC')
  CoConvener_CC,
  @JsonValue('Warden - Hall 1')
  Warden_H1,
  @JsonValue('Associate Warden - Hall 1')
  AssociateWarden_H1,
  @JsonValue('Warden - Hall 4')
  Warden_H4,
  @JsonValue('Warden - Hall 3')
  Warden_H3,
  @JsonValue('Warden - PG Hostel')
  Warden_PGHostel,
}
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

  static instructorFromSnapshot(DocumentSnapshot snap) {
    return Instructor.fromJson(snap.data);
  }

  static Instructor instructorFromName(String name, List<Instructor> all) {
    for (var instructor in all) {
      if (name == instructor.name) {
        return instructor;
      }
    }
    return null;
  }

  static const designationEnumMap = {
    Designation.Assistant: 'Assistant Professor',
    Designation.Associate: 'Associate Professor',
    Designation.Professor: 'Professor',
  };
  static const tagEnumMap = {
    Tag.DeanStudents: 'Dean Students',
    Tag.DeanPnD: 'Dean PnD',
    Tag.DeanRSPC: 'Dean RSPC',
    Tag.DeanAcad: 'Dean Academic',
    Tag.ChairPlacement: 'Chair Placement',
    Tag.HOD_CSE: 'HOD-CSE',
    Tag.HOD_ECE: 'HOD-ECE',
    Tag.HOD_ME: 'HOD-ME',
    Tag.HOD_Design: 'HOD-Design',
    Tag.HOD_NS: 'HOD-NS',
    Tag.CulturalCounsellor: 'Cultural Counsellor',
    Tag.AssociateCulturalCounsellor: 'Associate Cultural Counsellor',
    Tag.ScienceAndTechCounsellor: 'Science & Technology Counsellor',
    Tag.HeadTT: 'Head TT',
    Tag.HeadCounselingService: 'Head Counseling Service',
    Tag.SportsCounsellor: 'Sports Counsellor',
    Tag.FIC_PHC: 'FIC PHC',
    Tag.FIC_Mess: 'FIC Mess',
    Tag.AssociateFIC_Mess: 'Associate FIC Mess',
    Tag.Convener_CC: 'Convener CC',
    Tag.CoConvener_CC: 'Co-Convener CC',
    Tag.Warden_H1: 'Warden - Hall 1',
    Tag.AssociateWarden_H1: 'Associate Warden - Hall 1',
    Tag.Warden_H4: 'Warden - Hall 4',
    Tag.Warden_H3: 'Warden - Hall 3',
    Tag.Warden_PGHostel: 'Warden - PG Hostel',
  };
}
