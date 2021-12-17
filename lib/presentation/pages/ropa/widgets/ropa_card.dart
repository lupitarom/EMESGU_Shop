import 'package:enseguida_shop/data/models/ropa.dart';
import 'package:enseguida_shop/presentation/pages/ropa/widgets/ropa_image.dart';
import 'package:flutter/material.dart';

import 'card_icons.dart';
import 'model_name.dart';
import 'model_price.dart';

class RopaCard extends StatelessWidget {
  final Ropa ropa;
  const RopaCard({Key? key, required this.ropa}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: Color(ropa.color),
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          RopaImage(
            modelImage: ropa.images,
          ),
          ModelName(
            modelName: ropa.model,
          ),
          ModelPrice(
            modelPrice: ropa.oldPrice,
            modelPriceLow: ropa.currentPrice,
          ),
          CardIcons(
            mid: ropa.id,
            modelColor: ropa.color,
            modelImage: ropa.images,
            modelName: ropa.model,
            modelPriceLow: ropa.oldPrice,
            modelPrice: ropa.currentPrice,
          ),
        ],
      ),
    );
  }
}
