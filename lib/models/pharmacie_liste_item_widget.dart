import 'dart:convert';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:pharma6/activites/maps_activity.dart';
import 'package:pharma6/models/pharmacies_liste_model.dart';
import 'package:pharma6/utilitaires/activities_transitions.dart';
import 'package:pharma6/utilitaires/mes_animations.dart';
import 'package:pharma6/utilitaires/mes_couleurs.dart';
import 'package:pharma6/utilitaires/mes_dimensions.dart';
import 'package:pharma6/utilitaires/mes_methodes.dart';
import 'package:shared_preferences/shared_preferences.dart';


// ignore: must_be_immutable
class PharmaciesListeItemWidget extends StatefulWidget
{
  final String pharmaNOM;
  final String pharmaLOC;
  final String pharmaCONT1;
  final String pharmaCONT2;
  bool esFavorie;
  final VoidCallback? supprimer;

  //const PharmaciesItemWidget({Key? key}) : super(key: key);
  PharmaciesListeItemWidget({Key? key, required this.pharmaNOM, required this.pharmaLOC, required this.pharmaCONT1, required this.pharmaCONT2,  required this.esFavorie, this.supprimer}) : super(key: key);


  @override
  State<PharmaciesListeItemWidget> createState() => _PharmaciesListeItemWidgetState();
}

class _PharmaciesListeItemWidgetState extends State<PharmaciesListeItemWidget>
{
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<bool> esFavorie;
  List<PharmaciesListeModels> liste = [];
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  void enregistrerDansFavories()async
  {
    setState(() {
      widget.esFavorie = !widget.esFavorie;
    });
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(widget.pharmaNOM, widget.esFavorie);

    PharmaciesListeModels pharmacie = PharmaciesListeModels(
      pharmaNOM: widget.pharmaNOM,
      pharmaLOC: widget.pharmaLOC,
      pharmaCONT1: widget.pharmaCONT1,
      pharmaCONT2: widget.pharmaCONT2,
      esFavorie: widget.esFavorie,
    );
    liste.add(pharmacie);
    var encodageListe = jsonEncode(liste);
  }


  void enleverDansFavories(String nomPharma)async
  {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(nomPharma);
    setState(() {

    });
    widget.supprimer;

  }
  void souvenirFavories()async
  {
    final prefs = await SharedPreferences.getInstance();
    var restore = prefs.getBool(widget.pharmaNOM);
    if(mounted){
      setState(() {
        widget.esFavorie = restore!;
      });
    }

  }

  @override
  void initState()
  {
    super.initState();

    //souvenirFavories();
  }

  @override
  Widget build(BuildContext context)
  {
    souvenirFavories();
    const double elevation = 5;
    return MesAnimations.MaSlideAnimHorizontal(
      offsetX: 60,
      duration: 1,
      childWidget: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Card(
          elevation: 10,
          clipBehavior: Clip.antiAliasWithSaveLayer,
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
                    clipBehavior: Clip.antiAliasWithSaveLayer,
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
                 trailing: InkResponse(
                   splashColor: Colors.greenAccent,
                   radius: 30,
                   child: Icon(
                     widget.esFavorie==false?Icons.favorite_border: Icons.favorite,
                     color: widget.esFavorie==false?Colors.white: Colors.amberAccent,
                   ),
                   onTap: ()
                   {
                     enregistrerDansFavories();
                   },
                 ),
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
                      onTap: () {
                        mapsActivity();
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
      ),
    );
  }

  mapsActivity()async{
    AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
    if(androidInfo.version.sdkInt>=20){
      Navigator.push(context, TransitionDroiteGauche(const MapsActivity()));
    }else{
      monSnackBar("Pas support??!!");
    }
  }

  //ENREGISTRER DANS FAVORIS
  ajouterDansFavories() async
  {

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
