import 'package:flutter/material.dart';

class DreamBackground extends StatelessWidget {
  final Widget child;

  const DreamBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(

      height: size.height ,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Position(),
          child,
        ],
      ),
    );
  }
}
class Position extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          child: Image.asset(
            "assets/images/image_4.jpg",
            width: size.width * 0.25,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: Image.asset(
            "assets/images/image_4.jpg",
            width: size.width * 0.2,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Image.asset(
            "assets/images/image_4.jpg",
            width: size.width * 0.2,
          ),
        )
      ],
    );
  }
}
