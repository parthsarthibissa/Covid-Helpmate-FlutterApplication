class CountryModel {
  String country;
  var countryInfo;
  int cases;
  int todayCases;
  int deaths;
  int todayDeaths;
  int recovered;
  int todayRecovered;
  int active;
  int critical;
  int tests;

  CountryModel(
      {this.active,
      this.cases,
      this.countryInfo,
      this.deaths,
      this.recovered,
      this.todayCases,
      this.todayDeaths,
      this.todayRecovered,
      this.country,
      this.critical,
      this.tests});
  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
      active: json['active'],
      cases: json['cases'],
      countryInfo: json['countryInfo'],
      country: json['country'],
      critical: json['critical'],
      deaths: json['deaths'],
      recovered: json['recovered'],
      tests: json['tests'],
      todayCases: json['todayCases'],
      todayDeaths: json['todayDeaths'],
      todayRecovered: json['todayRecovered']);

  Map<String, dynamic> toJson() => {
        "cases": cases,
        "countryInfo": countryInfo,
        "todayCases": todayCases,
        "deaths": deaths,
        "todayDeaths": todayDeaths,
        "recovered": recovered,
        "todayRecovered": todayRecovered,
        "active": active,
        "critical": critical,
        "tests": tests,
        "country": country,
      };
}
