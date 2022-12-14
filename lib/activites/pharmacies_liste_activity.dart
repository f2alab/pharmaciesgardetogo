import 'package:flutter/material.dart';
import 'package:pharma6/activites/pharmacies_favorites_activity.dart';
import 'package:pharma6/utilitaires/activities_transitions.dart';
import 'package:pharma6/utilitaires/mes_couleurs.dart';
import 'package:pharma6/pages/liste_pharmacies_lome.dart';
import 'package:pharma6/pages/liste_pharmacies_kara.dart';
import 'package:pharma6/utilitaires/mes_listes.dart';
import 'package:pharma6/models/pharmacies_liste_model.dart';
import 'package:pharma6/utilitaires/mes_widgets.dart';
import 'package:pharma6/utilitaires/mes_animations.dart';


class PharmaciesListeActivity extends StatefulWidget
{
  const PharmaciesListeActivity({Key? key, }) : super(key: key);

  @override
  State<PharmaciesListeActivity> createState() => _PharmaciesListeActivityState();
}

class _PharmaciesListeActivityState extends State<PharmaciesListeActivity> with AutomaticKeepAliveClientMixin<PharmaciesListeActivity>, SingleTickerProviderStateMixin
{
  final maLomeKey = GlobalKey<ListePharmaciesLomeState>();
  final maKaraKey = GlobalKey<ListePharmaciesKaraState>();

  static const double radius = 30;
  List<PharmaciesListeModels> pharmaListe = MesListes.lomeListe();
  List<PharmaciesListeModels> listeFiltrees = [];
  bool isChecked = false;
  Widget titreText = MesWidgets.TitreEtSubtitre(titre: "Annuaire", subtitre: "De Pharmacies");
  Widget appBarTitre = MesWidgets.TitreEtSubtitre(titre: "Annuaire", subtitre: "Pharmacies");
  var rechercheTooltipMessage = "Rechercher Pharmacie";
  Icon iconRecherche = const Icon(Icons.search_rounded, color: Colors.white,);
  bool rechercheEditEsOuvert = false;
  late TextEditingController rechercheEditControler = TextEditingController();
  late TabController tabController;
  OverlayEntry? entry;
  Offset offset = const Offset(100, 150);

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

    //WidgetsBinding.instance.addPostFrameCallback((timeStamp) {BoutonFloattant(); });
  }

  @override
  void dispose()
  {
    super.dispose();
    if(!mounted){
      tabController.dispose();
    }
    //masquer();
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
                    floating: true, //Pour que AppBar soit visible d??s que le scroll down sans revenir au debut de la liste avant qu'il reapparait
                    snap: true,
                    pinned: true, //Pour eviter que TabBar aussi scroll et se masque en meme temps que le AppBar
                    title: appBarTitre,
                    bottom: TabBar(
                        controller: tabController,
                        physics: const BouncingScrollPhysics(),
                        indicator: BoxDecoration(
                            color: MesCouleurs.blanc,
                            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(radius)),
                            shape: BoxShape.rectangle,
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
                        child: MesAnimations.MaSlideAnimHorizontal(
                          offsetX: 10,
                          childWidget: IconButton(
                            onPressed: () {
                              final lomeState = maLomeKey.currentState;
                              final karaState = maKaraKey.currentState;
                              rechercheEditEsOuvert==false?
                              setState((){
                                rechercheEditEsOuvert = true;
                                iconRecherche = const Icon(Icons.close, color: Colors.white, size: 20,);
                                rechercheTooltipMessage = "Fermer";
                                appBarTitre = TextField(
                                  controller: rechercheEditControler,
                                  autofocus: true,
                                  cursorColor: MesCouleurs.blanc,
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
                        ),
                      ), // Menu Item 1
                      MesWidgets.MonTooltip(
                        message: "Pharmacies Favorites",
                        child: MesAnimations.MaSlideAnimHorizontal(
                          offsetX: 10,
                          childWidget: IconButton(
                            onPressed: () {
                              Navigator.push(context, TransitionDroiteGauche(const PharmaciesFavoritesActivity()));
                            },
                            icon: const Icon(Icons.favorite, size: 20,),
                          ),
                        ),
                      ), // Menu Item 2
                    ], // Menu
                  ),
                ),
            ),
          ],
          body: TabBarView(
              controller: tabController,
              children: [
                ListePharmaciesLome(key: maLomeKey,),
                ListePharmaciesKara(key: maKaraKey,)
          ]),
        ),

      ),
    );
  }
 /* //WIDGET FLOTTANT
  void BoutonFloattant()
  {
    entry = OverlayEntry(builder: (context){
      return Positioned(
          left: offset.dx,
          top: offset.dy,
          child: GestureDetector(
            onPanUpdate: (details){
              setState(() {
                offset+= details.delta;
                entry!.markNeedsBuild();
              });
            },
            child: ElevatedButton.icon(
                onPressed: (){},
                icon: const Icon(Icons.lightbulb_outlined),
                label: const Text("Flottant")),
          )
      );
    });
    final overlay = Overlay.of(context)!;
    overlay.insert(entry!);
  }
  void masquer(){
    entry?.remove();
    entry = null;
  }*/

}
