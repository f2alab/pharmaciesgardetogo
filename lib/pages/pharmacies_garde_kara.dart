import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:pharma6/models/pharmacie_garde_item_widget.dart';
import 'package:pharma6/models/pharmacies_garde_model.dart';
import 'package:pharma6/utilitaires/mes_couleurs.dart';
import 'package:pharma6/utilitaires/mes_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PharmaciesGardeKara extends StatefulWidget {
  const PharmaciesGardeKara({Key? key}) : super(key: key);

  @override
  State<PharmaciesGardeKara> createState() => PharmaciesGardeKaraState();
}

class PharmaciesGardeKaraState extends State<PharmaciesGardeKara> {
  final firebase = FirebaseDatabase.instance;
  final periodeReference = FirebaseDatabase.instance.ref('PERIODE DE GARDE KARA');
  final reference = FirebaseDatabase.instance.ref('PERIODE DE GARDE KARA');
  final listeReference = FirebaseDatabase.instance.ref('PHARMACIES DE GARDE KARA');
  String texte = "La Période de Garde s'affichera ici";
  List<PharmaciesGardeItemModels> pharmaListe = [];
  List<PharmaciesGardeItemModels> listeFiltrees = [];
  ScrollController scrollController = ScrollController();

  @override
  void initState()
  {
    super.initState();
    listeFiltrees = pharmaListe;
    listePharmaGarde();
  }

  @override
  void dispose()
  {
    super.dispose();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      //extendBodyBehindAppBar: true,
      //appBar: MesWidgets.PeriodeGardeCard(periodeDeGarde: periodeGarde()),
      appBar: AppBar(
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
                child: StreamBuilder(
                    stream: reference.onValue,
                    builder: (context, snapshot){
                      if(snapshot.hasData){
                        return Marquee(
                          text: snapshot.data!.snapshot.value.toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: MesCouleurs.vert,
                          ),
                          crossAxisAlignment: CrossAxisAlignment.center,
                          blankSpace: 20.0,
                          velocity: 25,
                          startPadding: 10.0,
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }),
              ),
            ),
          ),
        ),
        /*const Text("PharmaG-Lomé"),*/
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))
        ),

      ),
      body: pharmaListe.isEmpty?const Center(
          child: Text("Patientez...", style: TextStyle(fontSize: 15, color: Colors.black),)):
          MaListView(listeFiltrees),
    );

  }

  // ignore: non_constant_identifier_names
  Widget MaListView (List<PharmaciesGardeItemModels> liste)
  {
    return MesWidgets.MaScrollBarListe(
        context: context,
        controller: scrollController,
        child: ListView.builder(
            key: const PageStorageKey<String>("pharma_liste_kara"),
            controller: scrollController,
            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            padding: const EdgeInsets.all(10),
            itemCount: liste.length,
            itemBuilder: (BuildContext context, int index) {
              liste.sort((a, b) => a.pharmaNOM.compareTo(b.pharmaNOM));
              return PharmaciesGardeItemWidget(
                pharmaNOM: liste[index].pharmaNOM,
                pharmaLOC: liste[index].pharmaLOC,
                pharmaCONT1: liste[index].pharmaCONT1,
                pharmaCONT2: liste[index].pharmaCONT2,);
            }));
  }

  String periodeGarde()
  {

    firebase.ref('PERIODE DE GARDE KARA').once().then((DatabaseEvent databaseEvent) {
      setState(() {
        texte = databaseEvent.snapshot.value.toString();
      });

    });
    return texte;
  }
  void readData(){
    firebase.ref('PERIODE DE GARDE KARA').once().then((DatabaseEvent databaseEvent) {
      debugPrint('Data : ${databaseEvent.snapshot.value}');
    });
  }

  /*Widget monTexte(){

    return StreamBuilder(
        stream: periodeReference.onValue,
        builder: (context, snapshot){
          if(snapshot.hasData){
            return Marquee(
              text: snapshot.data!.snapshot.value.toString(),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: MesCouleurs.vert,
              ),
              crossAxisAlignment: CrossAxisAlignment.center,
              blankSpace: 20.0,
              velocity: 25,
              startPadding: 10.0,
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

  }*/

  //RECUPERER LISTE DE FIREBASE
  void listePharmaGarde()
  {
    listeReference.onValue.listen((event)
    {
      pharmaListe.clear();
      Map<String, dynamic> liste = Map<String, dynamic>.from(event.snapshot.value as Map) ;
      liste.forEach((key, value)
      {
        var pharmaMap = Map<String, dynamic>.from(value);
        PharmaciesGardeItemModels pharmacie = PharmaciesGardeItemModels(
            pharmaNOM: pharmaMap ["pharmaNom"],
            pharmaLOC: pharmaMap["pharmaLocal"],
            pharmaCONT1: pharmaMap["pharmaContact1"],
            pharmaCONT2: pharmaMap["pharmaContact2"]);
        setState(() {
          pharmaListe.add(pharmacie);
          pharmaListe.sort((a, b) => a.pharmaNOM.compareTo(b.pharmaNOM));
        });

      });
    });
  }

  //RECHERCHE
  recherchePharmacie(String texteRecherche)
  {
    List<PharmaciesGardeItemModels> resultatRecherche = [];
    if(texteRecherche.isEmpty){
      resultatRecherche = pharmaListe;
    }
    resultatRecherche = pharmaListe.where((pharmacie)
    {
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

  sauvegarder()async
  {
    if(pharmaListe.isNotEmpty)
    {
      var liste = json.encode(pharmaListe);
      var prefs = await SharedPreferences.getInstance();
      //prefs.setString("pharma_garde_lome", pharmaListe.toString());
      prefs.setString("pharma_garde_kara", liste);

    }
    else{
      monSnackBar("Aucune Pharmacie");
    }

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
