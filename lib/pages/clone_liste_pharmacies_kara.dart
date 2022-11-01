import 'package:flutter/material.dart';
import 'package:pharma6/models/pharmacies_liste_model.dart';
import 'package:pharma6/models/pharmacie_liste_item_widget.dart';
import 'package:pharma6/utilitaires/mes_listes.dart';
import 'package:pharma6/utilitaires/mes_dimensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CloneListePharmaciesKara extends StatefulWidget {
  TextEditingController rechercheEditControler;
  List<PharmaciesListeModels> pharmaListe;
  List<PharmaciesListeModels> listeFiltrees;
  CloneListePharmaciesKara({Key? key, required this.rechercheEditControler, required this.pharmaListe, required this.listeFiltrees}) : super(key: key);

  @override
  State<CloneListePharmaciesKara> createState() => _CloneListePharmaciesKaraState();
}

class _CloneListePharmaciesKaraState extends State<CloneListePharmaciesKara> with ChangeNotifier {

  /*List<PharmaciesListeModels> pharmaListe = MesListes.karaListe();
  List<PharmaciesListeModels> listeFiltrees = [];*/

  bool isChecked = false;
  Widget titreText = const Text("Mes Pharmacies", style:  TextStyle(color: Colors.white, fontSize: 14),);
  Widget appBarTitre = const Text("Mes Pharmacies", style:  TextStyle(color: Colors.white, fontSize: 14),);
  var rechercheTooltip = "Recherche";
  Icon iconRecherche = const Icon(Icons.search_rounded, color: Colors.white,);
  bool rechercheEditEsOuvert = false;
  //var rechercheEditControler = TextEditingController();


  @override
  void initState() {
    widget.listeFiltrees.sort((a, b) => a.pharmaNOM.compareTo(b.pharmaNOM));

    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    var largeur = MediaQuery.of(context).size.width;
    return Scaffold(

      body:
      widget.listeFiltrees.isNotEmpty||widget.rechercheEditControler.text.isNotEmpty? maListView(widget.listeFiltrees, largeur):
          maListView(widget.pharmaListe, largeur)
    );
  }

  //LISTVIEW
  Widget maListView (List<PharmaciesListeModels> liste, double largeur)
  {
    return ListView.builder(

        key: const PageStorageKey<String>("pharma_liste_kara"),
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
              largeur: largeur,
              esFavorie: liste[index].esFavorie);
        });
  }
  //RECHERCHE
  void maRechercheKara(String texteRecherche)
  {
    List<PharmaciesListeModels> resultatRecherche = [];
    if(texteRecherche.isEmpty){
      resultatRecherche = widget.pharmaListe;
    }else{
      resultatRecherche = widget.pharmaListe.where((pharmacie) => pharmacie.pharmaNOM.toLowerCase().contains(texteRecherche.toLowerCase())).toList();
      resultatRecherche = widget.pharmaListe.where((pharmacie) => pharmacie.pharmaLOC.toLowerCase().contains(texteRecherche.toLowerCase())).toList();
    }
    /* final resultat = pharmaListe.where((pharmacie)
    {
      final nomPharma = pharmacie.pharmaNOM.toLowerCase();
      final texteSaisi = texteRecherche.toLowerCase();
      return nomPharma.contains(texteSaisi);
    }).toList();*/
    setState(() {
      widget.listeFiltrees = resultatRecherche;
      if( widget.rechercheEditControler.text.isEmpty){
        //pharmaListe = MesListes.lomeListe();
        rechercheTooltip = "Fermer";
      } else{
        rechercheTooltip = "Vider texte";
      }
    });
  }
  void maRecherche (String texteRecherche)
  {
    widget.listeFiltrees.clear();
    if(texteRecherche.isEmpty){
      setState(() {
        return;
      });
    }
    for (var pharmacie in widget.pharmaListe) {
      if(pharmacie.pharmaNOM.toLowerCase().contains(texteRecherche.toLowerCase())
          ||pharmacie.pharmaLOC.toLowerCase().contains(texteRecherche.toLowerCase())){
        widget.listeFiltrees.add(pharmacie);
      }
    }
    setState(() {});
  }

  //SOUVENIR FAVORIE
  souvenirFavories(String nomPharma, bool? esFavorie)async
  {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      esFavorie = prefs.getBool(nomPharma);
    });
  }
  void monSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
              Icon(Icons.settings),
              Text("MonSnack", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white))
            ],
          ),
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.blueGrey,
        )
    );
  }

  //APPBAR PAR DEFAUT
  void appBarDefaut()
  {
    rechercheEditEsOuvert = false;
    appBarTitre = titreText;
    iconRecherche=const Icon(Icons.search_rounded, color: Colors.white,);
    rechercheTooltip = "Recherche";
    widget.rechercheEditControler.clear();
    widget.listeFiltrees = widget.pharmaListe;
  }
}

class MonSearchDelegate extends SearchDelegate
{
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        onPressed: () {
          query.isEmpty?close(context, null):query="";
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return  IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return  Container();
  }

}
