class UserModel {
  final String? id;
  final String token;

  final String? email;

  final String? verifyStatus;
  final String? ref;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json["user"]["id"].toString(),
        token: json["token"],
        email: json["user"]["email"],
        ref: json["reference_no"].toString(),
        verifyStatus: json["user"]["verified_status"]);
  }
  UserModel(
      {required this.id,
      required this.token,
      required this.email,
      required this.ref,
      required this.verifyStatus});
}
