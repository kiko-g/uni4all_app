import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:uni/model/entities/uni4all/News.dart';

class Uni4AllApi {
  static Future<String> fetchNews() async {
    final http.Response response = await http.get(Uri.parse('https://uni4all.servehttp.com/news'));

    if (response.statusCode == 200) {
      // TODO: parse list of json objects
      // return News.fromJson(jsonDecode(response.body));
      return response.body;
    } else {
      throw Exception('Failed to load album');
    }
  }
}
