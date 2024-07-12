import 'dart:convert';

class DoctorModel {
  late String name;
  late String type;
  late String description;
  late double rating;
  late double goodReviews;
  late double totalScore;
  late double satisfaction;
  late bool isfavourite;
  late String image;

  DoctorModel({
    required this.name,
    required this.type,
    required this.description,
    required this.rating,
    required this.goodReviews,
    required this.totalScore,
    required this.satisfaction,
    required this.isfavourite,
    required this.image,
  });

  DoctorModel copyWith({
    String? name,
    String? type,
    String? description,
    double? rating,
    double? goodReviews,
    double? totalScore,
    double? satisfaction,
    bool? isfavourite,
    String? image,
  }) {
    return DoctorModel(
      name: name ?? this.name,
      type: type ?? this.type,
      description: description ?? this.description,
      rating: rating ?? this.rating,
      goodReviews: goodReviews ?? this.goodReviews,
      totalScore: totalScore ?? this.totalScore,
      satisfaction: satisfaction ?? this.satisfaction,
      isfavourite: isfavourite ?? this.isfavourite,
      image: image ?? this.image,
    );
  }

  factory DoctorModel.fromRawJson(String str) =>
      DoctorModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      name: json["name"] ?? "",
      type: json["type"] ?? "",
      description: json["description"] ?? "",
      rating: json["rating"]?.toDouble() ?? 0.0,
      goodReviews: json["goodReviews"]?.toDouble() ?? 0.0,
      totalScore: json["totalScore"]?.toDouble() ?? 0.0,
      satisfaction: json["satisfaction"]?.toDouble() ?? 0.0,
      isfavourite: json["isfavourite"] ?? false,
      image: json["image"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
        "description": description,
        "rating": rating,
        "goodReviews": goodReviews,
        "totalScore": totalScore,
        "satisfaction": satisfaction,
        "isfavourite": isfavourite,
        "image": image,
      };
}
