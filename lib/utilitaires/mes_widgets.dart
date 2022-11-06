// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'mes_couleurs.dart';


class MesWidgets
{

  static const double tailleTexteTabBar = 12;

  static List<Widget> villesTabs = [
    Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Icon(Icons.place_outlined),
          Text("LOME", style: TextStyle(fontSize: tailleTexteTabBar)),
        ],
      ),
    ),
    Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Icon(Icons.place_outlined),
          Text("KARA", style: TextStyle(fontSize: tailleTexteTabBar)),
        ],
      ),
    )
  ];

  //CUSTOM TOOLTIP BOUTON RETOUR
  static Widget MonBoutonRetour(BuildContext context)
  {
    return Tooltip(
      message: "Retour",
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        gradient: MesCouleurs.titreGradient,
      ),
      textStyle: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.chevron_left),

      ),
    );
  }

  static const LinearGradient gradient = LinearGradient(
    colors: [
      Color(0xFF1A8D77),
      Color(0xFF0E893B),
      Color(0xFF04146A),
    ],
  );
  //CUSTOM TOOLTIP
  static Widget MonTooltip({required String message, Gradient gradientColor=gradient, required Widget child})
  {
    return Tooltip(
      message: message,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        gradient: gradientColor,
      ),
      textStyle: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      child: child,
    );
  }

  //TITRE ET  SUBTITRE
  static Widget TitreEtSubtitre({required String titre, required String subtitre})
  {
    return  ListTile(
      minVerticalPadding: 10,
      title: Text(titre, style:  const TextStyle(color: Colors.white, fontSize: 14),),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 3),
        child: Text(subtitre, style:  const TextStyle(color: Color(0xFFFFFFFF), fontSize: 13),),
      ),);
  }

  //LISTE AVEC SCROLLBAR
  static Widget MaScrollBarListe(
      {required BuildContext context, required Widget child, Color scrollBarColor=MesCouleurs.vert})
  {
    return Theme(
      data: Theme.of(context).copyWith(
          scrollbarTheme: ScrollbarThemeData(
            thumbColor: MaterialStateProperty.all(scrollBarColor),
            radius: const Radius.circular(10),
            crossAxisMargin: 2,
          )
      ),
      child: Scrollbar(
        trackVisibility: true,
        child: child,
      ),
    );
  }


  static Widget PasDeCorrespondance()
  {
    return AnimatedContainer(
      transform: Matrix4.identity(),
      duration: const Duration(seconds: 4),
      curve: Curves.bounceInOut,
      child: Center(
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
                "Pas de correspondance!",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: MesCouleurs.vert)
            ),
          ),
        ),
      ),
    );
  }

  static AppBar PeriodeGardeCard({required String periodeDeGarde}){
    return AppBar(
      toolbarHeight: 35,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      title: Center(
        child: Card(
          elevation: 3,
          color: MesCouleurs.blanc,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),
          child: SizedBox(
            height: 30,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 4),
              child: Marquee(
                text: periodeDeGarde,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: MesCouleurs.vert,
                ),
                crossAxisAlignment: CrossAxisAlignment.center,
                blankSpace: 20.0,
                velocity: 25,
                startPadding: 10.0,
              ),
            ),
          ),
        ),
        /*Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child:  Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
              periodeDeGarde,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: MesCouleurs.vert)
          ),
        ),
      ),*/
      ),
      /*const Text("PharmaG-Lomé"),*/
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))
      ),

    );

  }
}
