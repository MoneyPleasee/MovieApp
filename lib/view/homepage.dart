//homepage.dart
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = 'All'; // Default category

  // List for carousel movies
  final List<String> carouselMovies = [
    'lib/assets/landscape-poster-3_orig.jpg',
    'lib/assets/s-l960.webp',
    'lib/assets/skyfall-movie-poster-james-bond-daniel-craig-2012.jpg',
  ];

  // Movies for each category
  final List<String> Movies = [
    'lib/assets/landscape-poster-3_orig.jpg',
    'lib/assets/s-l960.webp',
    'lib/assets/skyfall-movie-poster-james-bond-daniel-craig-2012.jpg',
    'lib/assets/blink.jpg',
    'lib/assets/crow_ver3.jpg',
    'lib/assets/it_ends_with_us.jpg',
    'lib/assets/killers_game_ver5.jpg'
  ];

  final List<String> actionMovies = [
    'lib/assets/s-l960.webp',
    'lib/assets/skyfall-movie-poster-james-bond-daniel-craig-2012.jpg',
    'lib/assets/deadpool_and_wolverine_ver6_xlg.jpg',
    'lib/assets/joker_folie_a_deux_ver6.jpg',
    'lib/assets/john_wick_chapter_four_ver2.jpg',
    'lib/assets/killers_game_ver5.jpg'
  ];

  final List<String> comedyMovies = [
    'lib/assets/blink.jpg',
    'lib/assets/despicable_me_four_xlg.jpg',
    'lib/assets/inside_out_two_ver2_xlg.jpg',
    'lib/assets/deadpool_and_wolverine_ver6_xlg.jpg',
    'lib/assets/thor_ragnarok_ver2.jpg',
  ];

  final List<String> romanceMovies = [
    'lib/assets/crow_ver3.jpg',
    'lib/assets/twenty_seventy_three.jpg',
    'lib/assets/mistake.jpg',
    'lib/assets/joker_folie_a_deux_ver6.jpg',
    'lib/assets/it_ends_with_us.jpg',
  ];

  final List<String> mostPopularMovies = [
    'lib/assets/s-l960.webp',
    'lib/assets/skyfall-movie-poster-james-bond-daniel-craig-2012.jpg',
    'lib/assets/crow_ver3.jpg',
    'lib/assets/despicable_me_four_xlg.jpg',
    'lib/assets/joker_folie_a_deux_ver6.jpg'
  ];

  final List<String> highlyRatedMovies = [
    'lib/assets/deadpool_and_wolverine_ver6_xlg.jpg',
    'lib/assets/twenty_seventy_three.jpg',
    'lib/assets/blink.jpg',
    'lib/assets/thor_ragnarok_ver2.jpg',
    'lib/assets/inside_out_two_ver2_xlg.jpg',
  ];

  List<String> getMoviesForSelectedCategory() {
    switch (selectedCategory) {
      case 'Action':
        return actionMovies;
      case 'Comedy':
        return comedyMovies;
      case 'Romance':
        return romanceMovies;
      default:
        return Movies;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> moviesToShow =
        getMoviesForSelectedCategory(); // Get movies based on category

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Movie Carousel Slider
            CarouselSlider(
              options: CarouselOptions(
                height: 300.0,
                autoPlay: true,
                aspectRatio: 16 / 9,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                viewportFraction: 1.0,
                autoPlayInterval: Duration(seconds: 4),
              ),
              items: carouselMovies.map((imagePath) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 16.0),
            // Categories
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Categories',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CategoryButton(
                    label: 'All',
                    isSelected: selectedCategory == 'All',
                    onPressed: () {
                      setState(() {
                        selectedCategory = 'All';
                      });
                    },
                  ),
                  CategoryButton(
                    label: 'Action',
                    isSelected: selectedCategory == 'Action',
                    onPressed: () {
                      setState(() {
                        selectedCategory = 'Action';
                      });
                    },
                  ),
                  CategoryButton(
                    label: 'Comedy',
                    isSelected: selectedCategory == 'Comedy',
                    onPressed: () {
                      setState(() {
                        selectedCategory = 'Comedy';
                      });
                    },
                  ),
                  CategoryButton(
                    label: 'Romance',
                    isSelected: selectedCategory == 'Romance',
                    onPressed: () {
                      setState(() {
                        selectedCategory = 'Romance';
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            // Movie List based on selected category
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Movies',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            MovieList(movieImages: moviesToShow),
            SizedBox(height: 24.0),
            // Only show Most Popular and Highly Rated if category is "All"
            if (selectedCategory == 'All') ...[
              // Most Popular section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Most Popular',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              MovieList(movieImages: mostPopularMovies),
              SizedBox(height: 24.0),
              // Highly Rated section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Highly Rated',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              MovieList(movieImages: highlyRatedMovies),
              SizedBox(height: 24.0),
            ],
          ],
        ),
      ),
    );
  }
}

// Button widget for movie categories
class CategoryButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;

  CategoryButton(
      {required this.label, required this.isSelected, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: isSelected ? Colors.redAccent : Colors.transparent,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      onPressed: onPressed,
      child: Text(label),
    );
  }
}

// Horizontal movie list widget
class MovieList extends StatelessWidget {
  final List<String> movieImages;

  MovieList({required this.movieImages});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movieImages.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  movieImages[index],
                  fit: BoxFit.cover,
                  width: 150.0,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
