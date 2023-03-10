import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:myapp/models/artist.dart';

class JsonUser {
  JsonUser({
    required this.email,
    required this.pass,
  });
  String email;
  String pass;
  Map<String, dynamic> toJson() => {
        'password': pass,
        'email': email,
      };
}

class Api {
  static final String _url = "http://127.0.0.1:8080";
  static String _token = "";

  static Future<bool> health() async {
    final response = await http.get(Uri.parse("$_url/health"));
    return response.statusCode == 200;
  }

  static Future<bool> login(String email, String password) async {
    final response = await http.post(
      Uri.parse("$_url/auth/login"),
      body: jsonEncode(
        JsonUser(
          email: email,
          pass: password,
        ),
      ),
    );
    if (response.statusCode == 200) {
      _token = response.body;
      return true;
    }
    return false;
  }

  static Future<bool> register(String email, String password) async {
    final response = await http.post(
      Uri.parse("$_url/auth/register"),
      body: jsonEncode(
        JsonUser(
          email: email,
          pass: password,
        ).toJson(),
      ),
    );
    if (response.statusCode == 200) {
      _token = response.body;
      return true;
    }
    return false;
  }

  static Future<bool> createArtist(Artist artist) async {
    final response = await http.post(
      Uri.parse("$_url/artist"),
      headers: {"auth": _token},
      body: jsonEncode(
        artist.toJson(),
      ),
    );
    if (response.statusCode == 200) {
      _token = response.body;
      return true;
    }
    return false;
  }

  static Future<List<Artist>> getArtist() async {
    final response = await http.get(
      Uri.parse("$_url/artist"),
      headers: {
        "auth": _token,
      },
    );
    Iterable l = jsonDecode(response.body);
    return List<Artist>.from(l.map((model) => Artist.fromJson(model)));
  }
}
