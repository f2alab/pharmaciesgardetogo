import 'package:flutter/material.dart';
import 'package:pharma6/utilitaires/mes_dimensions.dart';
import 'package:pharma6/utilitaires/mes_couleurs.dart';
import 'package:pharma6/utilitaires/mes_listes.dart';
import 'package:pharma6/models/pharmacies_liste_model.dart';
import 'package:pharma6/pages/sauvegarde_pharmacies_garde_lome.dart';
import 'package:pharma6/pages/sauvegarde_pharmacies_garde_kara.dart';
import 'package:pharma6/utilitaires/mes_widgets.dart';

class PharmaciesSauveesActivity extends StatefulWidget
{
  const PharmaciesSauveesActivity({Key? key}) : super(key: key);

  @override
  State<PharmaciesSauveesActivity> createState() => _PharmaciesSauveesActivityState();
}

class _PharmaciesSauveesActivityState extends State<PharmaciesSauveesActivity>with AutomaticKeepAliveClientMixin<PharmaciesSauveesActivity>, SingleTickerProviderStateMixin
{
  static const double radius = 30;
  List<PharmaciesListeModels> pharmaListe = MesListes.lomeListe();
  List<PharmaciesListeModels> listeFiltrees = [];
  bool isChecked = false;
  bool lomeSelectionnee = false;
  bool karaSelectionnee = false;

  Widget titreText = const Text("Pharmacies de Garde", style:  TextStyle(color: Colors.white, fontSize: 14),);
  Widget appBarTitre =  MesWidgets.TitreEtSubtitre(titre: "Sauvegarde", subtitre: "Pharmacies de Garde");
  var rechercheTooltip = "Recherche";
  Icon iconRecherche = const Icon(Icons.search_rounded, color: Colors.white,);
  bool rechercheEditEsOuvert = false;
  var rechercheEditControler = TextEditingController();
  late TabController tabController;

  //POUR GARDER LES STATE DE CHAQUE TAB( Ne pas oublier le with "AutomaticKeepAliveClientMixin<PharmaciesListeActivity>")
  @override
  bool get wantKeepAlive => true;

  @override
  void initState()
  {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {setState(() {});});
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
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled)=>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverSafeArea(
                top: false,
                sliver: SliverAppBar(
                  elevation: 5,
                  forceElevated: true,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(radius))
                  ),
                  leading: MesWidgets.MonBoutonRetour(context),
                  floating: true, //Pour que AppBar soit visible dès que le scroll down sans revenir au debut de la liste avant qu'il réapparait
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
                      tabs: MesWidgets.villesTabs,
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
              children: const [
                SauvegardePharmaciesGardeLome(),
                SauvegardePharmaciesGardeKara(),
              ]),
        ),

      ),
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
}
