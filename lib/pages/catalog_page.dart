import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/models/movie_model.dart';
import 'package:netflix_clone_ui/widgets/app_bar_top_widget.dart';
import 'package:video_player/video_player.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({Key? key,required this.indexImg,}) : super(key: key);
  final int indexImg;

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> with TickerProviderStateMixin {
  int opacity = 0;
  VideoPlayerController? playerController;
  VoidCallback? listener;

  AnimationController? _controller;

  @override
  void dispose() {
    _controller!.dispose();
    playerController!.dispose();
    super.dispose();
  }

  @override
  // ignore: must_call_super
  void initState() {
    playerController =
        VideoPlayerController.asset(backgroundMovideData[0].moviePatch)
          ..initialize().then((value) {
            playerController!.setLooping(true);
            playerController!.play();
            setState(() {});
          });

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        body: playerController!.value.isInitialized
            ? Stack(
                children: <Widget>[
                  NotificationListener(
                    onNotification: (ScrollNotification scrollNotification) {
                      if ((scrollNotification.metrics.pixels * 0.9) <= 254) {
                        opacity =
                            (scrollNotification.metrics.pixels * 0.9).toInt();
                      } else {
                        opacity = 254;
                      }
                      setState(() {});
                      return false;
                    },
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: height * 0.95,
                            child: Stack(
                              children: [
                                buildMovieBackgroud(),
                                buildInfosMovie(),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Container(
                                    width: double.infinity,
                                    height: 40,
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.black54,
                                          Colors.transparent,
                                        ],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                      ),
                                    ),
                                    child: buildTextNameList('New Release', 10),
                                  ),
                                )
                              ],
                            ),
                          ),
                          buildHorizontalListMovies(newReleaseMovieData),
                          buildTextNameList('Continue Watching', 20),
                          buildHorizontalListMovies(continueWatchingMovieData),
                          buildTextNameList('Trending Now', 20),
                          buildHorizontalListMovies(trendingNowMovieData),
                          const SizedBox(height: 20,),
                        ],
                      ),
                    ),
                  ),
                  AppBarToWidget(
                    opacity: opacity,
                    indexImg: widget.indexImg,
                  ),
                ],
              )
            : Container(),
      ),
    );
  }

  Container buildHorizontalListMovies(List<MovieModel> list) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      height: 100,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        scrollDirection: Axis.horizontal,
        controller: ScrollController(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            width: 190,
            height: 130,
            margin: const EdgeInsets.only(right: 3),
            color: Colors.transparent,
            child: Stack(
              children: [
                InkWell(
                  onTap: (){},
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(2),
                    child: SizedBox(
                      width: 190,
                      height: 130,
                      child: Image.network(
                        list[index].moviePicture,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 17,
                  height: 20,
                  padding: const EdgeInsets.only(top: 7),
                  child: Image.network(
                    'https://cdn-icons-png.flaticon.com/512/732/732228.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Container buildTextNameList(String text, double topMargin) {
    return Container(
      margin: EdgeInsets.only(right: 30, left: 30, bottom: 7, top: topMargin),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 15,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget buildInfosMovie() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 25,
                  height: 25,
                  child: Image.network(
                      'https://cdn-icons-png.flaticon.com/512/732/732228.png'),
                ),
                const Text(
                  'FILMES',
                  style: TextStyle(
                      letterSpacing: 5, fontSize: 10, color: Colors.white70),
                )
              ],
            ),
            const SizedBox(
              height: 7,
            ),
            SizedBox(
              width: 350,
              child: Image.asset('assets/interstellar.png'),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.play_arrow,
                    size: 20.0,
                  ),
                  label: const Text(
                    'Play',
                    style: TextStyle(fontSize: 11),
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: const Color.fromARGB(101, 71, 71, 71),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add,
                    size: 20.0,
                  ),
                  label: const Text(
                    'My List',
                    style: TextStyle(fontSize: 11),
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: const Color.fromARGB(101, 71, 71, 71),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 350,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Watch Now',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Astronauts receives the mission to verify possible planets to receive the world population, enabling the continuation of the species.',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                const Spacer(),
                Container(
                  height: 20,
                  width: 1.5,
                  color: Colors.white,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 20,
                  width: 70,
                  color: const Color.fromARGB(101, 71, 71, 71),
                  child: const Text(
                    'TV-MA',
                    style: TextStyle(fontSize: 12, color: Colors.white70),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  SizedBox buildMovieBackgroud() {
    return SizedBox.expand(
      child: FittedBox(
        fit: BoxFit.cover,
        child: SizedBox(
          width: playerController!.value.size.width,
          height: playerController!.value.size.height * 0.5,
          child: VideoPlayer(
            playerController!,
          ),
        ),
      ),
    );
  }
}
