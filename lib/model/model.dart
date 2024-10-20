// MODEL
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
