import 'package:myapp/models/music.dart';

class Playlists {
  Playlists({
    required this.id,
    required this.name,
    required this.musics,
    required this.userId,
  });
  String id;
  String name;
  List<Music> musics;
  String userId;
}
