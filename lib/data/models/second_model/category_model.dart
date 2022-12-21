import 'dart:convert';

List<CategoryModel> categoryModelFromJson(String str) => List<CategoryModel>.from(json.decode(str).map((x) => CategoryModel.fromJson(x)));

String categoryModelToJson(List<CategoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryModel {
  CategoryModel({
    required this.id,
    required this.incomeType,
    required this.icon,
    required this.color,
  });

  int id;
  String incomeType;
  String icon;
  String color;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    id: json["id"],
    incomeType: json["income_type"],
    icon: json["icon"],
    color: json["color"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "income_type": incomeType,
    "icon": icon,
    "color": color,
  };
}
