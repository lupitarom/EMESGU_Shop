import 'package:enseguida_shop/presentation/pages/login/sign_up_widget.dart';
import 'package:enseguida_shop/presentation/pages/my_home/my_home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnBoard extends StatelessWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.white,
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
              return const SingUpWidget();
            }
          }));
}
