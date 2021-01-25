// To parse this JSON data, do
//
//     final productDetailsReponseDto = productDetailsReponseDtoFromJson(jsonString);

import 'dart:convert';

List<ProductDetailsReponseDto> productDetailsReponseDtoFromJson(String str) => List<ProductDetailsReponseDto>.from(json.decode(str).map((x) => ProductDetailsReponseDto.fromJson(x)));

String productDetailsReponseDtoToJson(List<ProductDetailsReponseDto> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductDetailsReponseDto {
  ProductDetailsReponseDto({
    this.productId,
    this.name,
    this.brand,
    this.quantityAvailable,
    this.weight,
    this.qantitySelectedByUser,
    this.unit,
    this.price,
    this.subCategoryId,
    this.categoryId,
  });

  int productId;
  String name;
  String brand;
  int quantityAvailable;
  int weight;
  int qantitySelectedByUser;
  String unit;
  int price;
  String subCategoryId;
  int categoryId;

  factory ProductDetailsReponseDto.fromJson(Map<String, dynamic> json) => ProductDetailsReponseDto(
    productId: json["productId"],
    name: json["name"],
    brand: json["brand"],
    quantityAvailable: json["quantityAvailable"],
    weight: json["weight"],
    qantitySelectedByUser: json["qantitySelectedByUser"] == null ? null : json["qantitySelectedByUser"],
    unit: json["unit"],
    price: json["price"] == null ? null : json["price"],
    subCategoryId: json["subCategoryId;"],
    categoryId: json["categoryId"],
  );

  Map<String, dynamic> toJson() => {
    "productId": productId,
    "name": name,
    "brand": brand,
    "quantityAvailable": quantityAvailable,
    "weight": weight,
    "qantitySelectedByUser": qantitySelectedByUser == null ? null : qantitySelectedByUser,
    "unit": unit,
    "price": price == null ? null : price,
    "subCategoryId;": subCategoryId,
    "categoryId": categoryId,
  };
}

