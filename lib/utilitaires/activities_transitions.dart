import 'package:flutter/material.dart';

//TRANSITION DROITE A GAUCHE
class TransitionDroiteGauche extends PageRouteBuilder
{
  final Widget activity;
  TransitionDroiteGauche(this.activity): super(
      pageBuilder: (context, animation, anotherAnimation) => activity,
      transitionDuration: const Duration(seconds: 1),
      reverseTransitionDuration: const Duration(milliseconds: 500),
      transitionsBuilder: (context, animation, anotherAnimation, child)
      {
        animation = CurvedAnimation(
            parent: animation,
            curve: Curves.fastLinearToSlowEaseIn,
            reverseCurve: Curves.fastOutSlowIn);
        return SlideTransition(
          position: Tween(begin: const Offset(1.0, 0.0), end: const Offset(0.0, 0.0)).animate(animation),
          child: activity,
        );
      }
  );
}