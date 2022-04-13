class Movie {
  String? title;
  String? year;
  String? poster;

  Movie({this.title, this.year, this.poster});
  Movie.fromJson(Map<String, dynamic> json) {
    title = json["Title"] ?? "Unkown";
    year = json["Year"] ?? "Unkown";
    poster = json["Poster"] ?? "";
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["Title"] = title;
    data["Year"] = year;
    data["Poster"] = poster;
    return data;
  }
}

