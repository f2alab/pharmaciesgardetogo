import 'package:flutter/material.dart';
import 'package:pharma6/utilitaires/mes_dimensions.dart';
import 'package:pharma6/utilitaires/mes_couleurs.dart';
import 'package:pharma6/utilitaires/mes_listes.dart';
import 'package:pharma6/models/organismes_sante_liste_model.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter/services.dart';
import 'package:pharma6/utilitaires/mes_widgets.dart';

class BonaSavoirActivity extends StatefulWidget
{
  const BonaSavoirActivity({Key? key}) : super(key: key);

  @override
  State<BonaSavoirActivity> createState() => _BonaSavoirActivityState();
}

class _BonaSavoirActivityState extends State<BonaSavoirActivity>
{

  List<OrganismesSanteListeItem> organismesListe = MesListes.organismesSanteListe();
  List<OrganismesSanteListeItem> listeFiltrees = [];
  Gradient gradient = const LinearGradient(
    colors: [
      Color(0xFF1A8D77),
      Color(0xFF03866C),
      Color(0xFF015A22),
    ],
  );
  String data = '''
   ## MarkDow Texte 😀.
  - George Washington
  - John Adams
  - Thomas Jefferson.
  Le *Système Immunitaire*,
  
  ''';
  String data1 = '''
  ##Les <font color="#4555ff">Coronavirus</font> sont des <i>virus</i> de la famille des <i><b>Coronaviridae,</b></i> responsables chez l\'Homme et les animaux de maladies diverses,<i> les Infections Respiratoires</i> notamment.</p>
	<p>Ils doivent leur nom à la forme des particules virales qui rappelle une couronne.</p>
	<p>Les pathologies liées aux Coronavirus vont d\'un simple rhume aux Affections Respiratoires plus aiguës et plus chroniques comme: le <i>Syndrome Respiratoire du Moyen-Orient (MERS)</i>, provoqué par le coronavirus <i>MERS-CoV</i>, identifié en 2012; le <i>Syndrome Respiratoire aigu sévère (SRAS)</i>, provoqué par <i>le SARS-CoV</i>, identifié en 2003; la <i><b><u><font color="red">COVID-19</font></u></b></i>, provoquée par un coronavirus émergent, le <i>SARS-CoV-2</i>, qui a déclenché fin décembre 2019 une épidémie meurtrière dont souffre encore le monde entier</li>.</p>
	<p>Les Symptômes de la COVID-19 varient d\'une personne à une autre, d\'une tranche d\'âge à une autre, d\'un état de santé préalable à un autre. En général, <i>elle engendre chez l\'Homme: une fièvre, des maux de tête, des maux de ventre, des vomissements et diarrhée, une toux chronique, des essoufflements ou difficulté respiratoires, des douleurs à la poitrine, des frissons, une fatigue ou faiblesse du corps, des douleurs musculaires ou courbatures, perte de l\'odorat ou du goût</i>...<font color="blue">Si vous présentez ces symptômes, <font color="red">contactez le numéro d\'urgence</font> de votre pays/région créé à cet effet, le <font color="red">111</font> pour le Togo.</p>
	Les Vaccins sont déjà disponibles; <font color="blue">faites vous vacciner</font> et <font color="blue">respectez les mesures de barrières</font>: port du cache nez; se laver regulièrement les mains ou les désinfecter avec du gel ou une solution hydroalcoolique; si vous toussez ou éternuez, faites le dans le pli du coude ou dans un mouchoir (jetez le juste après), et aussi, tenez vous autant que possible à distantce d\'au moins 1m des personnes bien portantes; éviter de se toucher la bouche, le nez et les yeux...<p><i><font color="#088424">Prévenir vaut mieux que guérir!</font></i></p>
	]]><p>Les <font color="#4555ff">Coronavirus</font> sont des <i>virus</i> de la famille des <i><b>Coronaviridae,</b></i> responsables chez l\'Homme et les animaux de maladies diverses,<i> les Infections Respiratoires</i> notamment.</p>
	<p>Ils doivent leur nom à la forme des particules virales qui rappelle une couronne.</p>
	<p>Les pathologies liées aux Coronavirus vont d\'un simple rhume aux Affections Respiratoires plus aiguës et plus chroniques comme: le <i>Syndrome Respiratoire du Moyen-Orient (MERS)</i>, provoqué par le coronavirus <i>MERS-CoV</i>, identifié en 2012; le <i>Syndrome Respiratoire aigu sévère (SRAS)</i>, provoqué par <i>le SARS-CoV</i>, identifié en 2003; la <i><b><u><font color="red">COVID-19</font></u></b></i>, provoquée par un coronavirus émergent, le <i>SARS-CoV-2</i>, qui a déclenché fin décembre 2019 une épidémie meurtrière dont souffre encore le monde entier</li>.</p>
	<p>Les Symptômes de la COVID-19 varient d\'une personne à une autre, d\'une tranche d\'âge à une autre, d\'un état de santé préalable à un autre. En général, <i>elle engendre chez l\'Homme: une fièvre, des maux de tête, des maux de ventre, des vomissements et diarrhée, une toux chronique, des essoufflements ou difficulté respiratoires, des douleurs à la poitrine, des frissons, une fatigue ou faiblesse du corps, des douleurs musculaires ou courbatures, perte de l\'odorat ou du goût</i>...<font color="blue">Si vous présentez ces symptômes, <font color="red">contactez le numéro d\'urgence</font> de votre pays/région créé à cet effet, le <font color="red">111</font> pour le Togo.</p>
	Les Vaccins sont déjà disponibles; <font color="blue">faites vous vacciner</font> et <font color="blue">respectez les mesures de barrières</font>: port du cache nez; se laver regulièrement les mains ou les désinfecter avec du gel ou une solution hydroalcoolique; si vous toussez ou éternuez, faites le dans le pli du coude ou dans un mouchoir (jetez le juste après), et aussi, tenez vous autant que possible à distantce d\'au moins 1m des personnes bien portantes; éviter de se toucher la bouche, le nez et les yeux...<p><i><font color="#088424">Prévenir vaut mieux que guérir!</font></i></p>
	]]>
  ''';

