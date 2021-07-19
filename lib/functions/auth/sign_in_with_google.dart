import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../../configs/secrets/secrets.dart' as globals;

/// Logs in a user using [google token].
///
/// Returns the an access tokens
Future<Object> loginWithGoogle({@required String token}) async {
  Map<String, String> body = {'auth_token': '$token'};

  final Uri url = Uri.http(globals.baseUrl, '/api/social_auth/google/');
  final response = await http.post(url, body: body);

  print(response);
  return {};
}
