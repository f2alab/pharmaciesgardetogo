import 'package:flutter/material.dart';
import 'package:pharma6/utilitaires/mes_dimensions.dart';
import 'package:pharma6/utilitaires/mes_methodes.dart';
import 'package:pharma6/utilitaires/mes_couleurs.dart';
import 'package:pharma6/pages/liste_pharmacies_lome.dart';
import 'package:pharma6/pages/liste_pharmacies_kara.dart';
import 'package:pharma6/utilitaires/mes_listes.dart';
import 'package:pharma6/models/pharmacies_liste_model.dart';
import 'package:pharma6/utilitaires/mes_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:pharma6/pages/clone_liste_pharmacies_kara.dart';


class ClonePharmaciesListeActivity extends StatefulWidget
{
  const ClonePharmaciesListeActivity({Key? key, }) : super(key: key);

  @override
  State<ClonePharmaciesListeActivity> createState() => _ClonePharmaciesListeActivityState();
}

class _ClonePharmaciesListeActivityState extends State<ClonePharmaciesListeActivity> with AutomaticKeepAliveClientMixin<ClonePharmaciesListeActivity>, SingleTickerProviderStateMixin
{
  static const double radius = 30;
  static const double tailleTexteTabBar = 12;
  List<PharmaciesListeModels> pharmaListe = MesListes.karaListe();
  List<PharmaciesListeModels> listeFiltrees = [];
  bool isChecked = false;
  bool lomeSelectionnee = false;
  bool karaSelectionnee = false;
  late ListePharmaciesLome listePharmaciesLome;
  late ListePharmaciesKara listePharmaciesKara;

  Widget titreText = MesWidgets.TitreEtSubtitre(titre: "Annuaire", subtitre: "Pharmacies");
  Widget appBarTitre = MesWidgets.TitreEtSubtitre(titre: "Annuaire", subtitre: "Pharmacies");
  var rechercheTooltip = "Recherche";
  Icon iconRecherche = const Icon(Icons.search_rounded, color: Colors.white,);
  bool rechercheEditEsOuvert = false;
  late TextEditingController rechercheEditControler ;
  late TabController tabController;

  //POUR GARDER LES STATE DE CHAQUE TAB( Ne pas oublier le with "AutomaticKeepAliveClientMixin<PharmaciesListeActivity>")
  @override
  bool get wantKeepAlive => true;

  @override
  void initState()
  {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(()
    {
      setState(()
      {
        tabController.index==0?[karaSelectionnee=false, lomeSelectionnee=true]:[karaSelectionnee=true, lomeSelectionnee=false];
        //tabController.index==1?[karaSelectionnee=true, lomeSelectionnee=false]:karaSelectionnee=false;
      });
    });

    rechercheEditControler = TextEditingController();
    rechercheEditControler.addListener(()
    {
      setState(()
      {

      });
    });
    listePharmaciesLome = const ListePharmaciesLome();
   // listePharmaciesKara = ListePharmaciesKara();
    //souvenirFavories(widget.pharmaNOM, widget.esFavorie);
  }

  souvenirFavories(String nomPharma, bool? esFavorie)async
  {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      esFavorie = prefs.getBool(nomPharma);
    });
  }
  @override
  void dispose()
  {
    super.dispose();
    tabController.dispose();

  }

  @override
  Widget build(BuildContext context)
  {
    super.build(context);
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled)=>[
            SliverOverlapAbsorber(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverSafeArea(
                  top: false,
                  sliver: SliverAppBar(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(bottom: Radius.circular(radius))
                    ),
                    leading: MesWidgets.MonBoutonRetour(context),
                    floating: true, //Pour que AppBar soit visible dès que le scroll down sans revenir au debut de la liste avant qu'il reapparait
                    snap: true,
                    pinned: true, //Pour eviter que TabBar aussi scroll et se masque en meme temps que le AppBar
                    title: appBarTitre,
                    bottom: TabBar(
                        controller: tabController,
                        physics: const BouncingScrollPhysics(),
                        indicator: BoxDecoration(
                            color: MesCouleurs.blanc,
                            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(radius)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black
                                  .withOpacity(0.3)
                                  .withBlue(50),
                              blurRadius: 5,
                              offset: const Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        labelColor: MesCouleurs.vert,
                        unselectedLabelColor: Colors.white70,
                        splashBorderRadius: const BorderRadius.vertical(bottom: Radius.circular(radius)),
                        tabs: [
                          Tab(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Icon(Icons.home),
                                Text("LOME", style: TextStyle(fontSize: tailleTexteTabBar)),
                              ],
                            ),
                          ),
                          Tab(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Icon(Icons.home),
                                Text("KARA", style: TextStyle(fontSize: tailleTexteTabBar)),
                              ],
                            ),
                          )
                        ]
                    ),
                    actions: [
                      Tooltip(
                        message: "Rechercher Pharmacie",
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          gradient: MesCouleurs.titreGradient,
                        ),
                        textStyle: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        child: IconButton(
                          tooltip: rechercheTooltip,
                          onPressed: () {
                            monSnackBar();
                            rechercheEditEsOuvert==false?
                            setState((){
                              rechercheEditEsOuvert = true;
                              iconRecherche = const Icon(Icons.close, color: Colors.white, size: 15,);
                              rechercheTooltip = "Fermer";
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
                                rechercheTooltip = "Recherche";
                                //listeFiltrees = pharmaListe;
                              }else{
                                rechercheEditControler.clear();
                                //listeFiltrees = pharmaListe;
                                rechercheTooltip = "Fermer";
                              }


                            });

                          },
                          icon: iconRecherche,
                          iconSize: 20,
                        ),
                      ),

                    ],
                  ),
                ),
            ),
          ],
          body: TabBarView(
              controller: tabController,
              children: [
                const ListePharmaciesLome(),
                CloneListePharmaciesKara(rechercheEditControler: rechercheEditControler, pharmaListe: pharmaListe, listeFiltrees: listeFiltrees,)
          ]),
        ),

      ),
    );
  }

  void maRecherche (String texteRecherche)
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

  //RECHERCHE
  void maRecherche1(String texteRecherche)
  {
    List<PharmaciesListeModels> resultatRecherche = [];
    if(texteRecherche.isEmpty){
      resultatRecherche = pharmaListe;
    }else{
      resultatRecherche = pharmaListe.where((pharmacie) => pharmacie.pharmaNOM.toLowerCase().contains(texteRecherche.toLowerCase())).toList();
      resultatRecherche = pharmaListe.where((pharmacie) => pharmacie.pharmaLOC.toLowerCase().contains(texteRecherche.toLowerCase())).toList();
    }
    /* final resultat = pharmaListe.where((pharmacie)
    {
      final nomPharma = pharmacie.pharmaNOM.toLowerCase();
      final texteSaisi = texteRecherche.toLowerCase();
      return nomPharma.contains(texteSaisi);
    }).toList();*/
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

  void monSnackBar() {
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
    rechercheEditControler.clear();
    listeFiltrees = pharmaListe;
  }


}
