import 'package:enseguida_shop/presentation/pages/my_home_guest/my_home.dart';
import 'package:flutter/material.dart';

class GuestInicio extends StatelessWidget {
  const GuestInicio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(4),
        child: ElevatedButton(
          onPressed: () {
            final provider = Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MyHomeGuest()));
          },
          child: const Text(
            'Entrar como invitado',
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
