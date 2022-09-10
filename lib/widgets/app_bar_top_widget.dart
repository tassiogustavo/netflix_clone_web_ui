import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/models/profile_img_model.dart';

class AppBarToWidget extends StatelessWidget {
  const AppBarToWidget({
    Key? key,
    required this.opacity,
    required this.indexImg,
  }) : super(key: key);

  final int indexImg;

  final int opacity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 57,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black54, Colors.transparent],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 30, left: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 60,
              child: Image.network(
                'https://assets.stickpng.com/images/580b57fcd9996e24bc43c529.png',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            buildTextTopGuide('Home', Colors.white),
            buildTextTopGuide('TV Shows', Colors.white70),
            buildTextTopGuide('Movies', Colors.white70),
            buildTextTopGuide('Recently Added', Colors.white70),
            buildTextTopGuide('My List', Colors.white70),
            const Spacer(),
            buildIconTopGuide(Icons.search, Colors.white),
            buildTextTopGuide('KIDS', Colors.white70),
            buildTextTopGuide('DVD', Colors.white70),
            buildIconTopGuide(Icons.notifications, Colors.white70),
            SizedBox(
              width: 30,
              height: 30,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(3),
                child: Image.network(
                  profileImaData[indexImg].urlProfileImg,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            buildIconTopGuide(Icons.arrow_drop_down_outlined, Colors.white),
          ],
        ),
      ),
    );
  }

  Padding buildIconTopGuide(IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: InkWell(
        onTap: (){},
        child: Icon(
          icon,
          color: color,
          size: 19,
        ),
      ),
    );
  }

  Widget buildTextTopGuide(String text, Color color) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: InkWell(
        onTap: (){},
        child: Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
