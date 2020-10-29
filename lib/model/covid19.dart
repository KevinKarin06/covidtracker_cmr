class Covid19 {
  final int active;
  final int confirmed;
  final int deaths;
  final int recovered;
  final String date;

  Covid19(
      {this.active, this.confirmed, this.deaths, this.recovered, this.date});

  factory Covid19.fromJson(Map<String, dynamic> json) => Covid19(
        active: json['Active'],
        confirmed: json['Confirmed'],
        deaths: json['Deaths'],
        recovered: json['Recovered'],
        date: json['Date'],
      );
}
