import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double size;

  const Logo({super.key, this.size=30});

  @override
  Widget build(BuildContext context) {
    return Image(image: const AssetImage("assets/logos/faraja-high-resolution-logo-removebg.png"), fit: BoxFit.fill, width: size,);
  }
}