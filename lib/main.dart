import 'package:enseguida_shop/presentation/providers/email_signin.dart';
import 'package:enseguida_shop/presentation/providers/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'presentation/pages/login/on_board.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => GoogleSignInProvider()),
            ChangeNotifierProvider(create: (context) => EmailSignInProvider()),
          ],
          child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Material App',
            home: OnBoard(),
          ));
}
