import 'dart:convert';

County countyFromJson(String str) => County.fromJson(json.decode(str));

String countyToJson(County data) => json.encode(data.toJson());

class County {
  County({
    required this.data,
  });

  List<Datum> data;

  factory County.fromJson(Map<String, dynamic> json) => County(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.idCounty,
    required this.county,
    required this.idYear,
    required this.year,
    required this.propertyValue,
    required this.slugCounty,
  });

  String idCounty;
  String county;
  int idYear;
  String year;
  int propertyValue;
  String slugCounty;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    idCounty: json["ID County"],
    county: json["County"],
    idYear: json["ID Year"],
    year: json["Year"],
    propertyValue: json["Property Value"],
    slugCounty: json["Slug County"],
  );

  Map<String, dynamic> toJson() => {
    "ID County": idCounty,
    "County": county,
    "ID Year": idYear,
    "Year": year,
    "Property Value": propertyValue,
    "Slug County": slugCounty,
  };
}

