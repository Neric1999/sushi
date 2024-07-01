import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sushi/domain/models/brand.model.dart';
import 'package:sushi/domain/models/user.dart';

class Repository {
  Future<String> signUp(User user) async {
    String url = 'http://localhost:8080/signup';
    Map<String, String> headers = {'Content-Type': 'application/json'};
    try {
      String userJson = jsonEncode(user.toJson());
      http.Response response =
          await http.post(Uri.parse(url), body: userJson, headers: headers);
      if (response.statusCode == 200) {
        final jsonRes = jsonDecode(response.body);
        print('The returned data: $jsonRes');
        return jsonRes['token'];
      } else {
        throw Exception('Error while signing up new user');
      }
    } catch (e) {
      throw Exception('Error on signing up user is $e');
    }
  }

  Future<String> signIn(String username, String password) async {
    String url = 'http://localhost:8080/signin';
    Map<String, String> headers = {'Content-Type': 'application/json'};
    try {
      Map<String, String> body = {
        'username': username,
        'password': password,
      };
      print('In sushi, signing user with $username and $password');
      String bodyJson = jsonEncode(body);
      http.Response response =
          await http.post(Uri.parse(url), body: bodyJson, headers: headers);
      if (response.statusCode == 200) {
        final jsonRes = jsonDecode(response.body);
        print('The returned data: $jsonRes');
        return jsonRes['token'];
      } else {
        throw Exception('Error while signing in ${response.body}');
      }
    } catch (e) {
      throw Exception('Error on signing in user is $e');
    }
  }

  Future<Brand?> getBrands() async {
    String url = 'http://localhost:8080/brand';
    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final brandJson = jsonDecode(response.body);
        return Brand.fromJson(brandJson);
      } else {
        throw Exception('Error while getting brands ${response.body}');
      }
    } catch (e) {
      throw Exception('Error on getting brands $e');
    }
  }
}
