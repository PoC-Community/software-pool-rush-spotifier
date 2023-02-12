import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/models/artist.dart';
import 'package:myapp/models/user.dart';

class JsonUser {
  JsonUser({
    required this.email,
    required this.pass,
    this.username,
  });
  String email;
  String pass;
  String? username;
  Map<String, dynamic> toJson() => {
        'email': email,
        'password': pass,
        'username': username,
      };
}

class Api {
  static final String _url = dotenv.env['REACT_APP_API_URL']!;
  static String _token = "";

  static Future<bool> health() async {
    final response = await http.get(
      Uri.parse("$_url/health"),
      headers: {
        "Access-Control-Allow-Origin": "*",
      },
    );
    return response.statusCode == 200;
  }

  static Future<bool> login(String email, String password) async {
    final response = await http.post(
      Uri.parse("$_url/login"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(
        JsonUser(
          email: email,
          pass: password,
        ).toJson(),
      ),
    );
    if (response.statusCode == 202) {
      final data = (jsonDecode(response.body));
      _token = data["token"];
      Get.find<User>().setuserinfo(email, password, "");

      return true;
    }

    return false;
  }

  static Future<bool> register(
      String email, String password, String username) async {
    String json = jsonEncode(
      JsonUser(
        email: email,
        username: username,
        pass: password,
      ).toJson(),
    );
    final response = await http.post(
      Uri.parse("$_url/register"),
      headers: {"Content-Type": "application/json"},
      body: json,
    );

    if (response.statusCode == 201) {
      final data = (jsonDecode(response.body));
      _token = data["token"];
      Get.find<User>().setuserinfo(email, password, username);
      return true;
    }
    return false;
  }

  static Future<bool> createPlaylist() async {
    return true;
  }

  static Future<bool> deletePlaylist() async {
    return true;
  }

  static Future<bool> editPlayList() async {
    return true;
  }

  static Future<List<Artist>> getMusic() async {
    //   final response = await http.get(
    //     Uri.parse("$_url/artist"),
    //     headers: {
    //       "auth": _token,
    //     },
    //   );
    //   Iterable l = jsonDecode(response.body);
    //   return List<Artist>.from(l.map((model) => Artist.fromJson(model)));
    // }
    return [
      Artist(
          name: "Bob",
          musicGender: "Pop",
          nationality: "Sweden",
          photoUrl:
              "https://media.istockphoto.com/id/1406553526/fr/photo/paysage-brumeux-du-matin-au-lever-du-soleil.jpg?b=1&s=170667a&w=0&k=20&c=c5c2Iv3ZMt-FpSBNlzdxNTSPvocfy6G1keQqAPEqReQ=",
          rating: 5),
      Artist(
          name: "Jack",
          musicGender: "Metal",
          nationality: "Sweden",
          photoUrl:
              "https://media.istockphoto.com/id/1406553526/fr/photo/paysage-brumeux-du-matin-au-lever-du-soleil.jpg?b=1&s=170667a&w=0&k=20&c=c5c2Iv3ZMt-FpSBNlzdxNTSPvocfy6G1keQqAPEqReQ=",
          rating: 5),
      Artist(
          name: "Test",
          musicGender: "Rap",
          nationality: "kek",
          photoUrl:
              "https://media.istockphoto.com/id/1406553526/fr/photo/paysage-brumeux-du-matin-au-lever-du-soleil.jpg?b=1&s=170667a&w=0&k=20&c=c5c2Iv3ZMt-FpSBNlzdxNTSPvocfy6G1keQqAPEqReQ=",
          rating: 5),
      Artist(
          name: "Jack",
          musicGender: "Metal",
          nationality: "Sweden",
          photoUrl:
              "https://media.istockphoto.com/id/1406553526/fr/photo/paysage-brumeux-du-matin-au-lever-du-soleil.jpg?b=1&s=170667a&w=0&k=20&c=c5c2Iv3ZMt-FpSBNlzdxNTSPvocfy6G1keQqAPEqReQ=",
          rating: 5),
      Artist(
          name: "Jack",
          musicGender: "Metal",
          nationality: "Sweden",
          photoUrl:
              "https://media.istockphoto.com/id/1406553526/fr/photo/paysage-brumeux-du-matin-au-lever-du-soleil.jpg?b=1&s=170667a&w=0&k=20&c=c5c2Iv3ZMt-FpSBNlzdxNTSPvocfy6G1keQqAPEqReQ=",
          rating: 5),
      Artist(
          name: "Jack",
          musicGender: "Metal",
          nationality: "Sweden",
          photoUrl:
              "https://media.istockphoto.com/id/1406553526/fr/photo/paysage-brumeux-du-matin-au-lever-du-soleil.jpg?b=1&s=170667a&w=0&k=20&c=c5c2Iv3ZMt-FpSBNlzdxNTSPvocfy6G1keQqAPEqReQ=",
          rating: 5),
      Artist(
          name: "Jack",
          musicGender: "Metal",
          nationality: "Sweden",
          photoUrl:
              "https://media.istockphoto.com/id/1406553526/fr/photo/paysage-brumeux-du-matin-au-lever-du-soleil.jpg?b=1&s=170667a&w=0&k=20&c=c5c2Iv3ZMt-FpSBNlzdxNTSPvocfy6G1keQqAPEqReQ=",
          rating: 5),
      Artist(
          name: "Jack",
          musicGender: "Metal",
          nationality: "Sweden",
          photoUrl:
              "https://media.istockphoto.com/id/1406553526/fr/photo/paysage-brumeux-du-matin-au-lever-du-soleil.jpg?b=1&s=170667a&w=0&k=20&c=c5c2Iv3ZMt-FpSBNlzdxNTSPvocfy6G1keQqAPEqReQ=",
          rating: 5),
      Artist(
          name: "Jack",
          musicGender: "Metal",
          nationality: "Sweden",
          photoUrl:
              "https://media.istockphoto.com/id/1406553526/fr/photo/paysage-brumeux-du-matin-au-lever-du-soleil.jpg?b=1&s=170667a&w=0&k=20&c=c5c2Iv3ZMt-FpSBNlzdxNTSPvocfy6G1keQqAPEqReQ=",
          rating: 5),
      Artist(
          name: "Jack",
          musicGender: "Metal",
          nationality: "Sweden",
          photoUrl:
              "https://media.istockphoto.com/id/1406553526/fr/photo/paysage-brumeux-du-matin-au-lever-du-soleil.jpg?b=1&s=170667a&w=0&k=20&c=c5c2Iv3ZMt-FpSBNlzdxNTSPvocfy6G1keQqAPEqReQ=",
          rating: 5),
      Artist(
          name: "Jack",
          musicGender: "Metal",
          nationality: "Sweden",
          photoUrl:
              "https://media.istockphoto.com/id/1406553526/fr/photo/paysage-brumeux-du-matin-au-lever-du-soleil.jpg?b=1&s=170667a&w=0&k=20&c=c5c2Iv3ZMt-FpSBNlzdxNTSPvocfy6G1keQqAPEqReQ=",
          rating: 5),
      Artist(
          name: "Jack",
          musicGender: "Metal",
          nationality: "Sweden",
          photoUrl:
              "https://media.istockphoto.com/id/1406553526/fr/photo/paysage-brumeux-du-matin-au-lever-du-soleil.jpg?b=1&s=170667a&w=0&k=20&c=c5c2Iv3ZMt-FpSBNlzdxNTSPvocfy6G1keQqAPEqReQ=",
          rating: 5),
      Artist(
          name: "Jack",
          musicGender: "Metal",
          nationality: "Sweden",
          photoUrl:
              "https://media.istockphoto.com/id/1406553526/fr/photo/paysage-brumeux-du-matin-au-lever-du-soleil.jpg?b=1&s=170667a&w=0&k=20&c=c5c2Iv3ZMt-FpSBNlzdxNTSPvocfy6G1keQqAPEqReQ=",
          rating: 5),
      Artist(
          name: "Jack",
          musicGender: "Metal",
          nationality: "Sweden",
          photoUrl:
              "https://media.istockphoto.com/id/1406553526/fr/photo/paysage-brumeux-du-matin-au-lever-du-soleil.jpg?b=1&s=170667a&w=0&k=20&c=c5c2Iv3ZMt-FpSBNlzdxNTSPvocfy6G1keQqAPEqReQ=",
          rating: 5),
      Artist(
          name: "Jack",
          musicGender: "Metal",
          nationality: "Sweden",
          photoUrl:
              "https://media.istockphoto.com/id/1406553526/fr/photo/paysage-brumeux-du-matin-au-lever-du-soleil.jpg?b=1&s=170667a&w=0&k=20&c=c5c2Iv3ZMt-FpSBNlzdxNTSPvocfy6G1keQqAPEqReQ=",
          rating: 5),
      Artist(
          name: "Jack",
          musicGender: "Metal",
          nationality: "Sweden",
          photoUrl:
              "https://media.istockphoto.com/id/1406553526/fr/photo/paysage-brumeux-du-matin-au-lever-du-soleil.jpg?b=1&s=170667a&w=0&k=20&c=c5c2Iv3ZMt-FpSBNlzdxNTSPvocfy6G1keQqAPEqReQ=",
          rating: 5),
      Artist(
          name: "Jack",
          musicGender: "Metal",
          nationality: "Sweden",
          photoUrl:
              "https://media.istockphoto.com/id/1406553526/fr/photo/paysage-brumeux-du-matin-au-lever-du-soleil.jpg?b=1&s=170667a&w=0&k=20&c=c5c2Iv3ZMt-FpSBNlzdxNTSPvocfy6G1keQqAPEqReQ=",
          rating: 5),
    ];
  }
}
