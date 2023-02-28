class PropertyTypeModel {
  final String? id;
  final String? name;
  final String? img;
  factory PropertyTypeModel.fromJson(Map<String, dynamic> json) {
    return PropertyTypeModel(
        id: json["id"].toString(), name: json["name"], img: json["image"]);
  }
  PropertyTypeModel({required this.id, required this.name, required this.img});
}
