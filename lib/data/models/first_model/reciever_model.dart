class RecieverModel {
  String brand_image;
  String name;
  String location;

  RecieverModel(
      {required this.name, required this.location, required this.brand_image});

  factory RecieverModel.fromJson(Map<String, dynamic> json) {
    return RecieverModel(
        name: json["name"] ?? "",
        location: json["location"] ?? "",
        brand_image: json["brand_image"] ?? "");
  }
}
