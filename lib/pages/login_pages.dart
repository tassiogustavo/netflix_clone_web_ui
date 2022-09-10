import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/pages/profiles_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          buildBackgroundImage(),
          buildFilterBackgroundImage(),
          SingleChildScrollView(
            child: Column(
              children: [
                buildAppBar(),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      
                      width: 400,
                      color: const Color.fromRGBO(0, 0, 0, 40),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 50,
                          right: 50,
                          left: 50,
                          bottom: 15,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Entrar',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            buildTextFildLogin(
                                'Email ou número do telefone', false),
                            const SizedBox(
                              height: 30,
                            ),
                            buildTextFildLogin('Senha', true),
                            const SizedBox(
                              height: 60,
                            ),
                            bulidEntrarButton(context),
                            buildCheckAndHelp(),
                            const SizedBox(
                              height: 70,
                            ),
                            buildNovoPorAqui(),
                            const SizedBox(
                              height: 12,
                            ),
                            buildRechptch(),
                            const SizedBox(
                              height: 90,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget bulidEntrarButton(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ProfilesPage(),
          ),
        );
      },
      child: Container(
        width: 350,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: const Color.fromRGBO(229, 9, 20, 1),
        ),
        child: const Center(
          child: Text(
            'Entrar',
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget buildRechptch() {
    return RichText(
      text: TextSpan(
        text:
            'Esta página é protegida pelo Google reCAPTCHA para garantir que você não é um robô.',
        style: const TextStyle(color: Colors.grey, fontSize: 11),
        children: [
          TextSpan(
            text: ' Saiba mais.',
            recognizer: TapGestureRecognizer()..onTap = () {},
            style: const TextStyle(color: Colors.blue, fontSize: 11),
          ),
        ],
      ),
    );
  }

  Widget buildNovoPorAqui() {
    return RichText(
      text: TextSpan(
        text: 'Novo por aqui?',
        style: const TextStyle(color: Colors.white38, fontSize: 13),
        children: [
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = () {},
            text: ' Assine agora.',
            style: const TextStyle(color: Colors.white, fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget buildCheckAndHelp() {
    return Container(
      width: 350,
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          SizedBox(
            width: 17,
            height: 17,
            child: Transform.scale(
              scale: 0.85,
              child: Checkbox(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                onChanged: (value) {},
                activeColor: Colors.white38,
                checkColor: Colors.black,
                value: true,
              ),
            ),
          ),
          const SizedBox(
            width: 7,
          ),
          const Text(
            'Lembre-se de mim',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 11,
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: (){},
            child: const Text(
              'Precisa de ajuda?',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 11,
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox buildTextFildLogin(String hint, bool isPassword) {
    return SizedBox(
      height: 45,
      child: Center(
        child: TextField(
          obscureText: isPassword,
          keyboardType: TextInputType.text,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
          decoration: InputDecoration(
            labelText: hint,
            labelStyle: const TextStyle(color: Colors.white54),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2.0),
                borderSide: BorderSide.none),
            filled: true,
            fillColor: Colors.grey.withOpacity(0.1),
            prefixIconColor: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget buildBackgroundImage() {
    return Transform.rotate(
      angle: 0.15,
      origin: const Offset(50.0, 50.0),
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Transform.scale(
          scale: 1.2,
          child: Image.network(
            'https://wallpapercave.com/wp/wp5483697.jpg',
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
          ),
        ),
      ),
    );
  }

  Widget buildFilterBackgroundImage() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color.fromRGBO(20, 20, 20, 95),
    );
  }

  Widget buildAppBar() {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black38,
            Colors.transparent,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.2, 0.6],
        ),
        color: Colors.transparent,
      ),
      child: const Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: Text(
            'NETFLIX',
            style: TextStyle(
              color: Color.fromRGBO(229, 9, 20, 1),
              fontWeight: FontWeight.bold,
              fontSize: 45,
            ),
          ),
        ),
      ),
    );
  }
}
