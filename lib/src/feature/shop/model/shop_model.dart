class ShopModel {
  final String id;
  final String? name;
  final String? email;
  final String? image;

  final String? profile;
  final String? phone;

  final String? userType;
  ShopModel({
    required this.id,
    required this.name,
    required this.email,
    required this.image,
    required this.profile,
    required this.phone,
    required this.userType,
  });
  factory ShopModel.fromJson(Map<String, dynamic> json) {
    return ShopModel(
      id: json['id'].toString(),
      name: json['name'].toString(),
      email: json['email'].toString(),
      image: json['image_url'].toString(),
      profile: json['profile'].toString(),
      phone: json['phone'].toString(),
      userType: json['user_type'].toString(),
    );
  }
}
