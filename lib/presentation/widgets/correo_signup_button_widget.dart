import 'package:enseguida_shop/presentation/pages/correo_signup/login_con_correo.dart';
import 'package:flutter/material.dart';

class CorreoButtonWidget extends StatelessWidget {
  const CorreoButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(4),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Correo()));
          },
          child: const Text(
            'Iniciar sesión con correo',
            style: TextStyle(
                fontStyle: FontStyle.italic, color: Colors.black, fontSize: 22),
          ),
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(240, 80),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            primary: const Color(0xfff4cb4d),
            onPrimary: Colors.black,
            textStyle: const TextStyle(color: Colors.black),
            shape: const BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
          ),
        ),
      );
}
