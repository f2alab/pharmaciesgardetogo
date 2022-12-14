import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:pharma6/activites/maps_activity.dart';
import 'package:pharma6/utilitaires/activities_transitions.dart';
import 'package:pharma6/utilitaires/mes_animations.dart';
import 'package:pharma6/utilitaires/mes_couleurs.dart';
import 'package:pharma6/utilitaires/mes_dimensions.dart';
import 'package:pharma6/utilitaires/mes_methodes.dart';
import 'package:shared_preferences/shared_preferences.dart';


// ignore: must_be_immutable
class PharmaciesGardeItemWidget extends StatefulWidget
{
  final String pharmaNOM;
  final String pharmaLOC;
  final String pharmaCONT1;
  final String pharmaCONT2;

  //const PharmaciesItemWidget({Key? key}) : super(key: key);
  const PharmaciesGardeItemWidget({Key? key, required this.pharmaNOM, required this.pharmaLOC, required this.pharmaCONT1, required this.pharmaCONT2,}) : super(key: key);
  @override
  State<PharmaciesGardeItemWidget> createState() => _PharmaciesGardeItemWidgetState();
}

class _PharmaciesGardeItemWidgetState extends State<PharmaciesGardeItemWidget>
{
  bool animated = false;

  @override
  void initState() {
    super.initState();
    Timer repeter = Timer.periodic(const Duration(seconds: 1), (timer)
    {
      animated =!animated;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context)
  {
    const double elevation = 5;
    return MesAnimations.MaSlideAnimHorizontal(
        offsetX: 50,
        childWidget:  Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35),
            ),
            child: Column(
              children: [
                Container(
                  padding:
                  const EdgeInsets.symmetric(vertical: 1, horizontal: 2),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35)),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF1A8D77),
                        Color(0xFF0E893B),
                        Color(0xFF04146A),
                      ],
                    ),
                  ),
                  child: ListTile(
                      horizontalTitleGap: 0,
                      leading: const SizedBox(
                        height: 30,
                        width: 30,
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.account_balance,
                              color:  Color(0xFF056629),
                            )),
                      ),
                      title: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: MesDimensions.paddingVerticalCardTitre, horizontal: MesDimensions.paddingHorizontalCardTitre),
                          child: Center(
                            child: Text(
                              widget.pharmaNOM,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Color(0xFF056629)),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      trailing: GardeTexte()/*AnimatedDefaultTextStyle(
                 duration: const Duration(seconds: 1),
                 curve: Curves.elasticOut,
                 style: animated
                     ? const TextStyle(
                   color: Colors.amber,
                   fontSize: 8,
                   fontWeight: FontWeight.bold,
                 )
                     : const TextStyle(
                   color: Colors.red,
                   fontWeight: FontWeight.w100,
                   fontSize: 8,
                 ),
                 child: const Text(
                     "Garde",
                   ),
               ),*/

                  ),
                ),
                SizedBox(
                  height: 5,
                  child: Container(
                    color: const Color(0xFF76065F),
                  ),
                ),
                const SizedBox(height: 5,),
                ListTile(
                  title: const Text(
                    "COORDONN??ES",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.purple),
                  ),
                  trailing: Material(
                      elevation: elevation,
                      color: Colors.white,
                      shape: const CircleBorder(),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: InkWell(
                        splashColor: Colors.black26,
                        onTap: (){
                          Navigator.push(context, TransitionDroiteGauche(const MapsActivity()));
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.place, color: MesCouleurs.vert),
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 3, horizontal: 15),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                            widget.pharmaLOC,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Colors.black),
                          )),
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  height: 1,
                  child: Container(
                    color: const Color(0xFF0E893B),
                  ),
                ),
                const SizedBox(height: 5,),
                ListTile(
                  title: const Text(
                    "CONTACTS",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.purple),
                  ),
                  trailing: Material(
                      elevation: elevation,
                      color: Colors.white,
                      shape: const CircleBorder(),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: InkWell(
                        splashColor: Colors.black26,
                        onTap: (){MesMethodes.appelDialog(context, widget.pharmaNOM, "+228 ${widget.pharmaCONT1}", "+228 ${widget.pharmaCONT2}");},
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.phone, color: MesCouleurs.vert),
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 3, horizontal: 15),
                  child: Row(
                    children: [
                      Text(
                        "+228 ${widget.pharmaCONT1}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible:
                  widget.pharmaCONT2 == "" ? false : true,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 3, horizontal: 15),
                    child: Row(
                      children: [
                        Text(
                          "+228 ${widget.pharmaCONT2}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 20, left: 3, right: 3),
                  child: SizedBox(
                    height: 1,
                    child: Container(
                      color: const Color(0xFF76065F),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );

  }

  //ENREGISTRER DANS FAVORIES

  //APPEL DIALOG
  void appelDialog(String nomPharma, String numero1, String numero2)
  {
    String message1 = "Elle est joignable aux num??ros ci-apr??s. Cliquez le bouton ?? droite des num??ros pour effectuer un appel au num??ro correspondant.";
    String message2 = "Elle est joignable au num??ro ci-apr??s. Cliquez le bouton ?? droite du num??ro pour effectuer un appel.";
    const double elevation = 5;

    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35)),
        ),

        builder: (context)=> Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35)),

          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35)),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF1A8D77),
                      Color(0xFF0E893B),
                      Color(0xFF04146A),
                    ],
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "CONTACTER LA $nomPharma ?",
                      style: const TextStyle(
                          fontFamily: "CenturyGothicBold",
                          fontSize: 15,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),

                  ],
                ),
                //color: const Color(0xFF76065F),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  textAlign: TextAlign.center,
                  numero2=="+228 "?message2:message1,
                  style: const TextStyle(
                    fontSize: 14,
                    fontFamily: "CenturyGothicBold",
                    color: Colors.black,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  numero1,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                trailing: Material(
                    elevation: elevation,
                    color: Colors.white,
                    shape: const CircleBorder(),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: InkWell(
                      splashColor: Colors.black26,
                      onTap: (){},
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.phone, color: MesCouleurs.vert),
                      ),
                    )
                ),
              ),
              Visibility(
                visible: numero2=="+228 "?false:true,
                child: ListTile(
                  title: Text(
                    numero2,
                    style: const TextStyle(
                      fontSize: 14,
                      fontFamily: "CenturyGothicBold",
                      color: Colors.black,
                    ),
                  ),
                  trailing: Material(
                      elevation: elevation,
                      color: Colors.white,
                      shape: const CircleBorder(),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: InkWell(
                        splashColor: Colors.black26,
                        onTap: (){},
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.phone, color: MesCouleurs.vert),
                        ),
                      )
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
          //color: const Color(0xFF76065F),
        )
    );
  }

  // ignore: non_constant_identifier_names
  Widget GardeTexte()
  {
    return DefaultTextStyle(
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 8,
        color: Colors.amber,
      ),
      child: AnimatedTextKit(
        pause: const Duration(milliseconds: 100),
        repeatForever: true,
        animatedTexts: [
          FlickerAnimatedText('Garde'),
        ],
        onTap: () {
        },
      ),
    );
  }

  void monSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.settings),
              Text(message, style: const TextStyle(fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white))
            ],
          ),
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.blueGrey,
        )
    );
  }
}
