import 'package:flutter/material.dart';
import 'package:myapp/models/artist.dart';
import 'package:myapp/utils/api.dart';

class ArtistListPage extends StatefulWidget {
  const ArtistListPage({super.key});

  @override
  State<ArtistListPage> createState() => _ArtistListPageState();
}

class _ArtistListPageState extends State<ArtistListPage> {
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
              return const _ArtistInfoContainer();
            },
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

class _ArtistInfoContainer extends StatelessWidget {
  const _ArtistInfoContainer();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Theme.of(context).unselectedWidgetColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("Picture"),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Artist Name"),
                    Text("Nationality"),
                  ],
                ),
              ],
            ),
            const Text("Genre"),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text("0/5"),
            ),
          ],
        ),
      ),
    );
  }
}
