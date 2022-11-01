import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:pharma6/models/pharmacies_garde_model.dart';
import 'package:pharma6/utilitaires/mes_dimensions.dart';
import 'mes_couleurs.dart';
import 'package:url_launcher/url_launcher.dart';


class MesMethodes
{
  //APPEL PHARMACIE DIALOG
  static void appelDialog(BuildContext context, String nomPharma, String numero1, String numero2)
  {
    String message1 = "Elle est joignable aux numéros ci-après. Cliquez le bouton à droite des numéros pour effectuer un appel au numéro correspondant.";
    String message2 = "Elle est joignable au numéro ci-après. Cliquez le bouton à droite du numéro pour effectuer un appel.";
    const double elevation = 5;

    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35)),
        ),

        builder: (context)=> Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35)),

          ),
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
                  horizontalTitleGap: 0,
                  leading: const Icon(Icons.wechat, color: Colors.white),
                  title: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: MesDimensions.paddingVerticalCardTitre, horizontal: MesDimensions.paddingHorizontalCardTitre),
                    child: Text(
                      "CONTACTER LA $nomPharma ?",
                      style: const TextStyle(
                          fontFamily: "CenturyGothicBold",
                          fontSize: 14,
                          color: MesCouleurs.blanc),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  trailing:  Material(
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  textAlign: TextAlign.center,
                  numero2=="+228 "?message2:message1,
                  style: const TextStyle(
                    fontSize: 14,
                    fontFamily: "CenturyGothicBold",
                    color: Colors.black,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  numero1,
                  style: const TextStyle(
                    fontSize: 14,
                    color: MesCouleurs.vert,
                  ),
                ),
                trailing: Material(
                    elevation: elevation,
                    color: Colors.white,
                    shape: const CircleBorder(),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: InkWell(
                      splashColor: Colors.black26,
                      onTap: (){appelerPharmacie(numero1);},
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.phone, color: MesCouleurs.vert),
                      ),
                    )
                ),
              ),
              Visibility(
                visible: numero2=="+228 "?false:true,
                child: ListTile(
                  title: Text(
                    numero2,
                    style: const TextStyle(
                      fontSize: 14,
                      fontFamily: "CenturyGothicBold",
                      color: MesCouleurs.vert,
                    ),
                  ),
                  trailing: Material(
                      elevation: elevation,
                      color: Colors.white,
                      shape: const CircleBorder(),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: InkWell(
                        splashColor: Colors.black26,
                        onTap: (){appelerPharmacie(numero2);},
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.phone, color: MesCouleurs.vert),
                        ),
                      )
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
          //color: const Color(0xFF76065F),
        )
      /*DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.2,
          minChildSize: 0.1,
          maxChildSize: 0.3,
          builder: (context, scrollController)=>Container(
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
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                mainAxisSize: MainAxisSize.min,

                children: [
                  Card(
                    elevation: 5,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(35),
                            topRight: Radius.circular(35))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: MesDimensions.paddingVerticalCardTitre, horizontal: MesDimensions.paddingHorizontalCardTitre),
                      child: Center(
                        child: Text(
                          "CONTACTER LA $nomPharma ?",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Color(0xFF056629)),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      numero1,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    trailing: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: const Icon(Icons.phone, color:  Color(0xFF056629)),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Visibility(
                    visible: numero2=="+228 "?false:true,
                    child: ListTile(
                      title: Text(
                        numero2,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      trailing: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: const Icon(Icons.phone, color:  Color(0xFF056629)),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //color: const Color(0xFF76065F),
          ),
        )*/
    );
  }

  static void appelerPharmacie(String numero)
  {
    launchUrl(Uri(
        scheme: "tel",
        path: numero));
  }
  Future<void> _dialCall(String numero) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: numero,
    );
    await launch(launchUri.toString());
  }

}
