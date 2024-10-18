//CONTROLLER
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/model.dart';

class LoginController {
  Future<bool> login(User user) async {
    try {
      final response = await http.post(
        Uri.parse('http://localhost/movieappapi.php'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(user.toJson()),
      );

      // Log the response for debugging
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      final responseData = jsonDecode(response.body);

      if (responseData['status'] == 'success') {
        return true;
      } else {
        return false;
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
        Uri.parse('http://localhost/movieappapi.php?signup=true'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(user.toJson()),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      final responseData = jsonDecode(response.body);

      if (responseData['status'] == 'success') {
        return true;
      } else {
        return false;
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
        Uri.parse('http://localhost/movieappapi.php?fetch_movies=true'),
      );

      // Log the response for debugging
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

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
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }
}
