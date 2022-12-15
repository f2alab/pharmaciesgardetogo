import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:pharma6/models/pharmacie_liste_item_widget.dart';
import 'package:pharma6/models/pharmacies_liste_model.dart';
import 'package:pharma6/utilitaires/ma_glass.dart';
import 'package:pharma6/utilitaires/mes_couleurs.dart';
import 'package:pharma6/utilitaires/mes_listes.dart';
import 'package:pharma6/utilitaires/mes_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  //final reference = FirebaseDatabase.instance.ref('PERIODE DE GARDE KARA');
  static const LinearGradient personalCoinsGradient = LinearGradient(
    colors: [
      Color(0xFF057D31),
      Color(0xFF25741A),
      Color(0xFF1D890D),
    ],
  );
  static const LinearGradient goldCoinsGradient = LinearGradient(
    colors: [
      Color(0xFFEAC618),
      Color(0xFFECAB05),
      Color(0xFFF1DF10),
    ],
  );

  List<PharmaciesListeModels> favoListe = [];
  List<PharmaciesListeModels> lomePharmaListe = MesListes.lomeListe();
  List<PharmaciesListeModels> karaPharmaListe = MesListes.karaListe();
  late List<PharmaciesListeModels> pharmaListe;


  @override
  void initState() {
    super.initState();
    pharmaListe = lomePharmaListe + karaPharmaListe;
    favoriesListe();

/*
    Timer mytimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      DateTime timenow = DateTime.now();  //get current date and time
      time = timenow.hour.toString() + ":" + timenow.minute.toString() + ":" + timenow.second.toString();
      setState(() {

      });
    });*/
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
          body: favoListe.isEmpty?MesWidgets.PasDeCorrespondance("Pas de pharmacies favorites") :maListView(favoListe)
            /*SingleChildScrollView(
              child: Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: MaGlass(
                        blur: 10,
                        opacity: 0.2,
                        child: SizedBox(
                          width: double.infinity,
                          height: 200,
                        )
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: MaGlass(
                        blur: 15,
                        opacity: 0.5,
                        child: SizedBox(
                          width: double.infinity,
                          height: 200,
                        )
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: MaGlass(
                        blur: 20,
                        opacity: 0.3,
                        child: SizedBox(
                          width: double.infinity,
                          height: 200,
                        )
                    ),
                  ),
                ],
              ),
            ),*/

      )
    );
  }

  favoriesListe() async
  {
    favoListe.clear();
    for (var pharmacie in pharmaListe) {
      final prefs = await SharedPreferences.getInstance();
      var esFavorie = prefs.getBool(pharmacie.pharmaNOM);
      if(esFavorie!=null && esFavorie==true){
        setState(() {
          favoListe.add(pharmacie);
        });
      }
    }
  }
  
  supprimerDeFavoris()
  {
    for(var pharmacie in favoListe){
      setState(() {
        favoListe.remove(pharmacie);
      });
      
    }

    debugPrint("HIIII");
  }

  //LISTE
  Widget maListView (List<PharmaciesListeModels> liste)
  {
    return MesWidgets.MaScrollBarListe(
        context: context,
        child: ListView.builder(
            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            padding: const EdgeInsets.all(10),
            itemCount: liste.length,
            itemBuilder: (BuildContext context, int index) {
              //listeFiltrees.sort();
              liste.sort((a, b) => a.pharmaNOM.compareTo(b.pharmaNOM));
              //souvenirFavories(liste[index].pharmaNOM, liste[index].esFavorie);
              return PharmaciesListeItemWidget(
                  pharmaNOM: liste[index].pharmaNOM,
                  pharmaLOC: liste[index].pharmaLOC,
                  pharmaCONT1: liste[index].pharmaCONT1,
                  pharmaCONT2: liste[index].pharmaCONT2,
                  esFavorie: liste[index].esFavorie,
                  supprimer: ()=>supprimerDeFavoris
              );
            }));
  }

}
