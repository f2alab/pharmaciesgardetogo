import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:pharma6/models/pharmacies_garde_model.dart';
import 'package:pharma6/utilitaires/mes_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/pharmacie_garde_item_widget.dart';
import 'dart:convert';

class PharmaciesGardeLome extends StatefulWidget {
  const PharmaciesGardeLome({Key? key}) : super(key: key);

  @override
  State<PharmaciesGardeLome> createState() => PharmaciesGardeLomeState();
}

class PharmaciesGardeLomeState extends State<PharmaciesGardeLome>
{
  final firebase = FirebaseDatabase.instance;
  final periodeReference = FirebaseDatabase.instance.ref('PERIODE DE GARDE LOME');
  final listeReference = FirebaseDatabase.instance.ref('PHARMACIES DE GARDE LOME');
  String texte = "La Période de Garde s'affichera ici";
  late List<PharmaciesGardeItemModels> pharmaListe = [];
  List<PharmaciesGardeItemModels> listeFiltrees = [];
  static const double hauteurSizeBoxMarquee = 30;

  @override
  void initState()
  {
    super.initState();
    listePharmaGarde();
  }
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      //extendBodyBehindAppBar: true,
      appBar: MesWidgets.PeriodeGardeCard(periodeDeGarde: periodeGarde()),
      body: pharmaListe.isEmpty?const Center(
          child: Text("Patientez...", style: TextStyle(fontSize: 15, color: Colors.black),)):
      MesWidgets.MaScrollBarListe(
        context: context,
        child: ListView.builder(
            key: const PageStorageKey<String>("pharma_garde_lome"),
            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            padding: const EdgeInsets.all(10),
            itemCount: pharmaListe.length,
            itemBuilder: (context, index)
            {
              return PharmaciesGardeItemWidget(
                pharmaNOM: pharmaListe[index].pharmaNOM ,
                pharmaLOC: pharmaListe[index].pharmaLOC,
                pharmaCONT1: pharmaListe[index].pharmaCONT1,
                pharmaCONT2: pharmaListe[index].pharmaCONT2,);
            }
        ),)
    );
  }

  String periodeGarde()
  {
    firebase.ref('PERIODE DE GARDE LOME').once().then((DatabaseEvent databaseEvent) {
      setState(() {
        texte = databaseEvent.snapshot.value.toString();
      });

    });
    return texte;
  }

  void sauvegarder()async
  {
    if(pharmaListe.isNotEmpty)
    {
      var liste = json.encode(pharmaListe);
      var prefs = await SharedPreferences.getInstance();
      //prefs.setString("pharma_garde_lome", pharmaListe.toString());
      prefs.setString("pharma_garde_lome", liste);

    }
    else{
      monSnackBar("Aucune Pharmacie");
    }


  }

  //RECUPERER LISTE DE FIREBASE
  void listePharmaGarde()
  {
    listeReference.onValue.listen((event)
    {
      Map<String, dynamic> liste = Map<String, dynamic>.from(event.snapshot.value as Map) ;
      liste.forEach((key, value)
      {
        var pharmaMap = Map<String, dynamic>.from(value);
        PharmaciesGardeItemModels pharmacie = PharmaciesGardeItemModels(
            pharmaNOM: pharmaMap ["pharmaNom"],
            pharmaLOC: pharmaMap["pharmaLocal"],
            pharmaCONT1: pharmaMap["pharmaContact1"],
            pharmaCONT2: pharmaMap["pharmaContact2"]);
        setState(() async {
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


