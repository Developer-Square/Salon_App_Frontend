import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../../configs/secrets/secrets.dart' as globals;

/// Logs in a user using [google token].
///
/// Returns the an access tokens
Future<Object> loginWithGoogle(
    {@required String token,
    @required String firstName,
    @required String password}) async {
  Map<String, String> body = {
    'grant_type': 'convert_token',
    'first_name': '$firstName',
    'password': '$password',
    'client_id': '${globals.clientIdApi}',
    'client_secret': '${globals.clientSecretApi}',
    'backend': 'google-oauth2',
    'token': '$token'
  };
  print(body);

  final Uri url = Uri.http(globals.baseUrl, '/auth/convert-token/');
  final response = await http.post(url, body: body);

  print(response);
  return {};
}
