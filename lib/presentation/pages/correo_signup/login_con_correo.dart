import 'package:enseguida_shop/presentation/pages/my_home/my_home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'correo_sign_up.dart';

class Correo extends StatelessWidget {
  const Correo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Inicio de sesión con correo',
        theme: ThemeData(primarySwatch: Colors.purple),
        home: const MainPage(title: 'Inicio de sesión con correo'),
      );
}

class MainPage extends StatefulWidget {
  final String title;

  // ignore: use_key_in_widget_constructors
  const MainPage({
    required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              return const MyHome();
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("ERROR"),
              );
            } else {
              return const IniciarSesion2();
            }
          }));
}
