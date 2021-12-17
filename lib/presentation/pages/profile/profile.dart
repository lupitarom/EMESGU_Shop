import 'package:enseguida_shop/presentation/providers/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => PerfilBody();
}

class PerfilBody extends State<Profile> {
  final double coverHeight = 280;
  final double profileHeight = 144;
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Perfil',
          style: TextStyle(
            //color: Color(0xFF979797),
            color: Color(0xFFf4cb4d),
            fontSize: 32,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.italic,
            letterSpacing: .8,
            height: 1,
          ),
        ),
        //centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.logout_sharp,
            color: Colors.black,
          ),
          onPressed: () {
            final provider =
                Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.logout();
          },
        ),
        //backgroundColor: Colors.purple,
        flexibleSpace: Container(
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[buildtop(user), buildContent(user)],
      ),
    );
  }

  Widget buildtop(User user) {
    final bottom = profileHeight / 2;
    final top = coverHeight - profileHeight / 2;
    return Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: bottom),
            child: builderCoverImage(),
          ),
          Positioned(
            top: top,
            child: builderProfileImage(user),
          ),
        ]);
  }

  Widget buildContent(User user) => Column(
        children: [
          const SizedBox(height: 32),
          Text('Nombre: ' + user.displayName!,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(
            height: 16,
          ),
          Text('Correo: ' + user.email!,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(
            height: 16,
          ),
          const Divider(),
          const SizedBox(height: 16),
        ],
      );

  Widget builderCoverImage() => Container(
      color: Colors.lightBlue[50],
      child: Image.asset(
        'assets/images/logo 2.jpeg',
        width: double.infinity,
        height: coverHeight,
        fit: BoxFit.cover,
      ));

  Widget builderProfileImage(User user) {
    var url = user.photoURL;
    return CircleAvatar(
      radius: profileHeight / 2,
      backgroundColor: Colors.grey.shade800,
      backgroundImage: user.photoURL == null
          ? const AssetImage('assets/images/usuario.png')
          : NetworkImage(url!) as ImageProvider,
    );
  }
}
