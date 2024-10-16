import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/model.dart';
//import '../controller/app_controller.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  List<Movie> _movies = [];

  Future<void> _fetchMovies() async {
    try {
      final response = await http.get(
        Uri.parse('http://192.168.1.5/movieappapi.php?fetch_movies=true'),
      );

      final responseData = jsonDecode(response.body);

      if (responseData['status'] == 'success') {
        List<Movie> movies = [];
        for (var movieData in responseData['data']) {
          Movie movie = Movie.fromJson(movieData);
          movies.add(movie);
        }
        setState(() {
          _movies = movies;
        });
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    setState(() {
                      _searchQuery = '';
                    });
                  },
                ),
              ),
              onChanged: (query) {
                setState(() {
                  _searchQuery = query;
                });
              },
            ),
            SizedBox(height: 16),
            Text('You are searching for: $_searchQuery'),
            Expanded(
              child: ListView.builder(
                itemCount: _movies.length,
                itemBuilder: (context, index) {
                  Movie movie = _movies[index];
                  if (movie.movieName
                      .toLowerCase()
                      .contains(_searchQuery.toLowerCase())) {
                    return ListTile(
                      title: Text(movie.movieName),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
