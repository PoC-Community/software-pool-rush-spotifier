import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:myapp/models/playlist.dart';
import 'package:myapp/models/user.dart';

class Library extends GetView<User> {
  const Library({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.playlistLiked.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return TextButton(
            onPressed: () {
              TextEditingController textcontroller = TextEditingController();
              showDialog(
                context: context,
                builder: (context) {
                  return _PopUpAddPlaylist(
                      textcontroller: textcontroller, controller: controller);
                },
              );
            },
            child: Row(
              children: [
                Container(
                  width: 75,
                  height: 75,
                  color: Theme.of(context).unselectedWidgetColor,
                  child: Icon(
                    Icons.add,
                    size: 70,
                    color: Theme.of(context).highlightColor,
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
                Text(
                  "Add Playlist",
                  style: TextStyle(
                    color: Theme.of(context).highlightColor,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                showGeneralDialog(
                  context: context,
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return Scaffold(
                      body: ListView.builder(
                          itemCount:
                              controller.playlistLiked[index - 1].musics.length,
                          itemBuilder: (context, indexMusic) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                color: Theme.of(context).cardColor,
                                child: Row(
                                  children: <Widget>[
                                    Image.network(
                                      controller.playlistLiked[index - 1]
                                          .musics[indexMusic].url,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.fill,
                                    ),
                                    Text(
                                      controller.playlistLiked[index - 1]
                                          .musics[indexMusic].name,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    );
                  },
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Image.network(
                      "",
                      width: 75,
                      height: 75,
                      errorBuilder: (context, error, stackTrace) => Container(),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Text(
                      controller.playlistLiked[index - 1].name,
                      style: TextStyle(
                        color: Theme.of(context).highlightColor,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

class _PopUpAddPlaylist extends StatelessWidget {
  const _PopUpAddPlaylist({
    Key? key,
    required this.textcontroller,
    required this.controller,
  }) : super(key: key);

  final TextEditingController textcontroller;
  final User controller;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Playlist name"),
      content: TextField(
        controller: textcontroller,
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel")),
        TextButton(
            onPressed: () {
              controller.playlistLiked.add(
                Playlists(
                  id: "",
                  name: textcontroller.text,
                  musics: [],
                  userId: "",
                ),
              );
              Navigator.pop(context);
            },
            child: const Text("Confirm"))
      ],
    );
  }
}
