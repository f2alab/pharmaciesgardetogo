import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pharma6/models/pharmacies_liste_model.dart';
import 'package:pharma6/models/pharmacie_liste_item_widget.dart';
import 'package:pharma6/utilitaires/mes_couleurs.dart';
import 'package:pharma6/utilitaires/mes_listes.dart';
import 'package:pharma6/utilitaires/mes_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListePharmaciesKara extends StatefulWidget {
  const ListePharmaciesKara({Key? key}) : super(key: key);

  @override
  State<ListePharmaciesKara> createState() => ListePharmaciesKaraState();
}

class ListePharmaciesKaraState extends State<ListePharmaciesKara> with ChangeNotifier {

  List<PharmaciesListeModels> pharmaListe = MesListes.karaListe();
  List<PharmaciesListeModels> listeFiltrees = [];
  bool isChecked = false;
  Widget titreText = const Text(
    "Mes Pharmacies", style: TextStyle(color: Colors.white, fontSize: 14),);
  Widget appBarTitre = const Text(
    "Mes Pharmacies", style: TextStyle(color: Colors.white, fontSize: 14),);
  var rechercheTooltip = "Recherche";
  Icon iconRecherche = const Icon(Icons.search_rounded, color: Colors.white,);
  bool rechercheEditEsOuvert = false;

  @override
  void initState() {
    listeFiltrees = pharmaListe;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        //MARCHE AVEC recherche() et ajouter listeFiltrees = pharmaListe dans initState
        listeFiltrees.isNotEmpty ? maListView(listeFiltrees) :
        const Center(
          child: Text(
              "Pas de correspondance!",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: MesCouleurs.vert)
          ),
        )
      /* //MARCHE AVEC maRecherche()
     listeFiltrees.isEmpty? maListView(pharmaListe):
     const Center(
       child: Text(
           "Pas de correspondance!",
           style: TextStyle(
               fontSize: 20,
               fontWeight: FontWeight.bold,
               color: MesCouleurs.vert)),)*/
    );
  }

  //LISTVIEW
  Widget maListView(List<PharmaciesListeModels> liste) {
    return MesWidgets.MaScrollBarListe(
        context: context,
        child: ListView.builder(
            key: const PageStorageKey<String>("pharma_liste_kara"),
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            padding: const EdgeInsets.all(10),
            itemCount: liste.length,
            itemBuilder: (BuildContext context, int index) {
              liste.sort((a, b) => a.pharmaNOM.compareTo(b.pharmaNOM));
              //souvenirFavories(liste[index].pharmaNOM, liste[index].esFavorie);
              return PharmaciesListeItemWidget(
                  pharmaNOM: liste[index].pharmaNOM,
                  pharmaLOC: liste[index].pharmaLOC,
                  pharmaCONT1: liste[index].pharmaCONT1,
                  pharmaCONT2: liste[index].pharmaCONT2,
                  esFavorie: liste[index].esFavorie);
            }));
  }

  //RECHERCHE
  recherchePharmacie(String texteRecherche) {
    List<PharmaciesListeModels> resultatRecherche = [];
    if (texteRecherche.isEmpty) {
      resultatRecherche = pharmaListe;
    }
    resultatRecherche = pharmaListe.where((pharmacie) {
      final nomPharma = pharmacie.pharmaNOM.toLowerCase();
      final locPharma = pharmacie.pharmaLOC.toLowerCase();
      final texteSaisi = texteRecherche.toLowerCase();
      return nomPharma.contains(texteSaisi) || locPharma.contains(texteSaisi);
    }).toList();
    setState(() {
      listeFiltrees = resultatRecherche;
    });
    /*final resultat = pharmaListe.where((pharmacie)
    {
      final nomPharma = pharmacie.pharmaNOM.toLowerCase();
      final locPharma = pharmacie.pharmaLOC.toLowerCase();
      final texteSaisi = texteRecherche.toLowerCase();
      return nomPharma.contains(texteSaisi) || locPharma.contains(texteSaisi);
    }).toList();
    setState(() {
      pharmaListe = resultat;
    });*/
  }

  maRecherche(String texteRecherche) {
    listeFiltrees.clear();
    if (texteRecherche.isEmpty) {
      setState(() {
        return;
      });
    }
    for (var pharmacie in pharmaListe) {
      if (pharmacie.pharmaNOM.toLowerCase().contains(
          texteRecherche.toLowerCase())
          || pharmacie.pharmaLOC.toLowerCase().contains(
              texteRecherche.toLowerCase())) {
        listeFiltrees.add(pharmacie);
      }
    }
    setState(() {});
  }

  sauvegarderListe() async
  {
    final prefs = await SharedPreferences.getInstance();
    //var liste = json.encode(pharmaListe);
    var map = {
      "pharmaNOM": "NOM",
      "pharmaLOC": "LOC",
      "pharmaCONT1": "CONT1",
      "pharmaCONT2": "CONT2"
    };
    var mJson = json.encode(map);
    prefs.setString("pharma_garde_lome", mJson);
    print(mJson);
  }

  //SOUVENIR FAVORIE
  souvenirFavories(String nomPharma, bool? esFavorie) async
  {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      esFavorie = prefs.getBool(nomPharma);
    });
  }

  void monSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Icon(Icons.settings),
              Text("MonSnack", style: TextStyle(fontSize: 15,
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
