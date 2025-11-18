// To parse this JSON data, do
//
//     final itemEntry = itemEntryFromJson(jsonString);

import 'dart:convert';

List<ItemEntry> itemEntryFromJson(String str) => List<ItemEntry>.from(json.decode(str).map((x) => ItemEntry.fromJson(x)));

String itemEntryToJson(List<ItemEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ItemEntry {
    String id;
    String name;
    int price;
    String description;
    String category;
    String thumbnail;
    bool isFeatured;
    int userId;
    DateTime dateAdded;

    ItemEntry({
        required this.id,
        required this.name,
        required this.price,
        required this.description,
        required this.category,
        required this.thumbnail,
        required this.isFeatured,
        required this.userId,
        required this.dateAdded,
    });

    factory ItemEntry.fromJson(Map<String, dynamic> json) => ItemEntry(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        category: json["category"],
        thumbnail: json["thumbnail"],
        isFeatured: json["is_featured"],
        userId: json["user_id"],
        dateAdded: DateTime.parse(json["date_added"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "description": description,
        "category": category,
        "thumbnail": thumbnail,
        "is_featured": isFeatured,
        "user_id": userId,
        "date_added": dateAdded.toIso8601String(),
    };
}