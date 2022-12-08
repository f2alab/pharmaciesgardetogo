import 'package:flutter/material.dart';
import 'package:pharma6/models/pharmacies_liste_model.dart';
import 'informations_pharmacies_lome.dart';
import 'informations_pharmacies_kara.dart';
import 'informations_organismes_sante.dart';
import 'package:pharma6/models/organismes_sante_liste_model.dart';
import 'package:pharma6/models/accueil_card_model.dart';

class MesListes {
  //LOME LISTE
  static List<PharmaciesListeModels> lomeListe() {
    return [
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH1,
          pharmaLOC:  InformationsPharmaciesLome.locPH1,
          pharmaCONT1:InformationsPharmaciesLome.contPH1_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH1_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH2,
          pharmaLOC:  InformationsPharmaciesLome.locPH2,
          pharmaCONT1:InformationsPharmaciesLome.contPH2_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH2_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH3,
          pharmaLOC:  InformationsPharmaciesLome.locPH3,
          pharmaCONT1:InformationsPharmaciesLome.contPH3_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH3_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH4,
          pharmaLOC:  InformationsPharmaciesLome.locPH4,
          pharmaCONT1:InformationsPharmaciesLome.contPH4_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH4_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH5,
          pharmaLOC:  InformationsPharmaciesLome.locPH5,
          pharmaCONT1:InformationsPharmaciesLome.contPH5_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH5_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH6,
          pharmaLOC:  InformationsPharmaciesLome.locPH6,
          pharmaCONT1:InformationsPharmaciesLome.contPH6_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH6_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH7,
          pharmaLOC:  InformationsPharmaciesLome.locPH7,
          pharmaCONT1:InformationsPharmaciesLome.contPH7_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH7_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH8,
          pharmaLOC:  InformationsPharmaciesLome.locPH8,
          pharmaCONT1:InformationsPharmaciesLome.contPH8_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH8_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH9,
          pharmaLOC:  InformationsPharmaciesLome.locPH9,
          pharmaCONT1:InformationsPharmaciesLome.contPH9_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH9_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH10,
          pharmaLOC:  InformationsPharmaciesLome.locPH10,
          pharmaCONT1:InformationsPharmaciesLome.contPH10_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH10_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH11,
          pharmaLOC:  InformationsPharmaciesLome.locPH11,
          pharmaCONT1:InformationsPharmaciesLome.contPH11_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH11_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH12,
          pharmaLOC:  InformationsPharmaciesLome.locPH12,
          pharmaCONT1:InformationsPharmaciesLome.contPH12_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH12_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH13,
          pharmaLOC:  InformationsPharmaciesLome.locPH13,
          pharmaCONT1:InformationsPharmaciesLome.contPH13_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH13_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH14,
          pharmaLOC:  InformationsPharmaciesLome.locPH14,
          pharmaCONT1:InformationsPharmaciesLome.contPH14_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH14_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH15,
          pharmaLOC:  InformationsPharmaciesLome.locPH15,
          pharmaCONT1:InformationsPharmaciesLome.contPH15_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH15_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH16,
          pharmaLOC:  InformationsPharmaciesLome.locPH16,
          pharmaCONT1:InformationsPharmaciesLome.contPH16_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH16_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH17,
          pharmaLOC:  InformationsPharmaciesLome.locPH17,
          pharmaCONT1:InformationsPharmaciesLome.contPH17_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH17_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH18,
          pharmaLOC:  InformationsPharmaciesLome.locPH18,
          pharmaCONT1:InformationsPharmaciesLome.contPH18_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH18_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH19,
          pharmaLOC:  InformationsPharmaciesLome.locPH19,
          pharmaCONT1:InformationsPharmaciesLome.contPH19_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH19_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH20,
          pharmaLOC:  InformationsPharmaciesLome.locPH20,
          pharmaCONT1:InformationsPharmaciesLome.contPH20_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH20_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH21,
          pharmaLOC:  InformationsPharmaciesLome.locPH21,
          pharmaCONT1:InformationsPharmaciesLome.contPH21_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH21_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH22,
          pharmaLOC:  InformationsPharmaciesLome.locPH22,
          pharmaCONT1:InformationsPharmaciesLome.contPH22_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH22_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH23,
          pharmaLOC:  InformationsPharmaciesLome.locPH23,
          pharmaCONT1:InformationsPharmaciesLome.contPH23_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH23_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH24,
          pharmaLOC:  InformationsPharmaciesLome.locPH24,
          pharmaCONT1:InformationsPharmaciesLome.contPH24_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH24_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH25,
          pharmaLOC:  InformationsPharmaciesLome.locPH25,
          pharmaCONT1:InformationsPharmaciesLome.contPH25_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH25_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH26,
          pharmaLOC:  InformationsPharmaciesLome.locPH26,
          pharmaCONT1:InformationsPharmaciesLome.contPH26_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH26_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH27,
          pharmaLOC:  InformationsPharmaciesLome.locPH27,
          pharmaCONT1:InformationsPharmaciesLome.contPH27_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH27_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH28,
          pharmaLOC:  InformationsPharmaciesLome.locPH28,
          pharmaCONT1:InformationsPharmaciesLome.contPH28_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH28_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH29,
          pharmaLOC:  InformationsPharmaciesLome.locPH29,
          pharmaCONT1:InformationsPharmaciesLome.contPH29_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH29_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH30,
          pharmaLOC:  InformationsPharmaciesLome.locPH30,
          pharmaCONT1:InformationsPharmaciesLome.contPH30_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH30_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH31,
          pharmaLOC:  InformationsPharmaciesLome.locPH31,
          pharmaCONT1:InformationsPharmaciesLome.contPH31_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH31_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH32,
          pharmaLOC:  InformationsPharmaciesLome.locPH32,
          pharmaCONT1:InformationsPharmaciesLome.contPH32_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH32_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH33,
          pharmaLOC:  InformationsPharmaciesLome.locPH33,
          pharmaCONT1:InformationsPharmaciesLome.contPH33_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH33_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH34,
          pharmaLOC:  InformationsPharmaciesLome.locPH34,
          pharmaCONT1:InformationsPharmaciesLome.contPH34_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH34_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH35,
          pharmaLOC:  InformationsPharmaciesLome.locPH35,
          pharmaCONT1:InformationsPharmaciesLome.contPH35_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH35_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH36,
          pharmaLOC:  InformationsPharmaciesLome.locPH36,
          pharmaCONT1:InformationsPharmaciesLome.contPH36_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH36_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH37,
          pharmaLOC:  InformationsPharmaciesLome.locPH37,
          pharmaCONT1:InformationsPharmaciesLome.contPH37_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH37_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH38,
          pharmaLOC:  InformationsPharmaciesLome.locPH38,
          pharmaCONT1:InformationsPharmaciesLome.contPH38_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH38_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH39,
          pharmaLOC:  InformationsPharmaciesLome.locPH39,
          pharmaCONT1:InformationsPharmaciesLome.contPH39_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH39_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH40,
          pharmaLOC:  InformationsPharmaciesLome.locPH40,
          pharmaCONT1:InformationsPharmaciesLome.contPH40_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH40_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH41,
          pharmaLOC:  InformationsPharmaciesLome.locPH41,
          pharmaCONT1:InformationsPharmaciesLome.contPH41_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH41_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH42,
          pharmaLOC:  InformationsPharmaciesLome.locPH42,
          pharmaCONT1:InformationsPharmaciesLome.contPH42_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH42_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH43,
          pharmaLOC:  InformationsPharmaciesLome.locPH43,
          pharmaCONT1:InformationsPharmaciesLome.contPH43_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH43_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH44,
          pharmaLOC:  InformationsPharmaciesLome.locPH44,
          pharmaCONT1:InformationsPharmaciesLome.contPH44_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH44_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH45,
          pharmaLOC:  InformationsPharmaciesLome.locPH45,
          pharmaCONT1:InformationsPharmaciesLome.contPH45_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH45_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH46,
          pharmaLOC:  InformationsPharmaciesLome.locPH46,
          pharmaCONT1:InformationsPharmaciesLome.contPH46_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH46_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH47,
          pharmaLOC:  InformationsPharmaciesLome.locPH47,
          pharmaCONT1:InformationsPharmaciesLome.contPH47_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH47_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH48,
          pharmaLOC:  InformationsPharmaciesLome.locPH48,
          pharmaCONT1:InformationsPharmaciesLome.contPH48_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH48_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH49,
          pharmaLOC:  InformationsPharmaciesLome.locPH49,
          pharmaCONT1:InformationsPharmaciesLome.contPH49_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH49_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH50,
          pharmaLOC:  InformationsPharmaciesLome.locPH50,
          pharmaCONT1:InformationsPharmaciesLome.contPH50_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH50_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH51,
          pharmaLOC:  InformationsPharmaciesLome.locPH51,
          pharmaCONT1:InformationsPharmaciesLome.contPH51_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH51_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH52,
          pharmaLOC:  InformationsPharmaciesLome.locPH52,
          pharmaCONT1:InformationsPharmaciesLome.contPH52_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH52_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH53,
          pharmaLOC:  InformationsPharmaciesLome.locPH53,
          pharmaCONT1:InformationsPharmaciesLome.contPH53_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH53_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH54,
          pharmaLOC:  InformationsPharmaciesLome.locPH54,
          pharmaCONT1:InformationsPharmaciesLome.contPH54_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH54_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH55,
          pharmaLOC:  InformationsPharmaciesLome.locPH55,
          pharmaCONT1:InformationsPharmaciesLome.contPH55_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH55_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH56,
          pharmaLOC:  InformationsPharmaciesLome.locPH56,
          pharmaCONT1:InformationsPharmaciesLome.contPH56_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH56_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH57,
          pharmaLOC:  InformationsPharmaciesLome.locPH57,
          pharmaCONT1:InformationsPharmaciesLome.contPH57_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH57_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH58,
          pharmaLOC:  InformationsPharmaciesLome.locPH58,
          pharmaCONT1:InformationsPharmaciesLome.contPH58_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH58_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH59,
          pharmaLOC:  InformationsPharmaciesLome.locPH59,
          pharmaCONT1:InformationsPharmaciesLome.contPH59_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH59_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH60,
          pharmaLOC:  InformationsPharmaciesLome.locPH60,
          pharmaCONT1:InformationsPharmaciesLome.contPH60_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH60_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH61,
          pharmaLOC:  InformationsPharmaciesLome.locPH61,
          pharmaCONT1:InformationsPharmaciesLome.contPH61_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH61_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH62,
          pharmaLOC:  InformationsPharmaciesLome.locPH62,
          pharmaCONT1:InformationsPharmaciesLome.contPH62_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH62_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH63,
          pharmaLOC:  InformationsPharmaciesLome.locPH63,
          pharmaCONT1:InformationsPharmaciesLome.contPH63_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH63_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH64,
          pharmaLOC:  InformationsPharmaciesLome.locPH64,
          pharmaCONT1:InformationsPharmaciesLome.contPH64_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH64_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH65,
          pharmaLOC:  InformationsPharmaciesLome.locPH65,
          pharmaCONT1:InformationsPharmaciesLome.contPH65_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH65_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH66,
          pharmaLOC:  InformationsPharmaciesLome.locPH66,
          pharmaCONT1:InformationsPharmaciesLome.contPH66_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH66_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH67,
          pharmaLOC:  InformationsPharmaciesLome.locPH67,
          pharmaCONT1:InformationsPharmaciesLome.contPH67_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH67_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH68,
          pharmaLOC:  InformationsPharmaciesLome.locPH68,
          pharmaCONT1:InformationsPharmaciesLome.contPH68_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH68_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH69,
          pharmaLOC:  InformationsPharmaciesLome.locPH69,
          pharmaCONT1:InformationsPharmaciesLome.contPH69_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH69_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH70,
          pharmaLOC:  InformationsPharmaciesLome.locPH70,
          pharmaCONT1:InformationsPharmaciesLome.contPH70_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH70_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH71,
          pharmaLOC:  InformationsPharmaciesLome.locPH71,
          pharmaCONT1:InformationsPharmaciesLome.contPH71_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH71_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH72,
          pharmaLOC:  InformationsPharmaciesLome.locPH72,
          pharmaCONT1:InformationsPharmaciesLome.contPH72_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH72_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH73,
          pharmaLOC:  InformationsPharmaciesLome.locPH73,
          pharmaCONT1:InformationsPharmaciesLome.contPH73_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH73_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH74,
          pharmaLOC:  InformationsPharmaciesLome.locPH74,
          pharmaCONT1:InformationsPharmaciesLome.contPH74_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH74_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH75,
          pharmaLOC:  InformationsPharmaciesLome.locPH75,
          pharmaCONT1:InformationsPharmaciesLome.contPH75_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH75_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH76,
          pharmaLOC:  InformationsPharmaciesLome.locPH76,
          pharmaCONT1:InformationsPharmaciesLome.contPH76_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH76_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH77,
          pharmaLOC:  InformationsPharmaciesLome.locPH77,
          pharmaCONT1:InformationsPharmaciesLome.contPH77_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH77_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH78,
          pharmaLOC:  InformationsPharmaciesLome.locPH78,
          pharmaCONT1:InformationsPharmaciesLome.contPH78_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH78_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH79,
          pharmaLOC:  InformationsPharmaciesLome.locPH79,
          pharmaCONT1:InformationsPharmaciesLome.contPH79_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH79_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH80,
          pharmaLOC:  InformationsPharmaciesLome.locPH80,
          pharmaCONT1:InformationsPharmaciesLome.contPH80_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH80_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH81,
          pharmaLOC:  InformationsPharmaciesLome.locPH81,
          pharmaCONT1:InformationsPharmaciesLome.contPH81_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH81_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH82,
          pharmaLOC:  InformationsPharmaciesLome.locPH82,
          pharmaCONT1:InformationsPharmaciesLome.contPH82_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH82_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH83,
          pharmaLOC:  InformationsPharmaciesLome.locPH83,
          pharmaCONT1:InformationsPharmaciesLome.contPH83_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH83_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH84,
          pharmaLOC:  InformationsPharmaciesLome.locPH84,
          pharmaCONT1:InformationsPharmaciesLome.contPH84_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH84_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH85,
          pharmaLOC:  InformationsPharmaciesLome.locPH85,
          pharmaCONT1:InformationsPharmaciesLome.contPH85_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH85_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH86,
          pharmaLOC:  InformationsPharmaciesLome.locPH86,
          pharmaCONT1:InformationsPharmaciesLome.contPH86_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH86_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH87,
          pharmaLOC:  InformationsPharmaciesLome.locPH87,
          pharmaCONT1:InformationsPharmaciesLome.contPH87_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH87_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH88,
          pharmaLOC:  InformationsPharmaciesLome.locPH88,
          pharmaCONT1:InformationsPharmaciesLome.contPH88_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH88_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH89,
          pharmaLOC:  InformationsPharmaciesLome.locPH89,
          pharmaCONT1:InformationsPharmaciesLome.contPH89_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH89_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH90,
          pharmaLOC:  InformationsPharmaciesLome.locPH90,
          pharmaCONT1:InformationsPharmaciesLome.contPH90_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH90_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH91,
          pharmaLOC:  InformationsPharmaciesLome.locPH91,
          pharmaCONT1:InformationsPharmaciesLome.contPH91_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH91_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH92,
          pharmaLOC:  InformationsPharmaciesLome.locPH92,
          pharmaCONT1:InformationsPharmaciesLome.contPH92_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH92_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH93,
          pharmaLOC:  InformationsPharmaciesLome.locPH93,
          pharmaCONT1:InformationsPharmaciesLome.contPH93_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH93_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH94,
          pharmaLOC:  InformationsPharmaciesLome.locPH94,
          pharmaCONT1:InformationsPharmaciesLome.contPH94_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH94_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH95,
          pharmaLOC:  InformationsPharmaciesLome.locPH95,
          pharmaCONT1:InformationsPharmaciesLome.contPH95_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH95_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH96,
          pharmaLOC:  InformationsPharmaciesLome.locPH96,
          pharmaCONT1:InformationsPharmaciesLome.contPH96_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH96_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH97,
          pharmaLOC:  InformationsPharmaciesLome.locPH97,
          pharmaCONT1:InformationsPharmaciesLome.contPH97_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH97_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH98,
          pharmaLOC:  InformationsPharmaciesLome.locPH98,
          pharmaCONT1:InformationsPharmaciesLome.contPH98_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH98_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH99,
          pharmaLOC:  InformationsPharmaciesLome.locPH99,
          pharmaCONT1:InformationsPharmaciesLome.contPH99_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH99_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH100,
          pharmaLOC:  InformationsPharmaciesLome.locPH100,
          pharmaCONT1:InformationsPharmaciesLome.contPH100_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH100_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH101,
          pharmaLOC:  InformationsPharmaciesLome.locPH101,
          pharmaCONT1:InformationsPharmaciesLome.contPH101_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH101_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH102,
          pharmaLOC:  InformationsPharmaciesLome.locPH102,
          pharmaCONT1:InformationsPharmaciesLome.contPH102_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH102_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH103,
          pharmaLOC:  InformationsPharmaciesLome.locPH103,
          pharmaCONT1:InformationsPharmaciesLome.contPH103_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH103_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH104,
          pharmaLOC:  InformationsPharmaciesLome.locPH104,
          pharmaCONT1:InformationsPharmaciesLome.contPH104_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH104_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH105,
          pharmaLOC:  InformationsPharmaciesLome.locPH105,
          pharmaCONT1:InformationsPharmaciesLome.contPH105_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH105_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH106,
          pharmaLOC:  InformationsPharmaciesLome.locPH106,
          pharmaCONT1:InformationsPharmaciesLome.contPH106_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH106_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH107,
          pharmaLOC:  InformationsPharmaciesLome.locPH107,
          pharmaCONT1:InformationsPharmaciesLome.contPH107_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH107_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH108,
          pharmaLOC:  InformationsPharmaciesLome.locPH108,
          pharmaCONT1:InformationsPharmaciesLome.contPH108_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH108_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH109,
          pharmaLOC:  InformationsPharmaciesLome.locPH109,
          pharmaCONT1:InformationsPharmaciesLome.contPH109_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH109_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH110,
          pharmaLOC:  InformationsPharmaciesLome.locPH110,
          pharmaCONT1:InformationsPharmaciesLome.contPH110_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH110_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH111,
          pharmaLOC:  InformationsPharmaciesLome.locPH111,
          pharmaCONT1:InformationsPharmaciesLome.contPH111_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH111_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH112,
          pharmaLOC:  InformationsPharmaciesLome.locPH112,
          pharmaCONT1:InformationsPharmaciesLome.contPH112_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH112_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH113,
          pharmaLOC:  InformationsPharmaciesLome.locPH113,
          pharmaCONT1:InformationsPharmaciesLome.contPH113_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH113_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH114,
          pharmaLOC:  InformationsPharmaciesLome.locPH114,
          pharmaCONT1:InformationsPharmaciesLome.contPH114_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH114_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH115,
          pharmaLOC:  InformationsPharmaciesLome.locPH115,
          pharmaCONT1:InformationsPharmaciesLome.contPH115_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH115_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH116,
          pharmaLOC:  InformationsPharmaciesLome.locPH116,
          pharmaCONT1:InformationsPharmaciesLome.contPH116_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH116_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH117,
          pharmaLOC:  InformationsPharmaciesLome.locPH117,
          pharmaCONT1:InformationsPharmaciesLome.contPH117_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH117_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH118,
          pharmaLOC:  InformationsPharmaciesLome.locPH118,
          pharmaCONT1:InformationsPharmaciesLome.contPH118_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH118_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH119,
          pharmaLOC:  InformationsPharmaciesLome.locPH119,
          pharmaCONT1:InformationsPharmaciesLome.contPH119_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH119_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH120,
          pharmaLOC:  InformationsPharmaciesLome.locPH120,
          pharmaCONT1:InformationsPharmaciesLome.contPH120_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH120_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH121,
          pharmaLOC:  InformationsPharmaciesLome.locPH121,
          pharmaCONT1:InformationsPharmaciesLome.contPH121_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH121_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH122,
          pharmaLOC:  InformationsPharmaciesLome.locPH122,
          pharmaCONT1:InformationsPharmaciesLome.contPH122_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH122_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH123,
          pharmaLOC:  InformationsPharmaciesLome.locPH123,
          pharmaCONT1:InformationsPharmaciesLome.contPH123_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH123_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH124,
          pharmaLOC:  InformationsPharmaciesLome.locPH124,
          pharmaCONT1:InformationsPharmaciesLome.contPH124_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH124_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH125,
          pharmaLOC:  InformationsPharmaciesLome.locPH125,
          pharmaCONT1:InformationsPharmaciesLome.contPH125_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH125_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH126,
          pharmaLOC:  InformationsPharmaciesLome.locPH126,
          pharmaCONT1:InformationsPharmaciesLome.contPH126_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH126_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH127,
          pharmaLOC:  InformationsPharmaciesLome.locPH127,
          pharmaCONT1:InformationsPharmaciesLome.contPH127_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH127_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH128,
          pharmaLOC:  InformationsPharmaciesLome.locPH128,
          pharmaCONT1:InformationsPharmaciesLome.contPH128_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH128_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH129,
          pharmaLOC:  InformationsPharmaciesLome.locPH129,
          pharmaCONT1:InformationsPharmaciesLome.contPH129_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH129_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH130,
          pharmaLOC:  InformationsPharmaciesLome.locPH130,
          pharmaCONT1:InformationsPharmaciesLome.contPH130_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH130_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH131,
          pharmaLOC:  InformationsPharmaciesLome.locPH131,
          pharmaCONT1:InformationsPharmaciesLome.contPH131_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH131_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH132,
          pharmaLOC:  InformationsPharmaciesLome.locPH132,
          pharmaCONT1:InformationsPharmaciesLome.contPH132_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH132_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH133,
          pharmaLOC:  InformationsPharmaciesLome.locPH133,
          pharmaCONT1:InformationsPharmaciesLome.contPH133_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH133_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH134,
          pharmaLOC:  InformationsPharmaciesLome.locPH134,
          pharmaCONT1:InformationsPharmaciesLome.contPH134_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH134_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH135,
          pharmaLOC:  InformationsPharmaciesLome.locPH135,
          pharmaCONT1:InformationsPharmaciesLome.contPH135_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH135_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH136,
          pharmaLOC:  InformationsPharmaciesLome.locPH136,
          pharmaCONT1:InformationsPharmaciesLome.contPH136_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH136_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH137,
          pharmaLOC:  InformationsPharmaciesLome.locPH137,
          pharmaCONT1:InformationsPharmaciesLome.contPH137_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH137_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH138,
          pharmaLOC:  InformationsPharmaciesLome.locPH138,
          pharmaCONT1:InformationsPharmaciesLome.contPH138_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH138_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH139,
          pharmaLOC:  InformationsPharmaciesLome.locPH139,
          pharmaCONT1:InformationsPharmaciesLome.contPH139_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH139_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH140,
          pharmaLOC:  InformationsPharmaciesLome.locPH140,
          pharmaCONT1:InformationsPharmaciesLome.contPH140_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH140_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH141,
          pharmaLOC:  InformationsPharmaciesLome.locPH141,
          pharmaCONT1:InformationsPharmaciesLome.contPH141_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH141_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH142,
          pharmaLOC:  InformationsPharmaciesLome.locPH142,
          pharmaCONT1:InformationsPharmaciesLome.contPH142_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH142_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH143,
          pharmaLOC:  InformationsPharmaciesLome.locPH143,
          pharmaCONT1:InformationsPharmaciesLome.contPH143_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH143_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH144,
          pharmaLOC:  InformationsPharmaciesLome.locPH144,
          pharmaCONT1:InformationsPharmaciesLome.contPH144_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH144_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH145,
          pharmaLOC:  InformationsPharmaciesLome.locPH145,
          pharmaCONT1:InformationsPharmaciesLome.contPH145_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH145_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH146,
          pharmaLOC:  InformationsPharmaciesLome.locPH146,
          pharmaCONT1:InformationsPharmaciesLome.contPH146_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH146_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH147,
          pharmaLOC:  InformationsPharmaciesLome.locPH147,
          pharmaCONT1:InformationsPharmaciesLome.contPH147_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH147_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH148,
          pharmaLOC:  InformationsPharmaciesLome.locPH148,
          pharmaCONT1:InformationsPharmaciesLome.contPH148_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH148_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH149,
          pharmaLOC:  InformationsPharmaciesLome.locPH149,
          pharmaCONT1:InformationsPharmaciesLome.contPH149_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH149_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH150,
          pharmaLOC:  InformationsPharmaciesLome.locPH150,
          pharmaCONT1:InformationsPharmaciesLome.contPH150_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH150_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH151,
          pharmaLOC:  InformationsPharmaciesLome.locPH151,
          pharmaCONT1:InformationsPharmaciesLome.contPH151_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH151_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH152,
          pharmaLOC:  InformationsPharmaciesLome.locPH152,
          pharmaCONT1:InformationsPharmaciesLome.contPH152_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH152_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH153,
          pharmaLOC:  InformationsPharmaciesLome.locPH153,
          pharmaCONT1:InformationsPharmaciesLome.contPH153_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH153_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH154,
          pharmaLOC:  InformationsPharmaciesLome.locPH154,
          pharmaCONT1:InformationsPharmaciesLome.contPH154_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH154_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH155,
          pharmaLOC:  InformationsPharmaciesLome.locPH155,
          pharmaCONT1:InformationsPharmaciesLome.contPH155_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH155_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH156,
          pharmaLOC:  InformationsPharmaciesLome.locPH156,
          pharmaCONT1:InformationsPharmaciesLome.contPH156_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH156_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH157,
          pharmaLOC:  InformationsPharmaciesLome.locPH157,
          pharmaCONT1:InformationsPharmaciesLome.contPH157_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH157_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH158,
          pharmaLOC:  InformationsPharmaciesLome.locPH158,
          pharmaCONT1:InformationsPharmaciesLome.contPH158_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH158_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH159,
          pharmaLOC:  InformationsPharmaciesLome.locPH159,
          pharmaCONT1:InformationsPharmaciesLome.contPH159_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH159_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH160,
          pharmaLOC:  InformationsPharmaciesLome.locPH160,
          pharmaCONT1:InformationsPharmaciesLome.contPH160_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH160_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH161,
          pharmaLOC:  InformationsPharmaciesLome.locPH161,
          pharmaCONT1:InformationsPharmaciesLome.contPH161_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH161_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH162,
          pharmaLOC:  InformationsPharmaciesLome.locPH162,
          pharmaCONT1:InformationsPharmaciesLome.contPH162_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH162_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH163,
          pharmaLOC:  InformationsPharmaciesLome.locPH163,
          pharmaCONT1:InformationsPharmaciesLome.contPH163_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH163_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH164,
          pharmaLOC:  InformationsPharmaciesLome.locPH164,
          pharmaCONT1:InformationsPharmaciesLome.contPH164_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH164_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH165,
          pharmaLOC:  InformationsPharmaciesLome.locPH165,
          pharmaCONT1:InformationsPharmaciesLome.contPH165_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH165_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH166,
          pharmaLOC:  InformationsPharmaciesLome.locPH166,
          pharmaCONT1:InformationsPharmaciesLome.contPH166_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH166_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH167,
          pharmaLOC:  InformationsPharmaciesLome.locPH167,
          pharmaCONT1:InformationsPharmaciesLome.contPH167_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH167_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH168,
          pharmaLOC:  InformationsPharmaciesLome.locPH168,
          pharmaCONT1:InformationsPharmaciesLome.contPH168_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH168_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH169,
          pharmaLOC:  InformationsPharmaciesLome.locPH169,
          pharmaCONT1:InformationsPharmaciesLome.contPH169_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH169_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH170,
          pharmaLOC:  InformationsPharmaciesLome.locPH170,
          pharmaCONT1:InformationsPharmaciesLome.contPH170_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH170_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH171,
          pharmaLOC:  InformationsPharmaciesLome.locPH171,
          pharmaCONT1:InformationsPharmaciesLome.contPH171_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH171_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH172,
          pharmaLOC:  InformationsPharmaciesLome.locPH172,
          pharmaCONT1:InformationsPharmaciesLome.contPH172_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH172_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH173,
          pharmaLOC:  InformationsPharmaciesLome.locPH173,
          pharmaCONT1:InformationsPharmaciesLome.contPH173_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH173_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH174,
          pharmaLOC:  InformationsPharmaciesLome.locPH174,
          pharmaCONT1:InformationsPharmaciesLome.contPH174_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH174_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH175,
          pharmaLOC:  InformationsPharmaciesLome.locPH175,
          pharmaCONT1:InformationsPharmaciesLome.contPH175_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH175_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH176,
          pharmaLOC:  InformationsPharmaciesLome.locPH176,
          pharmaCONT1:InformationsPharmaciesLome.contPH176_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH176_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH177,
          pharmaLOC:  InformationsPharmaciesLome.locPH177,
          pharmaCONT1:InformationsPharmaciesLome.contPH177_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH177_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH178,
          pharmaLOC:  InformationsPharmaciesLome.locPH178,
          pharmaCONT1:InformationsPharmaciesLome.contPH178_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH178_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH179,
          pharmaLOC:  InformationsPharmaciesLome.locPH179,
          pharmaCONT1:InformationsPharmaciesLome.contPH179_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH179_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH180,
          pharmaLOC:  InformationsPharmaciesLome.locPH180,
          pharmaCONT1:InformationsPharmaciesLome.contPH180_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH180_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH181,
          pharmaLOC:  InformationsPharmaciesLome.locPH181,
          pharmaCONT1:InformationsPharmaciesLome.contPH181_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH181_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH182,
          pharmaLOC:  InformationsPharmaciesLome.locPH182,
          pharmaCONT1:InformationsPharmaciesLome.contPH182_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH182_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH183,
          pharmaLOC:  InformationsPharmaciesLome.locPH183,
          pharmaCONT1:InformationsPharmaciesLome.contPH183_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH183_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH184,
          pharmaLOC:  InformationsPharmaciesLome.locPH184,
          pharmaCONT1:InformationsPharmaciesLome.contPH184_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH184_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH185,
          pharmaLOC:  InformationsPharmaciesLome.locPH185,
          pharmaCONT1:InformationsPharmaciesLome.contPH185_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH185_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH186,
          pharmaLOC:  InformationsPharmaciesLome.locPH186,
          pharmaCONT1:InformationsPharmaciesLome.contPH186_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH186_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH187,
          pharmaLOC:  InformationsPharmaciesLome.locPH187,
          pharmaCONT1:InformationsPharmaciesLome.contPH187_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH187_2),
    ];
  }
  /*static List<PharmaciesListeModels> lomeListe(){
    return [
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH1,
          pharmaLOC:  InformationsPharmaciesLome.locPH1,
          pharmaCONT1:InformationsPharmaciesLome.contPH1_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH1_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH2,
          pharmaLOC:  InformationsPharmaciesLome.locPH2,
          pharmaCONT1:InformationsPharmaciesLome.contPH2_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH2_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesLome.nomPH3,
          pharmaLOC:  InformationsPharmaciesLome.locPH3,
          pharmaCONT1:InformationsPharmaciesLome.contPH3_1,
          pharmaCONT2:InformationsPharmaciesLome.contPH3_2),
    ];
  }*/

  //KARA LISTE
  static List<PharmaciesListeModels> karaListe() {
    return [
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesKara.nomPHK1,
          pharmaLOC:  InformationsPharmaciesKara.locPHK1,
          pharmaCONT1:InformationsPharmaciesKara.contPHK1_1,
          pharmaCONT2:InformationsPharmaciesKara.contPHK1_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesKara.nomPHK2,
          pharmaLOC:  InformationsPharmaciesKara.locPHK2,
          pharmaCONT1:InformationsPharmaciesKara.contPHK2_1,
          pharmaCONT2:InformationsPharmaciesKara.contPHK2_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesKara.nomPHK3,
          pharmaLOC:  InformationsPharmaciesKara.locPHK3,
          pharmaCONT1:InformationsPharmaciesKara.contPHK3_1,
          pharmaCONT2:InformationsPharmaciesKara.contPHK3_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesKara.nomPHK4,
          pharmaLOC:  InformationsPharmaciesKara.locPHK4,
          pharmaCONT1:InformationsPharmaciesKara.contPHK4_1,
          pharmaCONT2:InformationsPharmaciesKara.contPHK4_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesKara.nomPHK5,
          pharmaLOC:  InformationsPharmaciesKara.locPHK5,
          pharmaCONT1:InformationsPharmaciesKara.contPHK5_1,
          pharmaCONT2:InformationsPharmaciesKara.contPHK5_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesKara.nomPHK6,
          pharmaLOC:  InformationsPharmaciesKara.locPHK6,
          pharmaCONT1:InformationsPharmaciesKara.contPHK6_1,
          pharmaCONT2:InformationsPharmaciesKara.contPHK6_2),
      PharmaciesListeModels(
          pharmaNOM:  InformationsPharmaciesKara.nomPHK7,
          pharmaLOC:  InformationsPharmaciesKara.locPHK7,
          pharmaCONT1:InformationsPharmaciesKara.contPHK7_1,
          pharmaCONT2:InformationsPharmaciesKara.contPHK7_2),
    ];
  }

  //ACCUEIL CARD LISTE
  static List<AccueilCardModel> accueilCardListe() {
    return [
      AccueilCardModel(1, "Pharmacies\nde Garde", "images/logopharma.png"),
      AccueilCardModel(2, "Annuaire de\nPharmacies", "images/annuaire.png"),
      AccueilCardModel(3, "Organismes\nde Santé", "images/organisme.png"),
      AccueilCardModel(4, "Bon à\nSavoir", "images/bonasavoir.png"),
      AccueilCardModel(5, "Donnez\nVotre Avis", "images/feedback.png"),
      AccueilCardModel(6, "Info sur \nl'Application", "images/apropo.png"),
    ];
  }
  /*static List<AccueilCardModel> accueilCardListe() {
    return [
      AccueilCardModel(1, "Pharmacies\nde Garde", Icons.account_balance),
      AccueilCardModel(2, "Annuaire de\nPharmacies", Icons.add_business),
      AccueilCardModel(3, "Organismes\nde Santé", Icons.add_business),
      AccueilCardModel(4, "Bon à\nSavoir", Icons.account_balance),
      AccueilCardModel(5, "Donnez\nVotre Avis", Icons.person),
      AccueilCardModel(6, "Info sur \nl'Application", Icons.add_card_sharp),
    ];
  }*/

  //LISTE ORGANISMES DE SANTE
  static List<OrganismesSanteListeItem> organismesSanteListe() {
    return [
      OrganismesSanteListeItem(
          Icons.account_balance,
          InformationsOrganismesSante.nomInstitution1,
          InformationsOrganismesSante.locInstitution1,
          InformationsOrganismesSante.contInstitution1),
      OrganismesSanteListeItem(
          Icons.account_balance,
          InformationsOrganismesSante.nomInstitution2,
          InformationsOrganismesSante.locInstitution2,
          InformationsOrganismesSante.contInstitution2),
      OrganismesSanteListeItem(
          Icons.account_balance,
          InformationsOrganismesSante.nomInstitution3,
          InformationsOrganismesSante.locInstitution3,
          InformationsOrganismesSante.contInstitution3),
      OrganismesSanteListeItem(
          Icons.account_balance,
          InformationsOrganismesSante.nomInstitution4,
          InformationsOrganismesSante.locInstitution4,
          InformationsOrganismesSante.contInstitution4),
      OrganismesSanteListeItem(
          Icons.account_balance,
          InformationsOrganismesSante.nomInstitution5,
          InformationsOrganismesSante.locInstitution5,
          InformationsOrganismesSante.contInstitution5),
      OrganismesSanteListeItem(
          Icons.account_balance,
          InformationsOrganismesSante.nomInstitution6,
          InformationsOrganismesSante.locInstitution6,
          InformationsOrganismesSante.contInstitution6),
      OrganismesSanteListeItem(
          Icons.account_balance,
          InformationsOrganismesSante.nomInstitution7,
          InformationsOrganismesSante.locInstitution7,
          InformationsOrganismesSante.contInstitution7),
      OrganismesSanteListeItem(
          Icons.account_balance,
          InformationsOrganismesSante.nomInstitution8,
          InformationsOrganismesSante.locInstitution8,
          InformationsOrganismesSante.contInstitution8),
      OrganismesSanteListeItem(
          Icons.account_balance,
          InformationsOrganismesSante.nomInstitution9,
          InformationsOrganismesSante.locInstitution9,
          InformationsOrganismesSante.contInstitution9),
      OrganismesSanteListeItem(
          Icons.account_balance,
          InformationsOrganismesSante.nomInstitution10,
          InformationsOrganismesSante.locInstitution10,
          InformationsOrganismesSante.contInstitution10),
      OrganismesSanteListeItem(
          Icons.account_balance,
          InformationsOrganismesSante.nomInstitution11,
          InformationsOrganismesSante.locInstitution11,
          InformationsOrganismesSante.contInstitution11),
      OrganismesSanteListeItem(
          Icons.account_balance,
          InformationsOrganismesSante.nomInstitution12,
          InformationsOrganismesSante.locInstitution12,
          InformationsOrganismesSante.contInstitution12),
      OrganismesSanteListeItem(
          Icons.account_balance,
          InformationsOrganismesSante.nomInstitution13,
          InformationsOrganismesSante.locInstitution13,
          InformationsOrganismesSante.contInstitution13),
      OrganismesSanteListeItem(
          Icons.account_balance,
          InformationsOrganismesSante.nomInstitution14,
          InformationsOrganismesSante.locInstitution14,
          InformationsOrganismesSante.contInstitution14),
      OrganismesSanteListeItem(
          Icons.account_balance,
          InformationsOrganismesSante.nomInstitution15,
          InformationsOrganismesSante.locInstitution15,
          InformationsOrganismesSante.contInstitution15),
      OrganismesSanteListeItem(
          Icons.account_balance,
          InformationsOrganismesSante.nomInstitution16,
          InformationsOrganismesSante.locInstitution16,
          InformationsOrganismesSante.contInstitution16),
      OrganismesSanteListeItem(
          Icons.account_balance,
          InformationsOrganismesSante.nomInstitution17,
          InformationsOrganismesSante.locInstitution17,
          InformationsOrganismesSante.contInstitution17),
      OrganismesSanteListeItem(
          Icons.account_balance,
          InformationsOrganismesSante.nomInstitution18,
          InformationsOrganismesSante.locInstitution18,
          InformationsOrganismesSante.contInstitution18),
      OrganismesSanteListeItem(
          Icons.account_balance,
          InformationsOrganismesSante.nomInstitution19,
          InformationsOrganismesSante.locInstitution19,
          InformationsOrganismesSante.contInstitution19),
      OrganismesSanteListeItem(
          Icons.account_balance,
          InformationsOrganismesSante.nomInstitution20,
          InformationsOrganismesSante.locInstitution20,
          InformationsOrganismesSante.contInstitution20),
      OrganismesSanteListeItem(
          Icons.account_balance,
          InformationsOrganismesSante.nomInstitution21,
          InformationsOrganismesSante.locInstitution21,
          InformationsOrganismesSante.contInstitution21),
      OrganismesSanteListeItem(
          Icons.account_balance,
          InformationsOrganismesSante.nomInstitution22,
          InformationsOrganismesSante.locInstitution22,
          InformationsOrganismesSante.contInstitution22),
      OrganismesSanteListeItem(
          Icons.account_balance,
          InformationsOrganismesSante.nomInstitution23,
          InformationsOrganismesSante.locInstitution23,
          InformationsOrganismesSante.contInstitution23),
      OrganismesSanteListeItem(
          Icons.account_balance,
          InformationsOrganismesSante.nomInstitution24,
          InformationsOrganismesSante.locInstitution24,
          InformationsOrganismesSante.contInstitution24),
      OrganismesSanteListeItem(
          Icons.account_balance,
          InformationsOrganismesSante.nomInstitution25,
          InformationsOrganismesSante.locInstitution25,
          InformationsOrganismesSante.contInstitution25)
    ];
  }
}
