// To parse this JSON data, do
//
//     final categoryReponseDto = categoryReponseDtoFromJson(jsonString);

import 'dart:convert';

List<CategoryReponseDto> categoryReponseDtoFromJson(String str) => List<CategoryReponseDto>.from(json.decode(str).map((x) => CategoryReponseDto.fromJson(x)));

String categoryReponseDtoToJson(List<CategoryReponseDto> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryReponseDto {
  CategoryReponseDto({
    this.categoryId,
    this.title,
    this.categoryImage,
  });

  String categoryId;
  String title;
  String categoryImage;

  factory CategoryReponseDto.fromJson(Map<String, dynamic> json) => CategoryReponseDto(
    categoryId: json["categoryId"],
    title: json["title"],
    categoryImage: json["categoryImage"],
  );

  Map<String, dynamic> toJson() => {
    "categoryId": categoryId,
    "title": title,
    "categoryImage": categoryImage,
  };
}



