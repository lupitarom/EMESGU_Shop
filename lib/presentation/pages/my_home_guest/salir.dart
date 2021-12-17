import 'package:enseguida_shop/presentation/pages/login/on_board.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class Logout extends StatelessWidget {
  const Logout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          //const SizedBox(height: 50,),
          Container(
            color: Colors.white,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 20, bottom: 20),
            child: Image.asset(
              "assets/images/logo.jpeg",
              height: 60,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                const Text(
                    'Salir de modo invitado, gracias por entrar en modo invitado, te recomendamos crear una cuenta o iniciar sesión con las opciones de nuestro menu, presiona el boton para salir',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        leadingDistribution:
                            TextLeadingDistribution.proportional)),
                const SizedBox(
                  height: 30,
                ),
                IconButton(
                  padding: const EdgeInsets.all(8.0),
                  iconSize: 70,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OnBoard()));
                  },
                  icon: const Icon(Icons.logout_sharp, color: Colors.indigo),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
