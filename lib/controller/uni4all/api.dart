import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class Uni4AllApi {
  static final String domain = 'uni4all.servehttp.com';
  static final String baseUrl = 'https://uni4all.servehttp.com';

  /// Peforms `GET` operation on **uni4all** API
  ///
  /// Returns parsed JSON from the given `route` and `params`
  static Future get(String route, [Map<String, dynamic> params]) async {
    final response = await http.get(Uri.https(domain, route, params));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      final sc = response.statusCode;
      throw Exception('Failed GET $route @ uni4all API. ($sc)');
    }
  }

  /// Peforms `POST` operation on **uni4all** API FIXME:
  static Future post(String route,
      [Map<String, dynamic> params, Map<String, dynamic> body]) async {
    final response =
        await http.post(Uri.https(domain, route, params), body: body);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      final sc = response.statusCode;
      throw Exception('Failed POST $route @ uni4all API. ($sc)');
    }
  }
}
