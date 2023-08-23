import 'dart:convert';

List<Items> itemsFromJson(String str) => List<Items>.from(json.decode(str).map((x) => Items.fromJson(x)));

String itemsToJson(List<Items> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Items {
    String name;
    String type;
    String distance;
    String fee;
    String image;

    Items({
        required this.name,
        required this.type,
        required this.distance,
        required this.fee,
        required this.image,
    });

    factory Items.fromJson(Map<String, dynamic> json) => Items(
        name: json["name"],
        type: json["type"],
        distance: json["distance"],
        fee: json["fee"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
        "distance": distance,
        "fee": fee,
        "image": image,
    };
}