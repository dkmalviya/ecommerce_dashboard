// To parse this JSON data, do
//
//     final subCategoryReponseDto = subCategoryReponseDtoFromJson(jsonString);

import 'dart:convert';

List<SubCategoryReponseDto> subCategoryReponseDtoFromJson(String str) => List<SubCategoryReponseDto>.from(json.decode(str).map((x) => SubCategoryReponseDto.fromJson(x)));

String subCategoryReponseDtoToJson(List<SubCategoryReponseDto> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SubCategoryReponseDto {
  SubCategoryReponseDto({
    this.subCategoryId,
    this.subcategoryName,
    this.categoryId,
  });

  String subCategoryId;
  String subcategoryName;
  int categoryId;

  factory SubCategoryReponseDto.fromJson(Map<String, dynamic> json) => SubCategoryReponseDto(
    subCategoryId: json["subCategoryId"],
    subcategoryName: json["subcategoryName"],
    categoryId: json["categoryId"],
  );

  Map<String, dynamic> toJson() => {
    "subCategoryId": subCategoryId,
    "subcategoryName": subcategoryName,
    "categoryId": categoryId,
  };
}
