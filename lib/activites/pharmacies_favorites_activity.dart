import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pharma6/utilitaires/mes_couleurs.dart';
import 'package:pharma6/utilitaires/mes_widgets.dart';

class PharmaciesFavoritesActivity extends StatefulWidget
{

  const PharmaciesFavoritesActivity({Key? key}) : super(key: key);

  @override
  State<PharmaciesFavoritesActivity> createState() => _PharmaciesFavoritesActivityState();
}

class _PharmaciesFavoritesActivityState extends State<PharmaciesFavoritesActivity>
{

  Widget titreText = MesWidgets.TitreEtSubtitre(titre: "Pharmacies", subtitre: "Favorites");
  Widget appBarTitre = MesWidgets.TitreEtSubtitre(titre: "Pharmacies", subtitre: "Favorites");
  var rechercheTooltipMessage = "Rechercher Pharmacie";
  Icon iconRecherche = const Icon(Icons.search_rounded, color: Colors.white,);
  bool rechercheEditEsOuvert = false;
  late TextEditingController rechercheEditControler = TextEditingController();
  String time = "";

  @override
  void initState() {
    super.initState();

    Timer mytimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      DateTime timenow = DateTime.now();  //get current date and time
      time = timenow.hour.toString() + ":" + timenow.minute.toString() + ":" + timenow.second.toString();
      setState(() {

      });
    });
  }
  @override
  Widget build(BuildContext context)
  {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(25))
            ),
            leading: MesWidgets.MonBoutonRetour(context),
            title: appBarTitre,
            actions: [
              MesWidgets.MonTooltip(
                message: rechercheTooltipMessage,
                child: IconButton(
                  onPressed: () {
                    rechercheEditEsOuvert==false?
                    setState((){
                      rechercheEditEsOuvert = true;
                      iconRecherche = const Icon(Icons.close, color: Colors.white, size: 20,);
                      rechercheTooltipMessage = "Fermer";
                      appBarTitre = TextField(
                        controller: rechercheEditControler,
                        autofocus: true,
                        cursorColor: MesCouleurs.blanc,
                        onChanged: null,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          focusColor: Colors.white,
                          hintText: "Rechercher pharmacie",
                          hintStyle: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                      );

                    }):  setState(() {
                      if( rechercheEditControler.text.isEmpty){
                        rechercheEditEsOuvert = false;
                        appBarTitre = titreText;
                        iconRecherche=const Icon(Icons.search_rounded, color: Colors.white,);
                        rechercheTooltipMessage = "Rechercher Pharmacie";
                        //listeFiltrees = pharmaListe;
                      }else{
                        rechercheEditControler.clear();
                        //listeFiltrees = pharmaListe;
                        rechercheTooltipMessage = "Fermer";
                      }

                    });

                  },
                  icon: iconRecherche,
                  iconSize: 20,
                ),
              ), // Menu Item 1

              MesWidgets.MonTooltip(
                  message: "Supprimer tout",
                  child: IconButton(
                    icon: const Icon(Icons.delete),
                    iconSize: 20,
                    onPressed: (){}, ),
              ), // Menu Item 2

            ],
        ),
          body: Center(
            child: Text(
              //"PHARMACIES FAVORITES",
              time,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),


      )
    );
  }
}
