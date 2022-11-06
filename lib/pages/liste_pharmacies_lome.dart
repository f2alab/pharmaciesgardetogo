import 'package:flutter/material.dart';
import 'package:pharma6/models/pharmacies_liste_model.dart';
import 'package:pharma6/utilitaires/mes_couleurs.dart';
import 'package:pharma6/utilitaires/mes_listes.dart';
import 'package:pharma6/models/pharmacie_liste_item_widget.dart';
import 'package:pharma6/utilitaires/mes_widgets.dart';

class ListePharmaciesLome extends StatefulWidget {
  const ListePharmaciesLome({Key? key}) : super(key: key);

  @override
  State<ListePharmaciesLome> createState() => ListePharmaciesLomeState();
}

class ListePharmaciesLomeState extends State<ListePharmaciesLome>
{

  List<PharmaciesListeModels> pharmaListe = MesListes.lomeListe();
  List<PharmaciesListeModels> listeFiltrees = [];
  bool isChecked = false;
  Widget titreText = const Text("Mes Pharmacies", style:  TextStyle(color: Colors.white, fontSize: 14),);
  Widget appBarTitre = const Text("Mes Pharmacies", style:  TextStyle(color: Colors.white, fontSize: 14),);
  var rechercheTooltip = "Recherche";
  Icon iconRecherche = const Icon(Icons.search_rounded, color: Colors.white,);
  bool rechercheEditEsOuvert = false;
  var rechercheEditControler = TextEditingController();

  @override
  void initState() {
    listeFiltrees = pharmaListe;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBodyBehindAppBar: true,
      body:
      //MARCHE AVEC recherche() et ajouter listeFiltrees = pharmaListe dans initState
      listeFiltrees.isNotEmpty? maListView(listeFiltrees):
      MesWidgets.PasDeCorrespondance()
      /*listeFiltrees.isNotEmpty? maListView(listeFiltrees):
      maListView(pharmaListe)*/
    );
  }
  //LISTE
  Widget maListView (List<PharmaciesListeModels> liste)
  {
    return MesWidgets.MaScrollBarListe(
        context: context,
        child: ListView.builder(
            key: const PageStorageKey<String>("pharma_liste_lome"),
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
                  esFavorie: liste[index].esFavorie);
            }));
  }

  //RECHERCHE
  recherchePharmacie(String texteRecherche)
  {
    List<PharmaciesListeModels> resultatRecherche = [];
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
  maRecherche (String texteRecherche)
  {
    listeFiltrees.clear();
    if(texteRecherche.isEmpty){
      setState(() {
        return;
      });
    }
    for (var pharmacie in pharmaListe) {
      if(pharmacie.pharmaNOM.toLowerCase().contains(texteRecherche.toLowerCase())
          ||pharmacie.pharmaLOC.toLowerCase().contains(texteRecherche.toLowerCase())){
        listeFiltrees.add(pharmacie);
      }
    }
    setState(() {});
  }

}
