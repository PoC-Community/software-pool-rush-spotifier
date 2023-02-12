<<<<<<< HEAD
import 'package:get/state_manager.dart';
import 'package:myapp/models/artist.dart';
import 'package:myapp/models/music.dart';
import 'package:myapp/models/playlist.dart';

enum Genre {
  pop,
  rock,
  rap,
  classic,
  hiphop,
  jazz,
}

class User extends GetxController {
  User({
    required this.id,
    required this.email,
    required this.username,
    required this.password,
    required this.genre,
    required this.musicsLiked,
    required this.artistsLiked,
    required this.playlistLiked,
  });
  String id;
  String email;
  String username;
  String password;
  List<Music> musicsLiked;
  List<Artist> artistsLiked;
  List<Playlists> playlistLiked;
  List<Genre> genre;

  void setuserinfo(String mail, String pass) {
    email = mail;
    password = pass;
  }
=======
class User {
  User({
    required this.id,
    required this.email,
  });
  String id;
  String email;
>>>>>>> origin/main
}
