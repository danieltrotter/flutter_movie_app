import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/models/movie_model.dart';

String baseUrl = "https://www.omdbapi.com/";
String apiKey = "a4d98298";

class HttpHandler {
  Uri url = Uri.parse(baseUrl);
  Future<List<Movie>> getData({query = String}) async {
    List<Movie> returnData = [];
    try {
      var _response = await http.get(Uri.parse(_getUrl(query: query)));
      var _decoded = jsonDecode(_response.body);
      _decoded["Search"].forEach((e) {
        returnData.add(Movie.fromJson(e));
      });
    } catch (e) {
      print(e);
    }
    return returnData;
  }

  String _getUrl({query = String}) {
    return baseUrl + "?s=" + query + "&apikey=" + apiKey;
  }
}
