import 'dart:convert';

List<Citys> citysFromJson(String str) =>
    List<Citys>.from(json.decode(str).map((x) => Citys.fromJson(x)));

String citysToJson(List<Citys> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Citys {
  Citys({
    required this.id,
    required this.slug,
    required this.citySlug,
    required this.display,
    required this.asciiDisplay,
    required this.cityName,
    required this.cityAsciiName,
    required this.state,
    required this.country,
    this.lat,
    this.long,
    required this.resultType,
    required this.popularity,
    this.sortCriteria,
  });

  int id;
  String slug;
  String citySlug;
  String display;
  String asciiDisplay;
  String cityName;
  String cityAsciiName;
  String state;
  Country country;
  String? lat;
  String? long;
  ResultType resultType;
  String popularity;
  double? sortCriteria;

  factory Citys.fromJson(Map<String, dynamic> json) => Citys(
        id: json["id"],
        slug: json["slug"],
        citySlug: json["city_slug"],
        display: json["display"],
        asciiDisplay: json["ascii_display"],
        cityName: json["city_name"],
        cityAsciiName: json["city_ascii_name"],
        state: json["state"],
        country: countryValues.map[json["country"]]!,
        lat: json["lat"],
        long: json["long"],
        resultType: resultTypeValues.map[json["result_type"]]!,
        popularity: json["popularity"],
        sortCriteria: json["sort_criteria"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "city_slug": citySlug,
        "display": display,
        "ascii_display": asciiDisplay,
        "city_name": cityName,
        "city_ascii_name": cityAsciiName,
        "state": state,
        "country": countryValues.reverse[country],
        "lat": lat,
        "long": long,
        "result_type": resultTypeValues.reverse[resultType],
        "popularity": popularity,
        "sort_criteria": sortCriteria,
      };
}

enum Country { MXICO, UNITED_STATES }

final countryValues = EnumValues(
    {"México": Country.MXICO, "United States": Country.UNITED_STATES});

enum ResultType { CITY, TERMINAL, AIRPORT }

final resultTypeValues = EnumValues({
  "airport": ResultType.AIRPORT,
  "city": ResultType.CITY,
  "terminal": ResultType.TERMINAL
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
