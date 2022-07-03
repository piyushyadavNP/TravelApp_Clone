import 'dart:convert';

class DataModel {
  String? name;
  String? img;
  int? price;
  int? people;
  int? stars;
  String? description;
  String? location;

  DataModel(
      {required this.name,
      required this.img,
      required this.price,
      required this.people,
      required this.stars,
      required this.description,
      required this.location});

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        description: json['description'],
        img: json['img'],
        location: json['location'],
        name: json['name'],
        people: json['people'],
        price: json['price'],
        stars: json['stars'],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "img": img,
        "location": location,
        "name": name,
        "people": people,
        "price": price,
        "stars": stars,
      };
}

List<DataModel> dataFromJson(String str) =>
    List<DataModel>.from(json.decode(str).map((x) => DataModel.fromJson(x)));

String dataToJson(List<DataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
