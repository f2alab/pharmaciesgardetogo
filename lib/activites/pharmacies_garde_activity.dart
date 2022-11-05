import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pharma6/utilitaires/mes_couleurs.dart';
import 'package:pharma6/utilitaires/mes_listes.dart';
import 'package:pharma6/models/pharmacies_liste_model.dart';
import 'package:pharma6/pages/pharmacies_garde_lome.dart';
import 'package:pharma6/pages/pharmacies_garde_kara.dart';
import 'package:pharma6/utilitaires/mes_widgets.dart';

class PharmaciesGardeActivity extends StatefulWidget
{
  const PharmaciesGardeActivity({Key? key}) : super(key: key);

  @override
  State<PharmaciesGardeActivity> createState() => _PharmaciesGardeActivityState();
}

class _PharmaciesGardeActivityState extends State<PharmaciesGardeActivity>with AutomaticKeepAliveClientMixin<PharmaciesGardeActivity>, SingleTickerProviderStateMixin
{
  final maLomeKey = GlobalKey<PharmaciesGardeLomeState>();
  final maKaraKey = GlobalKey<PharmaciesGardeKaraState>();

  static const double radius = 30;
  List<PharmaciesListeModels> pharmaListe = MesListes.lomeListe();
  List<PharmaciesListeModels> listeFiltrees = [];
  bool isChecked = false;

  Widget titreText = MesWidgets.TitreEtSubtitre(titre: "Pharmacies", subtitre: "De Garde");
  Widget appBarTitre = MesWidgets.TitreEtSubtitre(titre: "Pharmacies", subtitre: "De Garde");
  var rechercheTooltipMessage = "Recherche Pharmacie";
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
    tabController.addListener(()
    {
      setState(()
      {
        if(rechercheEditEsOuvert==true){
          setState(() {
            rechercheEditEsOuvert = false;
            appBarTitre = titreText;
            iconRecherche=const Icon(Icons.search_rounded, color: Colors.white,);
            rechercheEditControler.clear();
          });
        }
      });
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
                  leading: MesWidgets.MonTooltip(
                    message: "Retour",
                    child: IconButton(
                      onPressed: () {
                        final lomeState = maLomeKey.currentState;
                        final karaState = maKaraKey.currentState;
                        if(rechercheEditEsOuvert==true){
                          setState(() {
                            rechercheEditEsOuvert = false;
                            appBarTitre = titreText;
                            iconRecherche=const Icon(Icons.search_rounded, color: Colors.white,);
                            rechercheEditControler.clear();
                            tabController.index==0?lomeState!.listeFiltrees = lomeState.pharmaListe:karaState!.listeFiltrees = karaState.pharmaListe;
                          });
                        }else{
                          Navigator.pop(context);
                        }

                      },
                      icon: const Icon(Icons.chevron_left),
                    ),
                  ),
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
                    MesWidgets.MonTooltip(
                        message: rechercheTooltipMessage,
                        child: IconButton(
                          onPressed: () {
                            final lomeState = maLomeKey.currentState;
                            final karaState = maKaraKey.currentState;
                            rechercheEditEsOuvert==false?
                            setState((){
                              rechercheEditEsOuvert = true;
                              iconRecherche = const Icon(Icons.close, color: Colors.white,);
                              rechercheTooltipMessage = "Fermer";
                              appBarTitre = TextField(
                                controller: rechercheEditControler,
                                autofocus: true,
                                cursorColor: Colors.white,
                                onChanged:(texte){
                                  tabController.index==0?lomeState!.recherchePharmacie(texte):karaState!.recherchePharmacie(texte);
                                },
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
                                tabController.index==0?lomeState!.listeFiltrees = lomeState.pharmaListe:karaState!.listeFiltrees = karaState.pharmaListe;

                              }else{
                                rechercheEditControler.clear();
                                rechercheTooltipMessage = "Fermer";
                                tabController.index==0?lomeState!.listeFiltrees = lomeState.pharmaListe:karaState!.listeFiltrees = karaState.pharmaListe;
                              }

                            });
                          },
                          icon: iconRecherche,
                          iconSize: 20,
                        ),
                    ), // Menu Item 1
                    MesWidgets.MonTooltip(
                        message: "Sauvegarde Offline",
                        child: IconButton(
                          onPressed: (){},
                          icon: const Icon(Icons.save_alt),
                          iconSize: 20,
                        )),  // Menu Item 1
                  ],
                ),
              ),
            ),
          ],
          body: TabBarView(
              controller: tabController,
              children: [
                PharmaciesGardeLome(key: maLomeKey,),
                PharmaciesGardeKara(key: maKaraKey),
              ]),
        ),

      ),
    );
  }

}
