import 'package:myapp/models/music.dart';

class Artist {
  Artist(
      {required this.name,
      required this.musicGender,
      this.musics = const [],
      required this.nationality,
      required this.photoUrl,
      required this.rating});
  String name;
  int rating;
  String nationality;
  String musicGender;
  String photoUrl;
  List<Music> musics;
  Artist.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        musics = [],
        musicGender = json['email'],
        nationality = json['nationality'],
        photoUrl = json['photoUrl'],
        rating = int.parse(json['rating']);
  Map<String, dynamic> toJson() => {
        "name": name,
        "rating": rating,
        "nationality": nationality,
        "musicGender": musicGender,
        "photoUrl": photoUrl,
      };
}
