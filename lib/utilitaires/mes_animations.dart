// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:pharma6/utilitaires/mes_couleurs.dart';

class MesAnimations
{

  //SLIDE ou TRANSLATE GAUCHE-DROITE
  static Widget MaSlideAnimHorizontal({required double offsetX, required Widget childWidget, int duration=2})
  {
    return TweenAnimationBuilder<double>(
        tween: Tween(begin: 1, end: 0),
        curve: Curves.fastOutSlowIn,
        duration: Duration(seconds: duration),
        builder: (context, value, child){
          return Transform.translate(
            offset: Offset(value*offsetX, 0),
            child: child,);
        },
        child: childWidget,
    );
  }
  //SLIDE ou TRANSLATE BAS-HAUT
  static Widget MaSlideAnimVertical({required double offsetY, required Widget childWidget, int duration=2})
  {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 1, end: 0),
      curve: Curves.fastOutSlowIn,
      duration: Duration(seconds: duration),
      builder: (context, value, child){
        return Transform.translate(
          offset: Offset(0, value*offsetY),
          child: child,);
      },
      child: childWidget,
    );
  }


  //CHANGEMENT DE COULEUR DOUCE
  static Widget MaColorAnim ({required Color beginColor, required Color endColor, required Widget childWidget})
  {
    return TweenAnimationBuilder(
        tween: Tween<Color>(begin: beginColor, end: endColor),
        duration: const Duration(seconds: 5),
        builder: (context, value, child){
          return Container(
            color: value,
            child: childWidget
          );
        },
    );
  }

  static Widget MaGridAnim({required Widget gridview})
  {
    return TweenAnimationBuilder<double>(
        tween: Tween(begin: 1, end: 0),
        curve: Curves.fastOutSlowIn,
        duration: const Duration(seconds: 2),
        builder: (context, value, child)
        {
          return Transform.translate(
              offset: Offset(0, 60.0*value),
              child: child,
          );
        },
        child: gridview,
    );
  }

  static Widget MaLogoAnim()
  {
    return TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: 100),
        curve: Curves.fastOutSlowIn,
        duration: const Duration(seconds: 2),
        builder: (context, value, child)
        {
          return Icon(
                Icons.account_balance,
                color: MesCouleurs.vert,
                size: value,
          );
        }
    );
  }
}