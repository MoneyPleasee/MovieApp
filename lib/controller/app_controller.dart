// CONTROLLER
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/model.dart';

class LoginController {
  Future<bool> login(User user) async {
    try {
      final response = await http.post(
        Uri.parse('http://10.0.2.2/movieappapi.php?action=login'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(user.toJson()),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        if (responseData['status'] == 'success') {
          return true;
        } else {
          return false;
        }
      } else {
        throw Exception('Login failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }
}

class SignUpController {
  Future<bool> signUp(User user) async {
    try {
      final response = await http.post(
        Uri.parse('http://10.0.2.2/movieappapi.php?action=register'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(user.toJson()),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        if (responseData['status'] == 'success') {
          return true;
        } else {
          return false;
        }
      } else {
        throw Exception('Sign up failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during sign up: $e');
      return false;
    }
  }
}

class MovieController {
  Future<List<Movie>> fetchMovies() async {
    try {
      final response = await http.get(
        Uri.parse('http://10.0.2.2/movieappapi.php?fetch_movies=true'),
      );

      // Log the response for debugging
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        if (responseData['status'] == 'success') {
          List<Movie> movies = [];
          for (var movieData in responseData['data']) {
            Movie movie = Movie.fromJson(movieData);
            movies.add(movie);
          }
          return movies;
        } else {
          return [];
        }
      } else {
        throw Exception(
            'Failed to fetch movies with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }
}

class UserController {
  final String apiUrl = 'http://10.0.2.2/movieappapi.php';

  Future<UserInfo?> fetchUserByUsername(String username) async {
    final response = await http.get(Uri.parse('$apiUrl?username=$username'));

    // Log the status and response body for debugging
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      // Cast the json response to Map<String, dynamic>
      final Map<String, dynamic> jsonResponse =
          json.decode(response.body) as Map<String, dynamic>;

      print('Parsed JSON response: $jsonResponse');

      // Check if the response contains user data
      if (jsonResponse.isNotEmpty) {
        return UserInfo.fromJson(jsonResponse);
      } else {
        print('No user found');
        return null; // Return null if no user is found
      }
    } else {
      throw Exception('Failed to load user');
    }
  }

  Future<bool> updateUserInfo(UserInfo userInfo) async {
    try {
      final response = await http.post(
        Uri.parse('$apiUrl?action=update_user'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(userInfo.toJson()),
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return responseData['status'] == 'success';
      } else {
        throw Exception(
            'Failed to update user info with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error updating user info: $e');
      return false;
    }
  }
}