  @override
  void dispose() {
    super.dispose();
    //STATUSBAR ET NAVIGATIONBAR COULEUR
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: MesCouleurs.vert,
      systemNavigationBarColor: MesCouleurs.vert,
    ));
  }
  @override
  Widget build(BuildContext context)
  {
    //STATUSBAR ET NAVIGATIONBAR COULEUR
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: MesCouleurs.institutionPrimaryColor,
      systemNavigationBarColor: MesCouleurs.institutionPrimaryColor,
    ));//STATUSBAR ET NAVIGATIONBAR COULEUR
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: MesCouleurs.institutionPrimaryColor,
      systemNavigationBarColor: MesCouleurs.institutionPrimaryColor,
    ));

    var largeur = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: MesCouleurs.institutionPrimaryColor,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))
            ),
            leading: MesWidgets.MonBoutonRetour(context),
            title: const Text(
              "Bon à savoir",
              style: TextStyle(
                fontSize: MesDimensions.tailleMinTexte,
              ),
            ),
            actions: [
              MesWidgets.MonTooltip(
                  message: "Recherche",
                  gradientColor: gradient,
                  child: IconButton(onPressed: (){}, icon: const Icon(Icons.search), iconSize: 20,)),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                itemCount: 20,
                itemBuilder: (context, index){
                  return Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 13),
                      child: MarkdownBody(
                        data: data,
                        selectable: true,
                        styleSheet: MarkdownStyleSheet(
                          h2Align: WrapAlignment.center,
                          h2: const TextStyle(
                            color: MesCouleurs.institutionPrimaryColor,
                          ),

                        ),
                      ),
                    ),
                  );
                }
            ),
          )
          
        )
    );
  }
}
