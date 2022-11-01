class PharmaciesListeModels
{
 /* String pharmaNOM;
  String pharmaLOC;
  String pharmaCONT1;
  String pharmaCONT2;

  PharmaciesListeModels(this.pharmaNOM, this.pharmaLOC, this.pharmaCONT1, this.pharmaCONT2);*/
  String pharmaNOM;
  String pharmaLOC;
  String pharmaCONT1;
  String pharmaCONT2;
  bool esFavorie;

  PharmaciesListeModels(
      this.pharmaNOM, this.pharmaLOC,
      this.pharmaCONT1,
      this.pharmaCONT2,
      {this.esFavorie = false});

}