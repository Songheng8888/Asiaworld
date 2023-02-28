import 'package:royal_landapp/src/feature/markettype/model/markettyp_model.dart';
import 'package:royal_landapp/src/feature/propertytype/model/propertytype_model.dart';

class WantedModel {
  final String id;
  final String description;
  final String propertyTypeId;
  final String marketTypeId;
  final String maxPrice;
  final String mixPrice;
  final String contactNumber;
  final String? userId;
  final PropertyTypeModel propertyTypeModel;
  final MarketTypeModel marketTypeModel;
  factory WantedModel.fromJson(Map<String, dynamic> json) {
    return WantedModel(
        id: json["id"].toString(),
        description: json["description"],
        propertyTypeId: json["item_type_id"].toString(),
        marketTypeId: json["market_type_id"].toString(),
        maxPrice: json["max_price"],
        mixPrice: json["min_price"],
        marketTypeModel: MarketTypeModel.fromJson(json["market_type"]),
        userId: json["user"]["id"].toString(),
        propertyTypeModel: PropertyTypeModel.fromJson(json["item_type"]),
        contactNumber: json["contact_number"]);
  }
  WantedModel(
      {required this.id,
      required this.description,
      required this.propertyTypeId,
      required this.marketTypeId,
      required this.maxPrice,
      required this.mixPrice,
      required this.propertyTypeModel,
      required this.userId,
      required this.marketTypeModel,
      required this.contactNumber});
}
