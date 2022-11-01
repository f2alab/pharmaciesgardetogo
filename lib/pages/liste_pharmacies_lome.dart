import 'package:flutter/material.dart';
import 'package:pharma6/models/pharmacies_liste_model.dart';
import 'package:pharma6/utilitaires/mes_listes.dart';
import 'package:pharma6/models/pharmacie_liste_item_widget.dart';
import 'package:pharma6/utilitaires/mes_widgets.dart';

class ListePharmaciesLome extends StatefulWidget {
  const ListePharmaciesLome({Key? key}) : super(key: key);

  @override
  State<ListePharmaciesLome> createState() => _ListePharmaciesLomeState();
}

class _ListePharmaciesLomeState extends State<ListePharmaciesLome>
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
    listeFiltrees.sort((a, b) => a.pharmaNOM.compareTo(b.pharmaNOM));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    var largeur = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      /*appBar: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(25))
        ),
        leading:Tooltip(
          message: "Retour",
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            gradient: LinearGradient(
              colors: [
                Color(0xFF1A8D77),
                Color(0xFF0E893B),
                Color(0xFF04146A),
              ],
            ),
          ),
          textStyle: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          child: IconButton(
            onPressed: () {
              setState(() {
                rechercheEditEsOuvert==false? Navigator.pop(context):appBarDefaut();
              });
            },
            icon: const Icon(Icons.arrow_back),

          ),
        ),
        title: appBarTitre,
        backgroundColor: const Color(0xFF055E26),
        actions: [
          IconButton(
            tooltip: rechercheTooltip,
            onPressed: () {
              rechercheEditEsOuvert==false?
              setState((){
                rechercheEditEsOuvert = true;
                iconRecherche = const Icon(Icons.close, color: Colors.white,);
                rechercheTooltip = "Fermer";
                appBarTitre = TextField(
                  controller: rechercheEditControler,
                  autofocus: true,
                  onChanged: maRecherche,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: MesDimensions.tailleMinTexte,
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
                  rechercheTooltip = "Recherche";
                  listeFiltrees = pharmaListe;
                }else{
                  rechercheEditControler.clear();
                  listeFiltrees = pharmaListe;
                  rechercheTooltip = "Fermer";
                }


              });

            },
            icon: iconRecherche,
          ),
          IconButton(
            tooltip: "Recherche",
            onPressed: () {
              showSearch(context: context, delegate: MonSearchDelegate(),);
            },
            icon: Icon(Icons.search_rounded, color: Colors.white,),

          ),
        ],
      ),*/
      body: MesWidgets.MaScrollBarListe(
          context: context,
          child: ListView.builder(
              key: const PageStorageKey<String>("pharma_liste_lome"),
              physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              padding: const EdgeInsets.all(10),
              itemCount: listeFiltrees.length,
              itemBuilder: (BuildContext context, int index) {
                //listeFiltrees.sort();
                return PharmaciesListeItemWidget(
                    pharmaNOM: listeFiltrees[index].pharmaNOM,
                    pharmaLOC: listeFiltrees[index].pharmaLOC,
                    pharmaCONT1: listeFiltrees[index].pharmaCONT1,
                    pharmaCONT2: listeFiltrees[index].pharmaCONT2,
                    largeur: largeur,
                    esFavorie: listeFiltrees[index].esFavorie);
              })),
      /*body: ListView.builder(
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          padding: const EdgeInsets.all(10),
          itemCount: listeFiltrees.length,
          itemBuilder: (BuildContext context, int index) {
            //listeFiltrees.sort();
            return Container(
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
                        horizontalTitleGap: 1,
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
                                listeFiltrees[index].pharmaNOM,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: largeur<320?10:15,
                                    color: const Color(0xFF056629)),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        trailing: IconButton(
                          icon: listeFiltrees[index].esFavorie==false?const Icon(Icons.favorite_border,color: Colors.white,):const Icon(Icons.favorite,color: Colors.amberAccent,),
                          onPressed: (){setState(() {
                            listeFiltrees[index].esFavorie = !listeFiltrees[index].esFavorie;
                          });},
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                      child: Container(
                        color: const Color(0xFF76065F),
                      ),
                    ),
                    ListTile(
                      title: const Text(
                        "COORDONNÉES",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.purple),
                      ),
                      trailing: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: const Icon(Icons.map, color:  Color(0xFF056629)),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 3, horizontal: 15),
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(
                                listeFiltrees[index].pharmaLOC,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Colors.black),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 1,
                      child: Container(
                        color: const Color(0xFF0E893B),
                      ),
                    ),
                    ListTile(
                      title: const Text(
                        "CONTACTS",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.purple),
                      ),
                      trailing: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: const Icon(Icons.phone, color:  Color(0xFF056629)),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 3, horizontal: 15),
                      child: Row(
                        children: [
                          Text(
                            "+228 ${listeFiltrees[index].pharmaCONT1}",
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
                      listeFiltrees[index].pharmaCONT2 == "" ? false : true,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 3, horizontal: 15),
                        child: Row(
                          children: [
                            Text(
                              "+228 ${listeFiltrees[index].pharmaCONT2}",
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
            );
          }),*/
    );
  }

  //RECHERCHE
  void maRecherche(String texteRecherche)
  {
    List<PharmaciesListeModels> resultatRecherche = [];
    if(texteRecherche.isEmpty){
      resultatRecherche = pharmaListe;
    }else{
      resultatRecherche = pharmaListe.where((pharmacie) => pharmacie.pharmaNOM.toLowerCase().contains(texteRecherche.toLowerCase())).toList();
      resultatRecherche = pharmaListe.where((pharmacie) => pharmacie.pharmaLOC.toLowerCase().contains(texteRecherche.toLowerCase())).toList();
    }
    setState(() {
      listeFiltrees = resultatRecherche;
      if( rechercheEditControler.text.isEmpty){
        //pharmaListe = MesListes.lomeListe();
        rechercheTooltip = "Fermer";
      } else{
        rechercheTooltip = "Vider texte";
      }
    });
  }

  //APPBAR PAR DEFAUT
  void appBarDefaut()
  {
    rechercheEditEsOuvert = false;
    appBarTitre = titreText;
    iconRecherche=const Icon(Icons.search_rounded, color: Colors.white,);
    rechercheTooltip = "Recherche";
    rechercheEditControler.clear();
    listeFiltrees = pharmaListe;
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
