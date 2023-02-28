// ignore: unused_import

class SearchModel {
  final int id;
  final String? name;
  final String? groundSurface;
  final String? image;
  final String? num;
  final String? street;
  final String? price;
  final String? code;
  final String? propertyNo;
  final String? village;
  final String? province;
  final String? district;
  final String? commune;
  final String? width;
  final String? length;
  final String? date;
  final String? north;
  final String? south;
  final String? easth;
  final String? westh;
  final List<SearchPhoto> photo;
  SearchModel({
    required this.groundSurface,
    required this.id,
    required this.image,
    required this.name,
    required this.num,
    required this.street,
    required this.photo,
    required this.code,
    required this.commune,
    required this.date,
    required this.district,
    required this.easth,
    required this.length,
    required this.north,
    required this.price,
    required this.propertyNo,
    required this.province,
    required this.south,
    required this.village,
    required this.westh,
    required this.width,
  });
  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      groundSurface:
          json['ground_surface'] == null ? " " : json['ground_surface'],
      id: json['id'],
      image: json['image'],
      name: json['property_name'] == null ? " " : json['property_name'],
      num: json['address_number'] == null ? " " : json['address_number'],
      street: json['address_street'] == null ? " " : json['address_street'],
      code: json['property_code'] == null ? "" : json['property_code'],
      price: json['property_price'] == null ? " " : json['property_price'],
      propertyNo: json['property_no'] == null ? "" : json['property_no'],
      province: json['province'] == null ? "" : json['province'],
      commune: json['commune'] == null ? "" : json['commune'],
      date: json['date_property_no'] == null ? "" : json['date_property_no'],
      district: json['district'] == null ? "" : json['district'],
      south: json['boundary_south'] == null ? "" : json['boundary_south'],
      easth: json['boundary_east'] == null ? " " : json['boundary_east'],
      westh: json['boundary_west'] == null ? " " : json['boundary_west'],
      north: json['boundary_north'] == null ? " " : json['boundary_north'],
      length: json['length'] == null ? "" : json['length'],
      width: json['width'] == null ? "" : json['width'],
      village: json['village'] == null ? "" : json['village'],
      photo: List<SearchPhoto>.from(
          json["photos"].map((x) => SearchPhoto.fromJson(x))),
    );
  }
}

class SearchPhoto {
  int id;
  String image;
  SearchPhoto({required this.id, required this.image});
  factory SearchPhoto.fromJson(Map<String, dynamic> json) {
    return SearchPhoto(id: json['id'], image: json['image'].toString());
  }
}
