import 'package:flutter/material.dart';
import 'package:pharma6/utilitaires/mes_couleurs.dart';
import 'package:pharma6/pages/liste_pharmacies_lome.dart';
import 'package:pharma6/pages/liste_pharmacies_kara.dart';
import 'package:pharma6/utilitaires/mes_listes.dart';
import 'package:pharma6/models/pharmacies_liste_model.dart';
import 'package:pharma6/utilitaires/mes_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';


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
  Offset offset = const Offset(20, 40);

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

    BoutonFloattant();

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
                      ), // Menu Item 1
                      MesWidgets.MonTooltip(
                        message: "Pharmacies Favorites",
                        child: IconButton(
                          onPressed: () {
                            maKaraKey.currentState!.sauvegarderListe();
                            //Navigator.push(context, TransitionDroiteGauche(const PharmaciesFavoritesActivity()));
                          },
                          icon: const Icon(Icons.favorite, size: 20,),
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
        rechercheTooltipMessage = "Fermer";
      } else{
        rechercheTooltipMessage = "Vider texte";
      }
    });
  }

  //WIDGET FLOTTANT
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

}
