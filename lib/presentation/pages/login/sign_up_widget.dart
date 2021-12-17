import 'package:enseguida_shop/presentation/widgets/correo_signup_button_widget.dart';
import 'package:enseguida_shop/presentation/widgets/google_signup_button_widget.dart';
import 'package:enseguida_shop/presentation/widgets/guest_signup_button.dart';
import 'package:flutter/material.dart';

class SingUpWidget extends StatelessWidget {
  const SingUpWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: ListView(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    "assets/images/logo.jpeg",
                    width: 250,
                    height: 200,
                  ),
                  const Text(
                    'La mejor ropa',
                    style: TextStyle(
                      //color: Color(0xFF979797),
                      color: Color(0xfff4cb4d),
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic,
                      letterSpacing: .8,
                      height: 1,
                    ),
                  ),
                  const Text(
                    'a un ¡click!',
                    style: TextStyle(
                      //color: Color(0xFF979797),
                      color: Colors.black54,
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic,
                      letterSpacing: .8,
                      height: 1,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    margin: const EdgeInsets.all(5.0),
                    child: Column(
                      children: const [
                        GoogleButtonWidget(),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    margin: const EdgeInsets.all(5.0),
                    child: Column(
                      children: const [
                        CorreoButtonWidget(),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    margin: const EdgeInsets.all(5.0),
                    child: Column(
                      children: const [
                        GuestInicio(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      );
}
