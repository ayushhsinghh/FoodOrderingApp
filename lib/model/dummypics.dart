// To parse this JSON data, do
//
//     final dummypics = dummypicsFromJson(jsonString);

import 'dart:convert';

Dummypics dummypicsFromJson(String str) => Dummypics.fromJson(json.decode(str));

String dummypicsToJson(Dummypics data) => json.encode(data.toJson());

class Dummypics {
    Dummypics({
        this.dummyFoodPics,
    });

    final List<String> dummyFoodPics;

    factory Dummypics.fromJson(Map<String, dynamic> json) => Dummypics(
        dummyFoodPics: List<String>.from(json["dummy_food_pics"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "dummy_food_pics": List<dynamic>.from(dummyFoodPics.map((x) => x)),
    };
}
