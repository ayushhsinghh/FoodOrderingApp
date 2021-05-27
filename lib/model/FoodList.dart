import 'dart:convert';

FoodList foodListFromJson(String str) => FoodList.fromJson(json.decode(str));

String foodListToJson(FoodList data) => json.encode(data.toJson());

class FoodList {
  FoodList({
    this.items,
  });

  final List<Item> items;

  factory FoodList.fromJson(Map<String, dynamic> json) => FoodList(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    this.desc,
    this.id,
    this.name,
    this.price,
    this.slug,
    this.thumb,
  });

  final String desc;
  final String id;
  final String name;
  final int price;
  final String slug;
  final String thumb;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        desc: json["desc"],
        id: json["id"],
        name: json["name"],
        price: json["price"],
        slug: json["slug"],
        thumb: json["thumb"],
      );

  Map<String, dynamic> toJson() => {
        "desc": desc,
        "id": id,
        "name": name,
        "price": price,
        "slug": slug,
        "thumb": thumb,
      };
}
