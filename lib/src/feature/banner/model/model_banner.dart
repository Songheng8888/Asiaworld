class BannerModel {
  final String id;
  final String name;
  final String image;

  BannerModel({
    required this.id,
    required this.name,
    required this.image,
  });
  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'].toString(),
      name: json['name'],
      image: json['image'],
    );
  }
}
