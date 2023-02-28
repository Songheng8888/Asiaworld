class SubScriptionModel {
  final String id;
  final String name;
  final String des;
  // final String value;
  factory SubScriptionModel.fromJson(Map<String, dynamic> json) {
    return SubScriptionModel(
      id: json["id"].toString(),
      name: json["name"],
      des: json["description"],
      // value: json["value"]
    );
  }
  SubScriptionModel(
      {required this.id,
      required this.name,
      // required this.value,
      required this.des});
}
