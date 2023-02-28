import 'dart:convert';

class AccountModel {
  final String id;
  final String name;
  final String phone;
  final String email;
  final String? image;
  final String? userType;
  final String? skills;
  final String? educations;
  final String? experiences;
  final String? properties;
  // final String? profile
  final String? address;
  final String? company;
  final String? avalablePost;
  final Upgrade? upgrade;
  // List<dynamic>? skills;
  // List<dynamic>? educations;
  // List<dynamic>? experiences;
  // List<dynamic>? properties;
  AccountModel(
      {required this.email,
      required this.userType,
      required this.id,
      required this.name,
      required this.phone,
      required this.educations,
      required this.experiences,
      required this.image,
      required this.company,
      required this.address,
      required this.avalablePost,
      required this.properties,
      required this.skills,
      required this.upgrade});
  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
        id: json["id"].toString(),
        email: json["email"],
        userType: json["user_type"],
        name: json["name"],
        phone: json["phone"],
        educations: json["educations"],
        experiences: json["experiences"],
        image: json["image_url"],
        company: json["company"],
        address: json["address"],
        avalablePost: json["available_post"].toString(),
        properties: json["properties"],
        upgrade:
            json["upgrade"] == null ? null : Upgrade.fromJson(json["upgrade"]),
        skills: json["skills"]);
    // return AccountModel(
    // id: json['id'].toString(),
    // name: json['name'],
    // email: json['email'],
    // userType: json['user_type'],
    // phone: json['phone'],
    // // profile: json["profile"] == null ? null : json['profile'],
    // image: json["image_url"] == null ? null : json['image_url'],
    // skills: List<ListSkill>.from(json["skills"].map((x) => x)),
    // educations: List<ListEducations>.from(json["educations"].map((x) => x)),
    // experiences:
    //     List<ListExperiences>.from(json["experiences"].map((x) => x)),
    // properties: List<ListProperties>.from(json["properties"].map((x) => x)),
    // );
  }
}

class Upgrade {
  final String status;
  factory Upgrade.fromJson(Map<String, dynamic> json) {
    return Upgrade(status: json["status"]);
  }
  Upgrade({required this.status});
}

class ListSkill {}

class ListEducations {}

class ListExperiences {}

class ListProperties {}
