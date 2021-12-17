import 'dart:math';

import 'package:enseguida_shop/data/models/ropadb.dart';
import 'package:enseguida_shop/db/fav_db.dart';
import 'package:enseguida_shop/presentation/pages/liked/iconos_fav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class Liked extends StatefulWidget {
  const Liked({Key? key}) : super(key: key);

  @override
  State<Liked> createState() => _LikedState();
}

class _LikedState extends State<Liked> {
  final FavoHelper _favHelper = FavoHelper();
  Future<List<Ropaas>>? _ropas;
  List<Ropaas>? _currentropas;

  @override
  void initState() {
    _favHelper.initializeDatabase().then((value) {
      load();
    });
    super.initState();
  }

  void load() {
    _ropas = _favHelper.getRopa();
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        alignment: Alignment.topCenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 13,
            ),
            Container(
              color: Colors.white,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              child: Image.asset(
                "assets/images/logo.jpeg",
                height: 100,
              ),
            ),
            Expanded(
                child: FutureBuilder<List<Ropaas>>(
              future: _ropas,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  _currentropas = snapshot.data!;
                  return ListView(
                    children: snapshot.data!.map<Widget>((ropac) {
                      return Container(
                        margin: const EdgeInsets.only(top: 20, bottom: 20),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        height: 350,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          color: Color(ropac.color),
                        ),
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: <Widget>[
                            Positioned(
                              top: 5,
                              child: Transform.rotate(
                                angle: -pi / 180,
                                child: SizedBox(
                                    width: 200,
                                    height: 200,
                                    child: Image.asset(ropac.images)),
                              ),
                            ),
                            Positioned(
                              bottom: 70,
                              child: Text(
                                ropac.model,
                                style: const TextStyle(
                                  fontSize: 16,
                                  letterSpacing: 1.2,
                                  wordSpacing: 1.5,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 20,
                              child: Column(
                                children: [
                                  Text(
                                    ropac.oldPrice.toString(),
                                    style: const TextStyle(
                                      color: Colors.red,
                                      fontSize: 18,
                                      letterSpacing: 1.2,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                  Text(
                                    ropac.currentPrice.toString(),
                                    style: const TextStyle(
                                        fontSize: 22,
                                        letterSpacing: 1.2,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ],
                              ),
                            ),
                            Iconos(
                              mid: ropac.id!,
                              modelName: ropac.model,
                              modelPriceLow: ropac.currentPrice,
                              modelPrice: ropac.oldPrice,
                              modelColor: ropac.color,
                              modelImage: ropac.images,
                            ),
                          ],
                        ),
                      );
                    }).followedBy([
                      if (_currentropas!.length < 20)
                        Container(
                          child: const Center(
                              child: Text(
                            'Sigue dando likes <3',
                            style: TextStyle(color: Colors.black),
                          )),
                        )
                      else
                        const Center(
                            child: Text(
                          'Limite de favoritos!',
                          style: TextStyle(color: Colors.black),
                        )),
                    ]).toList(),
                  );
                }
                return const Center(
                  child: Text(
                    'Cargando..',
                    style: TextStyle(color: Colors.black),
                  ),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
