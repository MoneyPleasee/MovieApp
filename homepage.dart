import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MovieReviewApp());
}

// The main app widget that sets up the entire application.
class MovieReviewApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Review App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black, // Sets background color of the app to black.
        textTheme: TextTheme(
          // Defines text styles to ensure white text throughout the app.
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
          bodySmall: TextStyle(color: Colors.white),
        ),
      ),
      home: HomeScreen(), // The initial screen of the app.
    );
  }
}

// The HomeScreen widget represents the main page of the app.
class HomeScreen extends StatelessWidget {
  // List of image paths for the carousel and movie lists.
  final List<String> movieImages = [
    'lib/assets/landscape-poster-3_orig.jpg',
    'lib/assets/s-l960.webp',
    'lib/assets/despicable_me_four_xlg.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Bottom navigation bar for switching between different sections of the app.
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.save), label: 'Saved'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Color.fromARGB(255, 252, 182, 90),
        backgroundColor: Colors.black, // Background color for the navigation bar.
      ),
      // Main content of the HomeScreen
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Carousel slider for showcasing movie images. "The big picture"
            CarouselSlider(
              options: CarouselOptions(
                height: 300.0,
                autoPlay: true, // Automatically cycles through images.
                aspectRatio: 16/9,
                enlargeCenterPage: true, // Enlarges the central image.
              ),
              items: movieImages.map((imagePath) {
                return Builder(
                  builder: (BuildContext context) {
                    return Image.asset(
                      imagePath,
                      fit: BoxFit.fill,
                      width: 1000, // Fills the width of the container.
                    );
                  },
                );
              }).toList(),
            ),
            // Section for displaying categories of movies.
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Categories',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  // Category buttons to filter movies by genre.
                  CategoryButton(label: 'All', isSelected: true),
                  CategoryButton(label: 'Action'),
                  CategoryButton(label: 'Comedy'),
                  CategoryButton(label: 'Romance'),
                ],
              ),
            ),
            // "Most Popular" section displaying popular movies.
            Container(
              padding: EdgeInsets.all(8.0),
              margin: EdgeInsets.symmetric(vertical: 10.0),
              decoration: BoxDecoration(
                color: Colors.black12, // Slightly transparent background.
                borderRadius: BorderRadius.circular(10.0), // Rounded corners.
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Most Popular',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  // Horizontal list of popular movies.
                  MovieList(movieImages: movieImages),
                ],
              ),
            ),
            // "Latest Movies" section displaying recently released movies.
            Container(
              padding: EdgeInsets.all(8.0),
              margin: EdgeInsets.symmetric(vertical: 10.0),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Latest Movies',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  // Horizontal list of latest movies.
                  MovieList(movieImages: [
                    'lib/assets/inside_out_two_ver2_xlg.jpg',
                    'lib/assets/smile_two_ver2_xlg.jpg',
                    'lib/assets/despicable_me_four_xlg.jpg',
                  ]),
                ],
              ),
            ),
            // "Highly Recommended" section displaying top-rated movies.
            Container(
              padding: EdgeInsets.all(8.0),
              margin: EdgeInsets.symmetric(vertical: 10.0),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Highly Recommended',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  // Horizontal list of highly recommended movies.
                  MovieList(movieImages: [
                    'lib/assets/smile_two_ver2_xlg.jpg',
                    'lib/assets/inside_out_two_ver2_xlg.jpg',
                    'lib/assets/despicable_me_four_xlg.jpg',
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Button widget used for movie category selection.
class CategoryButton extends StatelessWidget {
  final String label;
  final bool isSelected;

  CategoryButton({required this.label, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: isSelected ? Colors.redAccent : Colors.transparent, // Highlight selected category.
        foregroundColor: Colors.white, // White text color.
        padding: EdgeInsets.symmetric(horizontal: 20),
      ),
      onPressed: () {}, // Action on button press (to be implemented).
      child: Text(label),
    );
  }
}

// Widget for displaying a list of movies in a horizontal scrollable list.
class MovieList extends StatelessWidget {
  final List<String> movieImages;

  MovieList({required this.movieImages});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // Horizontal scroll.
        itemCount: movieImages.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              movieImages[index],
              fit: BoxFit.cover, // Cover the entire space of the image.
              width: 250.0, // Set width of each image.
            ),
          );
        },
      ),
    );
  }
}
