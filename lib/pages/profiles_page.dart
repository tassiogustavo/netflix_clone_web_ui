import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/models/profile_img_model.dart';
import 'package:netflix_clone_ui/pages/catalog_page.dart';

class ProfilesPage extends StatelessWidget {
  const ProfilesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(20, 20, 20, 1),
      body: Column(
        children: [
          buildAppBar(),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildButtomWhosWhatching(),
              const SizedBox(
                height: 25,
              ),
              Wrap(
                alignment: WrapAlignment.center,
                direction: Axis.horizontal,
                spacing: 10.0,
                runSpacing: 20.0,
                children: [
                  buildProfileAvatar(
                      'Andréia', profileImaData[0].urlProfileImg, context, 0),
                  buildProfileAvatar(
                      'Tassio', profileImaData[1].urlProfileImg, context, 1),
                  buildProfileAvatar(
                      'Ilza', profileImaData[2].urlProfileImg, context, 2),
                  buildProfileAvatar(
                      'Marcelo', profileImaData[3].urlProfileImg, context, 3),
                  buildProfileAvatar(
                      'Túlio', profileImaData[4].urlProfileImg, context, 4),
                ],
              ),
              const SizedBox(
                height: 45,
              ),
              buildBottomManageProfile()
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget buildAppBar() {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(7, 7, 7, 1),
            Color.fromRGBO(20, 20, 20, 1),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.2, 0.6],
        ),
        color: Colors.black,
      ),
      child: const Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: Text(
            'NETFLIX',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }

  Text buildButtomWhosWhatching() {
    return const Text(
      'Quem está assistindo?',
      style: TextStyle(
        fontSize: 30,
        color: Colors.white,
      ),
    );
  }

  OutlinedButton buildBottomManageProfile() {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        elevation: 0,
        primary: Colors.grey,
        backgroundColor: Colors.transparent,
        side: const BorderSide(color: Colors.grey, width: 1),
      ),
      onPressed: () {},
      child: const Text('GERENCIAR PERFIS'),
    );
  }

  Widget buildProfileAvatar(
      String name, String img, BuildContext context, int indexImg) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 100,
          height: 100,
          margin: const EdgeInsets.only(left: 12, right: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          foregroundDecoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black12,
                Colors.transparent,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.2, 0.4],
            ),
          ),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CatalogPage(
                    indexImg: indexImg,
                  ),
                ),
              );
            },
            child: Image.network(
              img,
              fit: BoxFit.cover,
              scale: 1,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          name,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 15,
          ),
        )
      ],
    );
  }
}
