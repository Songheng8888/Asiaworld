import 'package:royal_landapp/src/feature/markettype/model/markettyp_model.dart';
import 'package:royal_landapp/src/feature/project/model/project_model.dart';
import 'package:royal_landapp/src/feature/propertytype/model/propertytype_model.dart';

class PropertyModel {
  final String id;
  final String? propertyName;
  final String? propertyType;
  final String? projectId;
  final String? propertyCode;
  final String? propertyPrice;
  final String? propertyNo;
  final String? address;
  final String? street;
  final String? img;
  final String? date;
  final String? province;
  final String? size;
  final String? lat;
  final String? long;
  final String? village;
  final String? commune;
  final String? district;
  final List<PhotoModel>? photoModel;
  final PropertyTypeModel? typeModel;
  final MarketTypeModel? marketTypeModel;
  final ProjectModel? projectModel;
  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    // List imagess = [];
    List<PhotoModel>? les = [];
    if (json["photos"].length == 0) {
    } else {
      json["photos"].forEach((val) {
        les.add(PhotoModel.fromJson(val));
      });
    }

    return PropertyModel(
        id: json["id"].toString(),
        propertyName: json["property_name"],
        propertyPrice: json["property_price"],
        propertyType: json["item_type"].toString(),
        projectId: json["project_id"].toString(),
        propertyCode: json["property_code"].toString(),
        propertyNo: json["property_no"],
        address: json["address_number"],
        date: json["date_property_no"],
        street: json["address_street"],
        village: json["village"],
        commune: json["commune"],
        district: json["district"],
        province: json["province"],
        size: json["ground_surface"],
        lat: json["lat"],
        long: json["lon"],
        img: json["image"],
        projectModel: json["project"] == null ? null : ProjectModel.fromJson(json["project"]),
        typeModel: json["item_type"] == null ? null : PropertyTypeModel.fromJson(json["item_type"]),
        marketTypeModel:
            json["market_type"] == null ? null : MarketTypeModel.fromJson(json["market_type"]),
        photoModel: les);
  }
  PropertyModel(
      {required this.id,
      required this.propertyName,
      required this.propertyPrice,
      required this.propertyType,
      required this.marketTypeModel,
      required this.projectId,
      required this.date,
      required this.propertyCode,
      required this.propertyNo,
      required this.address,
      required this.street,
      required this.village,
      required this.commune,
      required this.district,
      required this.province,
      required this.size,
      required this.lat,
      required this.long,
      required this.img,
      required this.projectModel,
      required this.typeModel,
      required this.photoModel});
}

class PhotoModel {
  final String image;
  final String id;
  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(id: json["id"].toString(), image: json["image"].toString());
  }
  PhotoModel({required this.id, required this.image});
}
