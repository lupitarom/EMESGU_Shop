import 'package:enseguida_shop/presentation/providers/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GoogleButtonWidget extends StatelessWidget {
  const GoogleButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(4),
        child: ElevatedButton(
          onPressed: () {
            final provider =
                Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.googleLogin();
          },
          child: const Text(
            'Iniciar sesión con Google',
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
