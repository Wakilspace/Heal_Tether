import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/user_model.dart';


// Service class to handle API requests
class ApiService {
  static const String url = 'https://jsonplaceholder.typicode.com/users';


  // Fetches user data from the API
  Future<List<UserModel>> fetchUsers() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => UserModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}