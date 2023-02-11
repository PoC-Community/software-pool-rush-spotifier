import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/models/artist.dart';
import 'package:myapp/models/player.dart';
import 'package:myapp/utils/api.dart';

class ArtistList extends StatefulWidget {
  const ArtistList({
    super.key,
    this.scrollDirection = Axis.vertical,
  });
  final Axis scrollDirection;

  @override
  State<ArtistList> createState() => _ArtistListState();
}

class _ArtistListState extends State<ArtistList> {
  Future<List<Artist>>? list;
  @override
  void initState() {
    super.initState();
    list = Api.getArtist();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Artist>>(
      future: list,
      builder: (BuildContext context, AsyncSnapshot<List<Artist>> snapshtot) {
        if (snapshtot.hasData) {
          return ListView.builder(
            itemCount: snapshtot.data!.length,
            itemBuilder: (context, index) {
              return _InfoContainer(
                name: snapshtot.data![index].name,
                image: snapshtot.data![index].photoUrl,
                type: snapshtot.data![index].musicGender,
                artist: snapshtot.data![index].name,
                isDirection: widget.scrollDirection == Axis.vertical,
              );
            },
            scrollDirection: widget.scrollDirection,
          );
        } else {
          return CircularProgressIndicator(
            color: Theme.of(context).primaryColor,
          );
        }
      },
    );
  }
}

class _InfoContainer extends GetView<PlayerController> {
  const _InfoContainer({
    required this.name,
    required this.image,
    required this.type,
    required this.isDirection,
    this.artist,
  });

  final String name;
  final String image;
  final String type;
  final String? artist;
  final bool isDirection;

  @override
  Widget build(BuildContext context) {
    if (Uri.parse(image).isAbsolute) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextButton(
          style: const ButtonStyle(
            padding:
                MaterialStatePropertyAll<EdgeInsetsGeometry?>(EdgeInsets.zero),
            overlayColor: MaterialStatePropertyAll<Color>(Colors.transparent),
          ),
          onPressed: () {
            controller.addingPlayer();
            controller.changeMusic(name, type, name, image, artist);
          },
          child: SizedBox(
            height: isDirection ? 50 : null,
            child: isDirection
                ? _DataRow(image: image, name: name, type: type, artist: artist)
                : _DataSquare(image: image, name: name),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}

class _DataSquare extends StatelessWidget {
  const _DataSquare({
    Key? key,
    required this.image,
    required this.name,
  }) : super(key: key);

  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          image,
          width: 150,
          height: 150,
          fit: BoxFit.fill,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          name,
          style: TextStyle(
            color: Theme.of(context).highlightColor,
          ),
        ),
      ],
    );
  }
}

class _DataRow extends StatelessWidget {
  const _DataRow({
    Key? key,
    required this.image,
    required this.name,
    required this.type,
    required this.artist,
  }) : super(key: key);

  final String image;
  final String name;
  final String type;
  final String? artist;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.network(
              image,
              width: 50,
              height: 50,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: Theme.of(context).textTheme.bodyMedium),
                Row(
                  children: [
                    Text("$type ${artist != null ? "• $artist" : ""}"),
                  ],
                )
              ],
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          splashColor: Colors.transparent,
          icon: Icon(
            Icons.settings,
            color: Theme.of(context).unselectedWidgetColor,
          ),
        ),
      ],
    );
  }
}
