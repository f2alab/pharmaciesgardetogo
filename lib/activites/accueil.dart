
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marquee/marquee.dart';
import 'package:pharma6/activites/les_mieux_notes_activity.dart';
import 'package:pharma6/activites/pharmacies_garde_activity.dart';
import 'package:pharma6/activites/pharmacies_liste_activity.dart';
import 'package:pharma6/activites/organismes_sante_liste_activity.dart';
import 'package:pharma6/activites/sauvegarde_pharmacies_garde_activity.dart';
import 'package:pharma6/activites/pharmacies_favorites_activity.dart';
import 'package:pharma6/activites/bon_a_savoir_activity.dart';
import 'package:pharma6/utilitaires/mes_couleurs.dart';
import 'package:pharma6/utilitaires/activities_transitions.dart';
import 'package:pharma6/utilitaires/mes_listes.dart';
import 'package:pharma6/models/accueil_card_model.dart';
import 'package:pharma6/utilitaires/mes_animations.dart';
import 'package:pharma6/utilitaires/mes_widgets.dart';
import 'package:pharma6/widgets/accueil_marquee.dart';


class Accueil extends StatefulWidget
{
  const Accueil({Key? key}) : super(key: key);

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil>
{
  final double radius = 40;
  //static const double hauteurSizeBox = 50;
  static const double hauteurSizeBoxMarquee = 30;
  String texteFilant = "*** PHARMACIES DE GARDE *** PORTEZ VOUS BIEN ***";
  List<AccueilCardModel> cardsListes = MesListes.accueilCardListe();
  var date = DateTime.now();
  final Widget appBarTitre = const Text(
      "Accueil",
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ));

