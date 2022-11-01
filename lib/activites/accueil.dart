
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marquee/marquee.dart';
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
  List<AccueilCardModel> cardsListes = MesListes.accueilCardListe();

  var date = DateTime.now();

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
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                    gradient: MesCouleurs.titreGradient1,
                )
              ),
            title: const Text(
                "Accueil",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
            ),
            actions: [
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
                child: IconButton(
                  onPressed: () {
                    Navigator.push(context, TransitionDroiteGauche(const PharmaciesSauveesActivity()));
                    //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const PharmaciesSauveesActivity()));
                  },
                  icon: const Icon(Icons.folder, ),

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
                child: IconButton(
                  onPressed: () {
                    Navigator.push(context, TransitionDroiteGauche(const PharmaciesFavoritesActivity()));
                  },
                  icon: const Icon(Icons.favorite, ),

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
                  child: IconButton(
                    onPressed: () {
                      //exit(0);
                      SystemNavigator.pop();
                    },
                    icon: const Icon(Icons.exit_to_app, ),

                  ),
                ),
              ),
            ],
          ),
          body: Container(
            //color: MesCouleurs.vert,
            decoration: const BoxDecoration(
                gradient: MesCouleurs.titreGradient1,
            ),
            child: Column(
              children: [
               /*SizedBox(
                  height:  hauteur * 0.15/2,
                  child: Text(
                    DateTime.now().toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: MesCouleurs.blanc,
                    ),
                  ),
                ),*/
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.thermostat_rounded,
                    color: MesCouleurs.vert,
                  ),
                ),
                ListTile(
                  horizontalTitleGap: 5,
                  leading: const CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.account_balance,
                        color: MesCouleurs.vert,
                      ),
                  ),
                  title: Card(
                    elevation: 20,
                    color: MesCouleurs.blanc,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: SizedBox(
                      height: hauteurSizeBoxMarquee,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 4),
                        child: Marquee(
                          text: "*** PHARMACIES DE GARDE *** PORTEZ VOUS BIEN ***",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: "SeaSidero",
                            color: MesCouleurs.vert,
                          ),
                          crossAxisAlignment: CrossAxisAlignment.center,
                          blankSpace: 20.0,
                          velocity: 25,
                          startPadding: 10.0,
                        ),
                      ),
                    ),
                  ),
                  trailing: const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.account_balance,
                      color: MesCouleurs.vert,
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
                      color: MesCouleurs.blancSale,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(radius), topRight: Radius.circular(radius))
                    ),
                    child: GridView.count(
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
                                borderRadius: BorderRadius.circular(20),
                                child: InkWell(
                                  splashColor: Colors.black26,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Expanded(
                                        child: SizedBox(
                                          child: Icon(cardsListes[index].icon),
                                        ),
                                      ),
                                      Container(
                                        decoration: const BoxDecoration(
                                            color: MesCouleurs.blanc,
                                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                                            gradient: MesCouleurs.titreGradient,
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: Text(
                                              cardsListes[index].titre,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                color: MesCouleurs.blanc,
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
                                    Navigator.push(context, TransitionDroiteGauche(const PharmaciesGardeActivity())):
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
              ],
            ),
          ),
        )
    );
  }

  //FEEDBACK DIALOG
  void feedBackDialog()
  {
    showModalBottomSheet(
        context: context,
        isDismissible: false,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35)),
        ),
        builder: (context)
        {
         /* return DraggableScrollableSheet(
              expand: false,
              initialChildSize: 0.35,
              minChildSize: 0.35,
              maxChildSize: 0.5,
              builder: (context, scrollController)
              {
                const double elevation = 5;

              });*/
          const double elevation = 5;
          return Material(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35)),
              child: Column(
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
                ],
              )
          );
        }
    );
  }
  /*void feedBackDialog()
  {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35)),
        ),
        builder: (context)
        {
          return DraggableScrollableSheet(
              expand: false,
              initialChildSize: 0.35,
              minChildSize: 0.35,
              maxChildSize: 0.5,
              builder: (context, scrollController)
              {
                const double elevation = 5;
                return Material(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35)),
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
                              style: TextStyle(fontSize: 13),
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

                                  onTap: (){scrollController.dispose();},
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
                      ],
                   )
                );
              });
        }
    );
  }*/

  //A PROPOS DIALOG
  void aproposDialog()
  {

  }


}

