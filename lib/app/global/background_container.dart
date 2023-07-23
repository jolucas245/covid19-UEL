import 'package:flutter/material.dart';
class BackgroundContainer extends StatelessWidget {
  const BackgroundContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff3C4B74),
            Color(0xff417FA6),
            Color(0xff3FAFD4),
            Color(0xff3B678E),
            Color(0xff3C4B74),
          ]
        )
      ),
    );
  }
}