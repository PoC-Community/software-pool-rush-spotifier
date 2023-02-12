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
          );
        }
      },
    );
  }
}
