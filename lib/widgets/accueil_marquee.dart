import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:pharma6/utilitaires/mes_couleurs.dart';

class AccueilMarquee extends StatelessWidget
{
  final String texte;
  const AccueilMarquee({Key? key, required this.texte}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 4),
      child: Marquee(
        text: texte,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          fontFamily: "SeaSidero",
          color: vert,
        ),
        crossAxisAlignment: CrossAxisAlignment.center,
        blankSpace: 20.0,
        velocity: 25,
        startPadding: 10.0,
      ),
    );
  }
}
