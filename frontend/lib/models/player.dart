import 'package:get/get.dart';
import 'package:myapp/models/music.dart';
import 'package:myapp/models/user.dart';

class PlayerController extends GetxController {
  RxBool isPlaying = false.obs;
  RxBool playerUp = false.obs;
  Rx<String> name = "".obs;
  Rx<String> url = "".obs;
  Rx<String> artistId = "".obs;
  Rx<String> artistName = "".obs;
  Rx<String> musicGender = "".obs;
  RxBool isFav = false.obs;

  void addingPlayer() {
    playerUp.value = true;
  }

  void playing() {
    isPlaying.value = !isPlaying.value;
  }

  void favoriting() {
    User user = Get.find<User>();
    isFav.value = !isFav.value;
    if (isFav.value) {
      user.musicsLiked.add(
        Music(
          name: name.value,
          rating: 0,
          url: url.value,
          artistId: artistId.value,
          musicGender: musicGender.value,
        ),
      );
    } else {
      user.musicsLiked.removeWhere(
        (element) =>
            element.name == name.value && element.artistId == artistId.value,
      );
    }
  }

  void changeMusic(
      String musicName, String genre, String id, String image, String? artist) {
    User user = Get.find<User>();
    name.value = musicName;
    musicGender.value = genre;
    artistId.value = id;
    url.value = image;
    artistName.value = artist ?? "";
    for (Music element in user.musicsLiked) {
      if (element.name == musicName && element.artistId == id) {
        isFav.value = true;
        return;
      }
    }
    isFav.value = false;
  }
}
