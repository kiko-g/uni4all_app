// ignore_for_file: lines_longer_than_80_chars
import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:uni/controller/networking/network_router.dart';
import 'package:uni/model/entities/session.dart';

class Uni4AllApi {
  static final String domain = 'uni4all.servehttp.com';
  static final String baseUrl = 'https://uni4all.servehttp.com';
  static final Map<String, String> headers = {
    'Content-Type': 'application/x-www-form-urlencoded'
  };

  static Future<String> fetchHtmlPage(String url, Session session, [Map<String, String> query]) async {
    final response = await NetworkRouter.getWithCookies(
        url,
        query ?? {},
        session
    );
    return response.body;
  }

  static Future<List<String>> fetchHtmlPages(List<String> urls, Session session, [Map<String, String> query]) async {
    final List<String> htmls = [];
    
    for (var i = 0; i < urls.length; i++) {
      final response = await NetworkRouter.getWithCookies(
        urls[i],
        query ?? {},
        session
      );
      htmls.add(response.body);
    }

    return htmls;
  }

  /// Peforms `GET` operation on **uni4all** API
  static Future get(String route, [Map<String, dynamic> params]) async {
    final response = await http.get(
      Uri.https(domain, route, params), 
      headers: headers
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      final sc = response.statusCode;
      throw Exception('Failed GET $route @ uni4all API. ($sc)');
    }
  }

  /// Peforms `POST` operation on **uni4all** API
  static Future post(String route, [Map<String, dynamic> body, Map<String, dynamic> params]) async {
    final response = await http.post(
      Uri.https(domain, route, params),
      headers: headers,
      body: json.encode(body)
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      final sc = response.statusCode;
      throw Exception('Failed POST $route @ uni4all API. ($sc)');
    }
  }

  /// Peforms `PUT` operation on **uni4all** API
  static Future put(String route, [Map<String, dynamic> body, Map<String, dynamic> params]) async {
    final response = await http.put(
      Uri.https(domain, route, params), 
      headers: headers, 
      body: json.encode(body)
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      final sc = response.statusCode;
      throw Exception('Failed PUT $route @ uni4all API. ($sc)');
    }
  }

  /// Peforms `DELETE` operation on **uni4all** API
  static Future delete(String route, [Map<String, dynamic> body, Map<String, dynamic> params]) async {
    final response = await http.delete(
      Uri.https(domain, route, params), 
      headers: headers, 
      body: json.encode(body)
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      final sc = response.statusCode;
      throw Exception('Failed DELETE $route @ uni4all API. ($sc)');
    }
  }

  /// Peforms `PATCH` operation on **uni4all** API
  static Future patch(String route, [Map<String, dynamic> body, Map<String, dynamic> params]) async {
    final response = await http.patch(
      Uri.https(domain, route, params), 
      headers: headers, 
      body: json.encode(body)
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      final sc = response.statusCode;
      throw Exception('Failed PATCH $route @ uni4all API. ($sc)');
    }
  }
}
