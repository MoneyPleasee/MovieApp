// MODEL
import 'package:flutter/material.dart';

class User {
  final String username;
  final String password;
  final String email;
  final String fname;
  final String lname;

  User({
    required this.username,
    required this.password,
    required this.email,
    required this.fname,
    required this.lname,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
      'email': email,
      'fname': fname,
      'lname': lname,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      password: json['password'],
      email: json['email'],
      fname: json['fname'],
      lname: json['lname'],
    );
  }
}

class Movie {
  final String movieName;
  final String description;
  final String imageUrl;

  Movie({
    required this.movieName,
    required this.description,
    required this.imageUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'movie_name': movieName,
      'description': description,
      'image_url': imageUrl,
    };
  }

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      movieName: json['movie_name'],
      description: json['description'],
      imageUrl: json['image_url'],
    );
  }
}

class UserInfo {
  final String username;
  final String fname;
  final String lname;
  final String email;
  final String? imageURL;

  UserInfo({
    required this.username,
    required this.fname,
    required this.lname,
    required this.email,
    this.imageURL,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'fname': fname,
      'lname': lname,
      'email': email,
      'imageURL': imageURL,
    };
  }

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      username: json['username'] ?? '',
      fname: json['fname'] ?? '',
      lname: json['lname'] ?? '',
      email: json['email'] ?? '',
      imageURL: json['imageURL'] ?? '',
    );
  }
}

class UserModel extends ChangeNotifier {
  String _username = '';
  String _fname = '';
  String _lname = '';
  String _email = '';
  String _imageURL = '';

  // Getters
  String get username => _username;
  String get fname => _fname;
  String get lname => _lname;
  String get email => _email;
  String get imageURL => _imageURL;

  // Setter for full user data
  void setUser(String username, String fname, String lname, String email, String imageURL) {
    _username = username;
    _fname = fname;
    _lname = lname;
    _email = email;
    _imageURL = imageURL;
    notifyListeners(); // Tells widgets that rely on this model to rebuild
  }

  // Simpler setter for just username (optional use)
  void setUsername(String username) {
    _username = username;
    notifyListeners();
  }

  // Logout clears all fields
  void logout() {
    _username = '';
    _fname = '';
    _lname = '';
    _email = '';
    _imageURL = '';
    notifyListeners(); // Important: ensures UI updates
  }
}