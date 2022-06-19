// ignore_for_file: lines_longer_than_80_chars
import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:uni/model/entities/session.dart';
import 'package:uni/controller/networking/network_router.dart';
import 'package:uni/model/entities/uni4all/api_response.dart';

class Uni4AllApi {
  static final String domain = 'uni4all.servehttp.com';
  static final String baseUrl = 'https://uni4all.servehttp.com';
  static final Map<String, String> headers = {
    'accept': '*/*',
    'Content-Type': '*/*'
  };

  /// Returns [String] with the HTML string fetched from the URL.
  static Future<String> fetchHtmlPage(String url, Session session, [Map<String, String> query]) async {
    final response = await NetworkRouter.getWithCookies(
        url,
        query ?? {},
        session
    );
    return response.body;
  }

  /// Returns [List<String>] with all the HTML strings fetched from every URL.
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

  /// Returns [String] appendix message from request and response
  static String _getAppendix(Map<String, dynamic> body, Map<String, dynamic> params, http.Response response) {
    return (body != null && body.isNotEmpty
            ? 'with body: ${body.toString()}'
            : 'with empty body') +
        (params != null && params.isNotEmpty
            ? ' and with params: ${params.toString()}'
            : ' and empty params') +
        (response != null
            ? '. (${response.statusCode}): ${response.body.toString()}'
            : '.');
  }

  /// Peforms `GET` operation on **uni4all** API Returns [Uni4AllApiResponse]
  static Future<Uni4AllApiResponse> get(String route, [Map<String, dynamic> params]) async {
    try {
      final response = await http.get(Uri.https(domain, route, params), headers: headers);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Uni4AllApiResponse(
          success: true,
          message: '[UNI4ALL API] Successfully executed GET "$route"',
          content: json.decode(response.body)
        );
      } else {
        return Uni4AllApiResponse(
          success: false,
          message: '[UNI4ALL API] Failed to GET "$route" ${_getAppendix(null, params, response)}',
          content: json.decode(response.body)
        );
      }
    } 
    catch (e) {
      return Uni4AllApiResponse(
        success: false,
        message: '[UNI4ALL API] Error while trying GET "$route"',
        content: null
      );
    }
  }

  /// Peforms `POST` operation on **uni4all** API. Returns [Uni4AllApiResponse]
  static Future<Uni4AllApiResponse> post(String route, [Map<String, dynamic> body, Map<String, dynamic> params]) async {
    try {
      final response = await http.post(
        Uri.https(domain, route, params),
        headers: headers,
        body: json.encode(body)
      );
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Uni4AllApiResponse(
          success: true,
          message: '[UNI4ALL API] Successfully executed POST "$route"',
          content: json.decode(response.body)
        );
      } else {
        return Uni4AllApiResponse(
          success: false,
          message: '[UNI4ALL API] Failed POST "$route" ${_getAppendix(body, params, response)}',
          content: json.decode(response.body)
        );
      }
    } 
    catch (e) {
      return Uni4AllApiResponse(
        success: false,
        message: '[UNI4ALL API] Error while trying POST "$route"',
        content: null
      );
    }
  }

  /// Peforms `PUT` operation on **uni4all** API. Returns [Uni4AllApiResponse]
  static Future<Uni4AllApiResponse> put(String route, [Map<String, dynamic> body, Map<String, dynamic> params]) async {
    try {
      final response = await http.put(
        Uri.https(domain, route, params),
        headers: headers,
        body: json.encode(body)
      );
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Uni4AllApiResponse(
          success: true,
          message: '[UNI4ALL API] Successfully executed PUT "$route"',
          content: json.decode(response.body)
        );
      } else {
        return Uni4AllApiResponse(
          success: false,
          message: '[UNI4ALL API] Failed PUT "$route" ${_getAppendix(body, params, response)}',
          content: json.decode(response.body)
        );
      }
    } 
    catch (e) {
      return Uni4AllApiResponse(
        success: false,
        message: '[UNI4ALL API] Error while trying PUT "$route"',
        content: null
      );
    }
  }

  /// Peforms `DELETE` operation on **uni4all** API. Returns [Uni4AllApiResponse]
  static Future<Uni4AllApiResponse> delete(String route, [Map<String, dynamic> body, Map<String, dynamic> params]) async {
    try {
      final response = await http.delete(
        Uri.https(domain, route, params),
        headers: headers,
        body: json.encode(body)
      );
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Uni4AllApiResponse(
          success: true,
          message: '[UNI4ALL API] Successfully executed DELETE "$route"',
          content: json.decode(response.body)
        );
      } else {
        return Uni4AllApiResponse(
          success: false,
          message: '[UNI4ALL API] Failed DELETE "$route" ${_getAppendix(body, params, response)}',
          content: json.decode(response.body)
        );
      }
    } 
    catch (e) {
      return Uni4AllApiResponse(
        success: false,
        message: '[UNI4ALL API] Error while trying DELETE "$route"',
        content: null
      );
    }
  }

  /// Peforms `PATCH` operation on **uni4all** API. Returns [Uni4AllApiResponse]
  static Future<Uni4AllApiResponse> patch(String route, [Map<String, dynamic> body, Map<String, dynamic> params]) async {
    try {
      final response = await http.patch(
        Uri.https(domain, route, params),
        headers: headers,
        body: json.encode(body)
      );
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Uni4AllApiResponse(
          success: true,
          message: '[UNI4ALL API] Successfully executed PATCH "$route"',
          content: json.decode(response.body)
        );
      } else {
        return Uni4AllApiResponse(
          success: false,
          message: '[UNI4ALL API] Failed PATCH "$route" ${_getAppendix(body, params, response)}',
          content: json.decode(response.body)
        );
      }
    } 
    catch (e) {
      return Uni4AllApiResponse(
        success: false,
        message: '[UNI4ALL API] Error while trying PATCH "$route"',
        content: null
      );
    }
  }
}
