import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../../configs/secrets/secrets.dart' as globals;

/// Signs up a user using [username], [email], [first_name], [phone_number] and [password]
///
/// Returns the an access tokens
Future<Object> signUp({
  @required String username,
  @required String email,
  @required String firstName,
  @required String phoneNumber,
  @required String password,
}) async {
  Map<String, String> body = {
    'username': '$username',
    'client_id': '${globals.clientIdApi}',
    'client_secret': '${globals.clientSecretApi}',
    'email': '$email',
    'first_name': '$firstName',
    'phone_number': '$phoneNumber',
    'password': '$password'
  };

  final Uri url = Uri.http(globals.baseUrl, '/api/users/register/');
  final response = await http.post(url, body: body);

  print(response);
  return {};
}
