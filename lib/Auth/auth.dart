
import 'package:gavel/model/model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:http/http.dart';

class Auth {
  signIn(email, password, client) async {
    var url = client == 'Lawyer'
        ? Uri.parse('https://gavell.herokuapp.com/attorneys/login')
        : Uri.parse('https://gavell.herokuapp.com/users/login');
    var user = {
      'email': email,
      'password': password,
    };
    Response response = await http.post(url, body: user);
    return json.decode(response.body);
  }

  signUp(fname, lname, email, password, phoneNumber, client) async {
    var url = client == 'Lawyer'
        ? Uri.parse('https://gavell.herokuapp.com/attorneys/register')
        : Uri.parse('https://gavell.herokuapp.com/users/register');
    var user = {
      'first_name': fname,
      'last_name': fname,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
    };
    Response response = await http.post(url, body: user);

    return jsonDecode(response.body);
  }

  retrieveUser(token) async {
    var url = Uri.parse('https://gavell.herokuapp.com/dashboard');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    Response response = await http.get(url, headers: headers);
    return User.fromJson(response.body);
  }

  makePost(email, title, body) async {
    var url = Uri.parse('https://gavell.herokuapp.com/post');
    var user = {
      'email': email,
      'title': title,
      'body': body,
    };
    Response response = await http.post(url, body: user);
    return json.decode(response.body);
  }

  getPost() async {
    var url = Uri.parse('https://gavell.herokuapp.com/post/all');
    Response response = await http.get(url);
    var received = response.body;
    List posts =  json.decode(received);
    return posts;

    // return posts;
  }
}