  @override
  void initState() {
    //listeFiltrees = organismesListe;
    super.initState();

  }
  @override
  Widget build(BuildContext context)
  {
    double hauteur = MediaQuery.of(context).size.height;
    double largeur = MediaQuery.of(context).size.width;
    //const double hauteurSizeBox = hauteur * 0.33;
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            /*flexibleSpace: Container(
                decoration: const BoxDecoration(
                    gradient: MesCouleurs.titreGradient1,
                )
              ),*/
            title: MesAnimations.MaSlideAnimHorizontal(
              offsetX: -15,
              childWidget: Material(
                elevation: 3,
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                    height: 25,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(colors: [
                          Color(0xFF056629),
                          Color(0xFF177F35),
                          Color(0xFF056629),
                        ]),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                            child: Text(
                                "Accueil",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                )
                            ),
                          ),
                        ],
                      ),
                    )
                ),
              ),
            ),
            actions: [
              Tooltip(
                message: "Les mieux notées",
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  gradient: MesCouleurs.titreGradient,
                ),
                textStyle: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                child: MesAnimations.MaSlideAnimHorizontal(
                  offsetX: 15,
                  childWidget: IconButton(
                    onPressed: () {
                      Navigator.push(context, TransitionDroiteGauche(const LesMieuxNotesActivity()));
                      //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const PharmaciesSauveesActivity()));
                    },
                    icon: const Icon(Icons.star, ),

                  ),
                ),
              ),
              Tooltip(
                message: "Sauvegarde Pharmacies",
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  gradient: MesCouleurs.titreGradient,
                ),
                textStyle: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                child: MesAnimations.MaSlideAnimHorizontal(
                  offsetX: 10,
                  childWidget: IconButton(
                    onPressed: () {
                      Navigator.push(context, TransitionDroiteGauche(const PharmaciesSauveesActivity()));
                      //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const PharmaciesSauveesActivity()));
                    },
                    icon: const Icon(Icons.folder, ),

                  ),
                ),
              ),
              Tooltip(
                message: "Pharmacies Favorites",
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  gradient: MesCouleurs.titreGradient,
                ),
                textStyle: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                child: MesAnimations.MaSlideAnimHorizontal(
                  offsetX: 8,
                  childWidget: IconButton(
                    onPressed: () {
                      Navigator.push(context, TransitionDroiteGauche(const PharmaciesFavoritesActivity()));
                    },
                    icon: const Icon(Icons.favorite, ),

                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 3),
                child: Tooltip(
                  message: "Quitter",
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    gradient: MesCouleurs.titreGradient,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  child: MesAnimations.MaSlideAnimHorizontal(
                    offsetX: 5,
                    childWidget: IconButton(
                      onPressed: () {
                        //exit(0);
                        SystemNavigator.pop();
                      },
                      icon: const Icon(Icons.exit_to_app, ),

                    ),
                  ),
                ),
              ),
            ],
          ),
          body: Container(
            color: MesCouleurs.vert,
            /*decoration: const BoxDecoration(
                gradient: MesCouleurs.titreGradient1,
            ),*/
            child: Column(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.thermostat_rounded,
                    color: vert,
                  ),
                ),
                ListTile(
                  horizontalTitleGap: 5,
                  leading: MesAnimations.MaSlideAnimHorizontal(
                    offsetX: -10,
                    childWidget: const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.account_balance,
                          color: MesCouleurs.vert,
                        ),
                    ),
                  ),
                  title: Card(
                    elevation: 20,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: blanc,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: SizedBox(
                      height: hauteurSizeBoxMarquee,
                      child: AccueilMarquee(texte: texteFilant),
                    ),
                  ),
                  trailing: MesAnimations.MaSlideAnimHorizontal(
                    offsetX: 10,
                    childWidget: const CircleAvatar(
                      backgroundColor: blanc,
                      child: Icon(
                        Icons.account_balance,
                        color: vert,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: hauteur * 0.15/2,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(top: 15),
                    decoration: BoxDecoration(
                      color: blancSale,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(radius), topRight: Radius.circular(radius))
                    ),
                    child: MesAnimations.MaSlideAnimVertical(
                      offsetY: 60,
                      childWidget: GridView.count(
                        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                        primary: false,
                        padding: const EdgeInsets.all(15),
                        crossAxisSpacing: 15,
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        children: List<Widget>.generate(
                            cardsListes.length, (index) {
                          return GridTile(
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Material(
                                  elevation: 15,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                                  child: InkWell(
                                    splashColor: Colors.black26,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Expanded(
                                          child: FractionallySizedBox(
                                            heightFactor:0.5,
                                            widthFactor:0.5,
                                            child: FittedBox(
                                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                                child: Image.asset(cardsListes[index].image, width: 60, height: 60,)),
                                          ),
                                        ),
                                        Container(
                                          clipBehavior: Clip.antiAliasWithSaveLayer,
                                          decoration: const BoxDecoration(
                                              color: MesCouleurs.blanc,
                                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                                              gradient: titreGradient,
                                              shape: BoxShape.rectangle,
                                          ),
                                          child: Center(
                                            child: Padding(
                                              padding: const EdgeInsets.all(3.0),
                                              child: Text(
                                                cardsListes[index].titre,
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                  color: blanc,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                          ),

                                        )
                                      ],
                                    ),
                                    onTap: ()
                                    {
                                      cardsListes[index].id==1?
                                      verifierConnectivite():
                                      //Navigator.push(context, TransitionDroiteGauche(const PharmaciesGardeActivity())):
                                      cardsListes[index].id==2?
                                      Navigator.push(context, TransitionDroiteGauche(const PharmaciesListeActivity())):
                                      cardsListes[index].id==3?
                                      Navigator.push(context, TransitionDroiteGauche(const OrganismesSanteListeActivity())):
                                      cardsListes[index].id==4?
                                      Navigator.push(context, TransitionDroiteGauche(const BonaSavoirActivity())):
                                      cardsListes[index].id==5?
                                      //Navigator.push(context, TransitionDroiteGauche(const PharmaciesFavoritesActivity()))
                                      feedBackDialog():
                                      //Navigator.push(context, TransitionDroiteGauche(const PharmaciesSauveesActivity()));
                                      aproposDialog();

                                    },
                                  ),
                                ),
                              )
                          );
                        }),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }

  verifierConnectivite()async
  {
    var result = await Connectivity().checkConnectivity();
    if(result == ConnectivityResult.mobile
        ||result == ConnectivityResult.wifi
        ||result == ConnectivityResult.ethernet
        ||result == ConnectivityResult.ethernet
        ||result == ConnectivityResult.bluetooth)
    {
      Navigator.push(context, TransitionDroiteGauche(const PharmaciesGardeActivity()));

    }else{
      monSnackBar("Connectez vous et réssayez");
    }
  }

  //FEEDBACK DIALOG
  void feedBackDialog()
  {
    const double elevation = 5;
    MesWidgets.MonBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        child: MesAnimations.MaSlideAnimVertical(
          offsetY: 50,
          childWidget: Column(
            mainAxisSize: MainAxisSize.min,
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
                  leading: const Icon(Icons.wechat, color: Colors.white),
                  title: const Center(
                    child: Text(
                      "DONNEZ VOTRE AVIS !",
                      style: TextStyle(fontSize: 14, color: Colors.white),),
                  ),
                  trailing: Material(
                      elevation: elevation,
                      color: Colors.white,
                      shape: const CircleBorder(),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: InkWell(
                        splashColor: Colors.black26,
                        onTap: (){Navigator.of(context).pop();},
                        child: const Padding(
                          padding: EdgeInsets.all(1.0),
                          child: Icon(Icons.cancel, color: Colors.red),
                        ),
                      )),

                ),
              ),
              Container(
                  color: Colors.white,
                  child: Column(
                  children: [
                    SizedBox(
                      height: 5,
                      child: Container(
                        color: const Color(0xFF76065F),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Aidez nous à améliorer l'Application en nous faisant part par appel ou par message (sms, mail ou whatsapp) de votre expérience d'utilisation. Pour nous appeler ou nous envoyez un message, cliquez respectivement les boutons ci-dessous pour le faire.",
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1,
                      child: Container(
                        color: const Color(0xFF76065F),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Material(
                              elevation: elevation,
                              color: Colors.white,
                              shape: const CircleBorder(),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: InkWell(
                                splashColor: Colors.black26,

                                onTap: (){},
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(Icons.phone, color: MesCouleurs.vert),
                                ),
                              )),
                          Material(
                              elevation: elevation,
                              color: Colors.white,
                              shape: const CircleBorder(),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: InkWell(
                                splashColor: Colors.black26,
                                onTap: (){},
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(Icons.message, color: MesCouleurs.vert),
                                ),
                              )),
                          Material(
                              elevation: elevation,
                              color: Colors.white,
                              shape: const CircleBorder(),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: InkWell(
                                splashColor: Colors.black26,

                                onTap: (){},
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(Icons.whatsapp, color: MesCouleurs.vert),
                                ),
                              )),
                          Material(
                              elevation: elevation,
                              color: Colors.white,
                              shape: const CircleBorder(),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: InkWell(
                                splashColor: Colors.black26,

                                onTap: (){},
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(Icons.email, color: MesCouleurs.vert),
                                ),
                              )),

                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ]
                )
              )
            ],
          ),
        )
    );
  }

  //A PROPOS DIALOG
  void aproposDialog()
  {
      //TEDST
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

