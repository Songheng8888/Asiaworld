class MarketTypeModel {
  final String? id;
  final String name;
  factory MarketTypeModel.fromJson(Map<String, dynamic> json) {
    return MarketTypeModel(id: json["id"].toString(), name: json["name"]);
  }
  MarketTypeModel({required this.id, required this.name});
}
