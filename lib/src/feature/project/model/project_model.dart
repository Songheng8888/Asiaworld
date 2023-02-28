class ProjectModel {
  final String? id;
  final String name;
  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(id: json["id"].toString(), name: json["property_name"]);
  }
  ProjectModel({required this.id, required this.name});
}
