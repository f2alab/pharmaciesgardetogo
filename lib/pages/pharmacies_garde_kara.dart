import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:pharma6/models/pharmacie_garde_item_widget.dart';
import 'package:pharma6/models/pharmacies_garde_model.dart';
import 'package:pharma6/utilitaires/mes_widgets.dart';

class PharmaciesGardeKara extends StatefulWidget {
  const PharmaciesGardeKara({Key? key}) : super(key: key);

  @override
  State<PharmaciesGardeKara> createState() => PharmaciesGardeKaraState();
}

class PharmaciesGardeKaraState extends State<PharmaciesGardeKara> {
  final firebase = FirebaseDatabase.instance;
  final periodeReference = FirebaseDatabase.instance.ref('PERIODE DE GARDE KARA');
  final listeReference = FirebaseDatabase.instance.ref('PHARMACIES DE GARDE KARA');
  String texte = "La Période de Garde s'affichera ici";
  List<PharmaciesGardeItemModels> pharmaListe = [];
  List<PharmaciesGardeItemModels> listeFiltrees = [];

  @override
  void initState()
  {
    super.initState();

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
      appBar: MesWidgets.PeriodeGardeCard(periodeDeGarde: periodeGarde()),
      body: pharmaListe.isEmpty?const Center(
          child: Text("Patientez...", style: TextStyle(fontSize: 15, color: Colors.black),)):
      MesWidgets.MaScrollBarListe(
        context: context,
        child: ListView.builder(
            key: const PageStorageKey<String>("pharma_garde_kara"),
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
        ),),
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
  void readData(){
    firebase.ref('PERIODE DE GARDE KARA').once().then((DatabaseEvent databaseEvent) {
      print('Data : ${databaseEvent.snapshot.value}');
    });
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
}
