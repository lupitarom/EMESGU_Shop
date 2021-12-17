import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[400],
      child: const Center(
        child: SpinKitPumpingHeart(
          color: Colors.red,
          size: 50.0,
        ),
      ),
    );
  }
}
