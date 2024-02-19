import 'dart:convert';
import 'package:travel_app/Utils/SD_Client.dart';
import 'package:travel_app/models/UserDto.dart';
import 'package:http/http.dart' as http;

class UserService {
  static UserDto? loggedInUser;
  static bool isLogins = false;

  Future<List<UserDto>> getAllUsers() async {
    final response = await http.get(SD_CLIENT.apiAllUserUri);

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<UserDto> users = data.map((json) => UserDto.fromJson(json)).toList();
      return users;
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<UserDto?> registerNewUser({
    required String username,
    required String email,
    required String password,
    required String phone,
  }) async {
    try {
      final registrationData = {
        'username': username,
        'email': email,
        'password': password,
        'phone': phone,
      };

      final response = await http.post(
        SD_CLIENT.apiRegisterUri,
        body: json.encode(registrationData),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        return UserDto.fromJson(responseData);
      } else {
        print('Registration failed with status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error during registration: $e');
      return null;
    }
  }

  Future<UserDto?> login(String email, String password) async {

    // Prepare login data
    Map<String, String> loginData = {
      'email': email,
      'password': password,
    };

    // Send login request to your API
    final response = await http.post(
      SD_CLIENT.apiLoginUri,
      body: json.encode(loginData),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = json.decode(response.body);
      loggedInUser = UserDto.fromJson(responseData); // store the logged-in user
      isLogins = true;
      print('Logged in user: ${loggedInUser?.username}');

      return loggedInUser;
    } else {
      // Handle login failure here
      return null;
    }
  }
}
