// To parse this JSON data, do
//
//     final Service = ServiceFromJson(jsonString);

import 'dart:convert';

import 'package:fuodz/models/category.dart';
import 'package:fuodz/models/vendor.dart';
import 'package:random_string/random_string.dart';

Service ServiceFromJson(String str) => Service.fromJson(json.decode(str));

String ServiceToJson(Service data) => json.encode(data.toJson());

class Service {
  Service({
    this.id,
    this.name,
    this.description,
    this.price,
    this.discountPrice,
    this.duration,
    this.location,
    this.isActive,
    this.vendorId,
    this.categoryId,
    this.subcategoryId,
    this.createdAt,
    this.updatedAt,
    this.formattedDate,
    this.vendor,
    this.category,
    this.photos,
    this.selectedQty,
  }) {
    this.heroTag = randomAlphaNumeric(15) + "$id";
  }

  int id;
  String heroTag;
  String name;
  String description;
  double price;
  double discountPrice;
  String duration;
  int location;
  int isActive;
  int vendorId;
  int categoryId;
  int subcategoryId;
  DateTime createdAt;
  DateTime updatedAt;
  String formattedDate;
  Vendor vendor;
  Category category;
  List<String> photos;
  int selectedQty;

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json["id"] == null ? null : json["id"],
      name: json["name"] == null ? null : json["name"],
      description: json["description"] == null ? "" : json["description"],
      price:
          json["price"] == null ? null : double.parse(json["price"].toString()),
      discountPrice: json["discount_price"] == null
          ? null
          : double.parse(json["discount_price"].toString()),
      duration: json["duration"],
      location: json["location"] == null
          ? 0
          : (json["location"] is bool)
              ? (json["location"] ? 1 : 0)
              : int.parse(json["location"].toString()) ?? 0,
      isActive: json["is_active"] == null
          ? null
          : int.parse(json["is_active"].toString()),
      vendorId: json["vendor_id"] == null
          ? null
          : int.parse(json["vendor_id"].toString()),
      categoryId: json["category_id"] == null ? null : json["category_id"],
      subcategoryId:
          json["subcategory_id"] == null ? null : json["subcategory_id"],
      createdAt: json["created_at"] == null
          ? null
          : DateTime.parse(json["created_at"]),
      updatedAt: json["updated_at"] == null
          ? null
          : DateTime.parse(json["updated_at"]),
      formattedDate:
          json["formatted_date"] == null ? null : json["formatted_date"],
      vendor: json["vendor"] == null ? null : Vendor.fromJson(json["vendor"]),
      category:
          json["category"] == null ? null : Category.fromJson(json["category"]),

      // photos
      photos: json["photos"] == null
          ? []
          : List<String>.from(
              json["photos"].map((x) => x),
            ),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "description": description == null ? null : description,
        "price": price == null ? null : price,
        "discount_price": discountPrice == null ? null : discountPrice,
        "duration": duration,
        "location": location,
        "is_active": isActive == null ? null : isActive,
        "vendor_id": vendorId == null ? null : vendorId,
        "category_id": categoryId == null ? null : categoryId,
        "subcategory_id": subcategoryId,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "formatted_date": formattedDate == null ? null : formattedDate,
        "vendor": vendor == null ? null : vendor.toJson(),
        "category": category?.toJson(),
      };

  //getters
  get showDiscount => discountPrice > 0.00;
  bool get isPerHour => duration == "hour";
}
