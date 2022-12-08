import 'package:flutter/material.dart';
import 'package:pharma6/utilitaires/mes_widgets.dart';

class LesMieuxNotesActivity extends StatefulWidget {
  const LesMieuxNotesActivity({Key? key}) : super(key: key);

  @override
  State<LesMieuxNotesActivity> createState() => _LesMieuxNotesActivityState();
}

class _LesMieuxNotesActivityState extends State<LesMieuxNotesActivity> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: MesWidgets.MonAppBar(
              leading: MesWidgets.MonBoutonRetour(context),
              titre: "Notez les Pharmacies"),
          body: Center(
            child: MesWidgets.PasDeCorrespondance("Notez les Pharmacies"),
          ),
        )
    );
  }
}
