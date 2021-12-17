import 'package:enseguida_shop/data/models/ropa.dart';
import 'package:enseguida_shop/presentation/pages/ropa/widgets/ropa_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class AllRopa extends StatelessWidget {
  const AllRopa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          //const SizedBox(height: 50,),
          Container(
            color: Colors.white,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 20, bottom: 20),
            child: Image.asset(
              "assets/images/logo.jpeg",
              height: 80,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: bodegaRopa.length,
              itemBuilder: (context, index) {
                return RopaCard(ropa: bodegaRopa[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
