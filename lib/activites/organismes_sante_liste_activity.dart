import 'package:flutter/material.dart';
import 'package:pharma6/utilitaires/mes_dimensions.dart';
import 'package:pharma6/utilitaires/mes_couleurs.dart';
import 'package:pharma6/utilitaires/mes_listes.dart';
import 'package:pharma6/models/organismes_sante_liste_model.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter/services.dart';
import 'package:pharma6/utilitaires/mes_methodes.dart';
import 'package:pharma6/utilitaires/mes_widgets.dart';

class OrganismesSanteListeActivity extends StatefulWidget
{
  const OrganismesSanteListeActivity({Key? key}) : super(key: key);

  @override
  State<OrganismesSanteListeActivity> createState() => _OrganismesSanteListeActivityState();
}

class _OrganismesSanteListeActivityState extends State<OrganismesSanteListeActivity> with TickerProviderStateMixin
{
  List<OrganismesSanteListeItem> organismesListe = MesListes.organismesSanteListe();
  List<OrganismesSanteListeItem> listeFiltrees = [];
  Widget appBarDefautTitre = MesWidgets.TitreEtSubtitre(titre: "Organismes", subtitre: "De La Santé");
  Widget appBarTitre = MesWidgets.TitreEtSubtitre(titre: "Organismes", subtitre: "De La Santé");
  Gradient gradient = const LinearGradient(
    colors: [
      Color(0xFF1A8D77),
      Color(0xFF03866C),
      Color(0xFF015A22),
    ],
  );
  Icon iconRecherche = const Icon(Icons.search_rounded, color: Colors.white,);
  var rechercheTooltipMessage = "Recherche Organisme";
  bool rechercheEditEsOuvert = false;
  var rechercheEditControler = TextEditingController();
  late AnimationController iconAnimProgress;
  bool expanded = true;

  @override
  void initState() {
    //listeFiltrees = organismesListe;
    super.initState();
    //STATUS BAR ET NAVIGATION BAR COULEUR
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: MesCouleurs.institutionPrimaryColor,
      systemNavigationBarColor: MesCouleurs.institutionPrimaryColor,
    ));
    iconAnimProgress = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
      reverseDuration: const Duration(milliseconds: 500),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //STATUS BAR ET NAVIGATION BAR COULEUR
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: MesCouleurs.vert,
      systemNavigationBarColor: MesCouleurs.vert,
    ));
  }
  @override
  Widget build(BuildContext context)
  {
    return SafeArea(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: MesCouleurs.institutionPrimaryColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))
            ),
            leading: MesWidgets.MonBoutonRetour(context),
            title: appBarTitre,
            actions: [
              MesWidgets.MonTooltip(
                  message: rechercheTooltipMessage,
                  gradientColor: gradient,
                  child: IconButton(
                    icon: iconRecherche,
                    iconSize: 20,
                      onPressed: () {
                        rechercheEditEsOuvert==false?
                        setState((){
                          rechercheEditEsOuvert = true;
                          iconRecherche = const Icon(Icons.close, color: Colors.white,);
                          rechercheTooltipMessage = "Fermer";
                          appBarTitre = TextField(
                            controller: rechercheEditControler,
                            autofocus: true,
                            cursorColor: Colors.white,
                            onChanged: maRecherche,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              focusColor: Colors.white,
                              hintText: "Rechercher Organisme",
                              hintStyle: TextStyle(
                                color: Colors.white70,
                              ),
                            ),
                          );

                        }):  setState(() {
                          if( rechercheEditControler.text.isEmpty){
                            rechercheEditEsOuvert = false;
                            appBarTitre = appBarDefautTitre;
                            iconRecherche=const Icon(Icons.search_rounded, color: Colors.white,);
                            rechercheTooltipMessage = "Recherche Organisme";
                          }else{
                            rechercheEditControler.clear();
                            //listeFiltrees = organismesListe;
                            rechercheTooltipMessage = "Fermer";
                          }
                        });
                      }, )
              ),
              IconButton(
                  onPressed: (){
                    setState(() {
                      expanded?iconAnimProgress.forward():iconAnimProgress.reverse();
                      expanded = !expanded;
                    });
                  },
                  icon: AnimatedIcon(
                      icon: AnimatedIcons.search_ellipsis,
                      progress: iconAnimProgress))// Menu Item 1
            ],
          ),
          body: listeFiltrees.isNotEmpty||rechercheEditControler.text.isNotEmpty? maListView(listeFiltrees):
          maListView(organismesListe),

        )
    );
  }

  //LISTVIEW WIDGET
  Widget maListView (List<OrganismesSanteListeItem> liste)
  {
    const double elevation = 5;
    return AnimationLimiter(
      child: MesWidgets.MaScrollBarListe(
               context: context,
               scrollBarColor: MesCouleurs.institutionPrimaryColor,
               child: ListView.builder(
                  physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  shrinkWrap: true,
                  primary: false,
                  padding: const EdgeInsets.all(10),
                  itemCount: liste.length,
                  itemBuilder: (BuildContext context, int index) {
                    //listeFiltrees.sort();
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(seconds: 1),
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        horizontalOffset: 40.0,
                        child: FadeInAnimation(
                          child: Container(
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
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(35),
                                          topRight: Radius.circular(35)),
                                      gradient: gradient,
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
                                              //listeFiltrees[index].logoInstitution,
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
                                              liste[index].nomInstitution,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                  color: Color(0xFF056629)),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
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
                                    trailing:  Material(
                                        elevation: elevation,
                                        color: Colors.white,
                                        shape: const CircleBorder(),
                                        clipBehavior: Clip.antiAliasWithSaveLayer,
                                        child: InkWell(
                                          splashColor: Colors.black26,
                                          onTap: (){},
                                          child: const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Icon(Icons.place, color: MesCouleurs.vert),
                                          ),
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 3, horizontal: 15),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: Text(
                                              liste[index].localInstitution,
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
                                    trailing: Material(
                                        elevation: elevation,
                                        color: Colors.white,
                                        shape: const CircleBorder(),
                                        clipBehavior: Clip.antiAliasWithSaveLayer,
                                        child: InkWell(
                                          splashColor: Colors.black26,
                                          onTap: (){MesMethodes.appelerPharmacie("+228 ${liste[index].contactsInstitution}");},
                                          child: const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Icon(Icons.phone, color: MesCouleurs.vert),
                                          ),
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 3, horizontal: 15),
                                    child: Row(
                                      children: [
                                        Text(
                                          "+228 ${liste[index].contactsInstitution}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                              color: Colors.black),
                                        ),
                                      ],
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
                          ),
                        ),
                      ),
                    );
                  }
            ),
      ),
    );
  }
  //RECHERCHE
  void maRecherche(String texteRecherche)
  {
    listeFiltrees.clear();
    if(texteRecherche.isEmpty){
      setState(() {
        return;
      });
    }
    for (var organisme in organismesListe) {
      if(organisme.nomInstitution.toLowerCase().contains(texteRecherche.toLowerCase())){
        listeFiltrees.add(organisme);
      }
    }
    setState(() {});
  }

}
