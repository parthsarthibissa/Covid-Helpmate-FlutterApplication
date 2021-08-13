class IndiaModel {
  int cases;
  int deaths;
  int recovered;
  int todayCases;
  int todayDeaths;
  int todayRecovered;
  int active;
  int critical;
  double casesPerOneMillion;
  double deathsPerOneMillion;
  int tests;
  double testsPerOneMillion;
  int population;
  double oneCasePerPeople;
  double oneDeathPerPeople;
  double oneTestPerPeople;
  double activePerOneMillion;
  double recoveredPerOneMillion;
  double criticalPerOneMillion;

  IndiaModel({
    this.cases,
    this.deaths,
    this.recovered,
    this.active,
    this.activePerOneMillion,
    this.casesPerOneMillion,
    this.critical,
    this.criticalPerOneMillion,
    this.deathsPerOneMillion,
    this.oneCasePerPeople,
    this.oneDeathPerPeople,
    this.oneTestPerPeople,
    this.population,
    this.recoveredPerOneMillion,
    this.tests,
    this.testsPerOneMillion,
    this.todayCases,
    this.todayDeaths,
    this.todayRecovered,
  });
  factory IndiaModel.fromJson(Map<String, dynamic> json) => IndiaModel(
        cases: json["cases"],
        todayCases: json["todayCases"],
        deaths: json["deaths"],
        todayDeaths: json["todayDeaths"],
        recovered: json["recovered"],
        todayRecovered: json["todayRecovered"],
        active: json["active"],
        critical: json["critical"],
        casesPerOneMillion: json["casesPerOneMillion"].toDouble(),
        deathsPerOneMillion: json["deathsPerOneMillion"].toDouble(),
        tests: json["tests"],
        testsPerOneMillion: json["testsPerOneMillion"].toDouble(),
        population: json["population"],
        oneCasePerPeople: json["oneCasePerPeople"].toDouble(),
        oneDeathPerPeople: json["oneDeathPerPeople"].toDouble(),
        oneTestPerPeople: json["oneTestPerPeople"].toDouble(),
        activePerOneMillion: json["activePerOneMillion"].toDouble(),
        recoveredPerOneMillion: json["recoveredPerOneMillion"].toDouble(),
        criticalPerOneMillion: json["criticalPerOneMillion"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "cases": cases,
        "todayCases": todayCases,
        "deaths": deaths,
        "todayDeaths": todayDeaths,
        "recovered": recovered,
        "todayRecovered": todayRecovered,
        "active": active,
        "critical": critical,
        "casesPerOneMillion": casesPerOneMillion,
        "deathsPerOneMillion": deathsPerOneMillion,
        "tests": tests,
        "testsPerOneMillion": testsPerOneMillion,
        "population": population,
        "oneCasePerPeople": oneCasePerPeople,
        "oneDeathPerPeople": oneDeathPerPeople,
        "oneTestPerPeople": oneTestPerPeople,
        "activePerOneMillion": activePerOneMillion,
        "recoveredPerOneMillion": recoveredPerOneMillion,
        "criticalPerOneMillion": criticalPerOneMillion,
      };
}
