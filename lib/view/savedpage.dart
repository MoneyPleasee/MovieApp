//savedpage.dart
import 'package:flutter/material.dart';

// Screen that displays saved movies
class SavedMoviesScreen extends StatelessWidget {
  // List of saved movies
  final List<Movie> movies = [
    Movie(
      title: 'Inside Out 2',
      description:
          'Joy, Sadness, Anger, Fear and Disgust have been running a successful operation by all accounts...',
      imagePath: 'lib/assets/inside_out_two_ver2_xlg.jpg',
    ),
    Movie(
      title: 'John Wick Chapter 4',
      description:
          'With the price on his head ever increasing, legendary hit man John Wick takes his fight against...',
      imagePath: 'lib/assets/john_wick_chapter_four_ver2.jpg',
    ),
    Movie(
      title: 'Joker: Folie à Deux',
      description:
          'Failed comedian Arthur Fleck meets the love of his life, Harley Quinn, while incarcerated at Arkham...',
      imagePath: 'lib/assets/joker_folie_a_deux_ver6.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1C1B33),
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF1C1B33), Color(0xFF3A3B5A)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Text(
          'Saved Movies',
          style: TextStyle(
            fontSize: 24, // Large title font size
            fontWeight: FontWeight.bold,
            color: Colors.white, // White title color
          ),
        ),
      ),
      // Displays the list of saved movies using ListView.builder
      body: ListView.builder(
        itemCount: movies.length, // Number of movies
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            // MovieContainer widget for each saved movie
            child: MovieContainer(
              imagePath: movies[index].imagePath,
              title: movies[index].title,
              description: movies[index].description,
            ),
          );
        },
      ),
    );
  }
}

// Custom widget that displays each movie's details in a container
class MovieContainer extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  // Constructor to initialize the required properties
  MovieContainer({
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF2D2B50), // Dark background for the movie container
        borderRadius: BorderRadius.circular(10), // Rounded corners
      ),
      child: Row(
        children: [
          // Movie image with rounded corners
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 100,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover, // Image fit mode
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

// Movie model class that holds movie details
class Movie {
  final String title;
  final String description;
  final String imagePath;

  // Constructor to initialize the movie properties
  Movie({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}
