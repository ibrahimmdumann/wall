import 'dart:convert';

// List<Photo> photoFromJson(List<dynamic> str) =>
//     List<Photo>.from(str.map((x) => Photo.fromJson(x)));

// String photoToJson(List<Photo> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Photo {
//   Photo({
//     this.albumId,
//     this.id,
//     this.title,
//     this.url,
//     this.thumbnailUrl,
//   });

//   final int? albumId;
//   final int? id;
//   final String? title;
//   final String? url;
//   final String? thumbnailUrl;

//   Photo copyWith({
//     int? albumId,
//     int? id,
//     String? title,
//     String? url,
//     String? thumbnailUrl,
//   }) =>
//       Photo(
//         albumId: albumId ?? this.albumId,
//         id: id ?? this.id,
//         title: title ?? this.title,
//         url: url ?? this.url,
//         thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
//       );

//   factory Photo.fromJson(Map<String, dynamic> json) => Photo(
//         albumId: json["albumId"] ?? 0,
//         id: json["id"] ?? 0,
//         title: json["title"] ?? '',
//         url: json["url"] ?? '',
//         thumbnailUrl: json["thumbnailUrl"] ?? '',
//       );

//   Map<String, dynamic> toJson() => {
//         "albumId": albumId,
//         "id": id,
//         "title": title,
//         "url": url,
//         "thumbnailUrl": thumbnailUrl,
//       };
// }

// To parse this JSON data, do
//
//     final photo = photoFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Photo photoFromJson(String str) => Photo.fromJson(json.decode(str));

String photoToJson(Photo data) => json.encode(data.toJson());

class Photo {
  Photo({
    required this.materialWallpaper,
  });

  final List<MaterialWallpaper> materialWallpaper;

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        materialWallpaper: List<MaterialWallpaper>.from(
            json["MaterialWallpaper"]
                .map((x) => MaterialWallpaper.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "MaterialWallpaper":
            List<dynamic>.from(materialWallpaper.map((x) => x.toJson())),
      };
}

class MaterialWallpaper {
  MaterialWallpaper(
      {required this.id,
      required this.catId,
      required this.image,
      this.url,
      this.thumb});

  final String id;
  final String catId;
  final String image;
  final String? url;
  final String? thumb;

  factory MaterialWallpaper.fromJson(Map<String, dynamic> json) => MaterialWallpaper(
      id: json["id"],
      catId: json["cat_id"],
      image: json["image"],
      thumb:
          'http://idriscelebi.com/eviller_scorpion/upload/thumbs/${json["image"]}',
      url: 'http://idriscelebi.com/eviller_scorpion/upload/${json["image"]}');

  Map<String, dynamic> toJson() => {
        "id": id,
        "cat_id": catId,
        "image": image,
      };
}

List<ICrmPersonsResponse> iCrmPersonsResponseFromJson(List<dynamic> str) => List<ICrmPersonsResponse>.from(str.map((x) => ICrmPersonsResponse.fromJson(x)));

String iCrmPersonsResponseToJson(List<ICrmPersonsResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ICrmPersonsResponse {
    int albumId;
    int id;
    String title;
    String url;
    String thumbnailUrl;

    ICrmPersonsResponse({
        required this.albumId,
        required this.id,
        required this.title,
        required this.url,
        required this.thumbnailUrl,
    });

    factory ICrmPersonsResponse.fromJson(Map<String, dynamic> json) => ICrmPersonsResponse(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
    );

    Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
    };
}
