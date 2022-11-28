class PharmaciesGardeItemModels
{
  String pharmaNOM;
  String pharmaLOC;
  String pharmaCONT1;
  String pharmaCONT2;

  PharmaciesGardeItemModels({
    required this.pharmaNOM,
    required this.pharmaLOC,
    required this.pharmaCONT1,
    this.pharmaCONT2="",}
      );

  factory PharmaciesGardeItemModels.fromJson(Map<String, dynamic> json)
  {
    return PharmaciesGardeItemModels(
        pharmaNOM: json['pharmaNOM'],
        pharmaLOC: json["pharmaLOC"],
        pharmaCONT1: json["pharmaCONT1"],
        pharmaCONT2: json["pharmaCONT2"],
    );
  }

  Map<String, dynamic> toJson()=>
  {
    "pharmaNOM":pharmaNOM,
    "pharmaLOC":pharmaLOC,
    "pharmaCONT1":pharmaCONT1,
    "pharmaCONT2":pharmaCONT2,
  };

}