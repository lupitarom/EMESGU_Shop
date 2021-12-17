import 'dart:math';

import 'package:enseguida_shop/data/models/ropadb.dart';
import 'package:enseguida_shop/db/cart_db.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

import 'iconos_cart.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartHelper _cartHelper = CartHelper();
  Future<List<Ropaas>>? _batas;
  List<Ropaas>? _currentbatas;

  @override
  void initState() {
    _cartHelper.initializeDatabase().then((value) {
      load();
    });
    super.initState();
  }

  void load() {
    _batas = _cartHelper.getRopa();
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
                width: 100,
              ),
            ),
            Expanded(
                child: FutureBuilder<List<Ropaas>>(
              future: _batas,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  _currentbatas = snapshot.data!;
                  return ListView(
                    children: snapshot.data!.map<Widget>((bata) {
                      return Container(
                        margin: const EdgeInsets.only(top: 20, bottom: 20),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        height: 350,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          color: Color(bata.color),
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
                                    child: Image.asset(bata.images)),
                              ),
                            ),
                            Positioned(
                              bottom: 70,
                              child: Text(
                                bata.model,
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
                                  const Text(
                                    'Compra realizada por: ',
                                    style: TextStyle(
                                        letterSpacing: 1.2,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    bata.oldPrice.toString(),
                                    style: const TextStyle(
                                        fontSize: 22,
                                        letterSpacing: 1.2,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ],
                              ),
                            ),
                            Iconos2(
                                id: bata.id!,
                                modelName: bata.model,
                                modelPriceLow: bata.currentPrice.toString()),
                          ],
                        ),
                      );
                    }).followedBy([
                      if (_currentbatas!.length < 20)
                        Container(
                          child: const Center(
                              child: Text(
                            'Sigue comprando <3',
                            style: TextStyle(color: Colors.black),
                          )),
                        )
                      else
                        const Center(
                            child: Text(
                          'Limite de compras!',
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
