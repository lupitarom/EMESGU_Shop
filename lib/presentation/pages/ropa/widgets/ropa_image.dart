import 'dart:math';

import 'package:flutter/material.dart';

class RopaImage extends StatelessWidget {
  final String modelImage;
  const RopaImage({Key? key, required this.modelImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 5,
      child: Transform.rotate(
        angle: -pi / 180,
        child:
            SizedBox(width: 250, height: 250, child: Image.asset(modelImage)),
      ),
    );
  }
}
