import 'package:get/get.dart';

class PlayerController extends GetxController {
  RxBool isPlaying = false.obs;
  RxBool playerUp = false.obs;
  Rx<String> name = "".obs;
  Rx<String> url = "".obs;
  Rx<String> artistId = "".obs;
  Rx<String> artistName = "".obs;
  Rx<String> musicGender = "".obs;

  void addingPlayer() {
    playerUp.value = true;
  }

  void playing() {
    isPlaying.value = !isPlaying.value;
  }

  void changeMusic(
      String musicName, String genre, String id, String image, String? artist) {
    name.value = musicName;
    musicGender.value = genre;
    artistId.value = id;
    url.value = image;
    artistName.value = artist ?? "";
  }
}
