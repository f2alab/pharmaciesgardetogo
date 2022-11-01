class PharmaciesGardeItemModels
{
  String pharmaNOM;
  String pharmaLOC;
  String pharmaCONT1;
  String pharmaCONT2;

  PharmaciesGardeItemModels({required this.pharmaNOM,
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
  /*String pharmaNom;
  String pharmaLocal;
  String pharmaContact1;
  String pharmaContact2;

  PharmaciesGardeItemModels(
      this.pharmaNom, this.pharmaLocal,
      this.pharmaContact1,
      this.pharmaContact2,);*/


  /*factory PharmaciesGardeItemModels.fromMap(Map<String, dynamic> map) {
    return PharmaciesGardeItemModels(
      pharmaNom: map['pharmaNom'] ?? '',
      pharmaLocal: map['phoneNumber'] ?? '',
      pharmaContact1: map['phoneNumber'] ?? '',
      pharmaContact2: map['phoneNumber'] ?? '',
    );
  }*/
}