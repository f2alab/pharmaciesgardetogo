class PharmaciesListeModels
{
  String pharmaNOM;
  String pharmaLOC;
  String pharmaCONT1;
  String pharmaCONT2;
  bool esFavorie;

  PharmaciesListeModels(
      { required this.pharmaNOM,
        required this.pharmaLOC,
        required this.pharmaCONT1,
        required this.pharmaCONT2,
        this.esFavorie = false});

  factory PharmaciesListeModels.fromJson(Map<String, dynamic> json)
  {
    return PharmaciesListeModels(
      pharmaNOM:  json['pharmaNOM'],
      pharmaLOC:  json["pharmaLOC"],
      pharmaCONT1: json["pharmaCONT1"],
      pharmaCONT2: json["pharmaCONT2"],
      esFavorie: json["esFavorie"],
    );
  }

  Map<String, dynamic> toJson()=>
      {
        "pharmaNOM":pharmaNOM,
        "pharmaLOC":pharmaLOC,
        "pharmaCONT1":pharmaCONT1,
        "pharmaCONT2":pharmaCONT2,
        "esFavorie":esFavorie,
      };
}