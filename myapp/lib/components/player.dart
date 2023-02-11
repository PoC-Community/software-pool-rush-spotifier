import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/models/player.dart';

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({super.key});

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  late PlayerController _playerController;
  @override
  void initState() {
    _playerController = Get.find<PlayerController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Obx(
        () {
          if (_playerController.playerUp.value) {
            return Container(
              height: 50,
              color: Theme.of(context).cardColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Obx(
                        () => Image.network(
                          _playerController.url.value,
                          width: 50,
                          height: 50,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(
                            () => Text(_playerController.name.value,
                                style: Theme.of(context).textTheme.bodyMedium),
                          ),
                          Row(
                            children: [
                              Obx(
                                () => Text(
                                    "${_playerController.musicGender.value} ${_playerController.artistId.value != "" ? "• ${_playerController.artistId.value}" : ""}"),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      _playerController.playing();
                    },
                    icon: Obx(
                      () => const Icon(Icons.favorite_outline),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _playerController.playing();
                    },
                    icon: Obx(() => Icon(_playerController.isPlaying.value
                        ? Icons.pause
                        : Icons.play_arrow)),
                  ),
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
