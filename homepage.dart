// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = 'All'; // Default category

  // List for carousel movies
  final List<String> carouselMovies = [
    'lib/assets/general_1.jpg',
    'lib/assets/general_3.jpg',
    'lib/assets/general_5.jpg',
  ];

  // Movies for each category
  final List<String> general = [
    'lib/assets/general_1.jpg',
    'lib/assets/general_2.jpg',
    'lib/assets/general_3.jpg',
    'lib/assets/general_4.jpg',
    'lib/assets/general_5.jpg',
  ];

  final List<String> socMovies = [
    'lib/assets/soc_1.jpg',
    'lib/assets/soc_2.jpg',
    'lib/assets/soc_3.jpg',
  ];

  final List<String> seaMovies = [
    'lib/assets/sea_1.jpg',
    'lib/assets/sea_2.jpg',
    'lib/assets/sea_3.jpg',
  ];

  final List<String> sbaMovies = [
    'lib/assets/sba_1.jpg',
    'lib/assets/sba_2.jpg',
    'lib/assets/sba_3.jpg',
  ];

  final List<String> featVideos = [
    'lib/assets/feat_1.jpg',
    'lib/assets/feat_2.jpg',
    'lib/assets/feat_3.jpg',
    'lib/assets/feat_4.jpg',
    'lib/assets/feat_5.jpg',
  ];

  final List<String> stVideos = [
    'lib/assets/st_1.jpg',
    'lib/assets/st_2.jpg',
    'lib/assets/st_3.jpg',
    'lib/assets/st_4.jpg',
    'lib/assets/st_5.jpg',
  ];

  // Titles, subheaders, and descriptions for GENERAL movie
  final List<Map<String, String>> generalDetails = [
    {
      'title': "HAU Angelites' Walk and Freshmen Orientation 23-24",
      'subheader': 'General | 1:55 m',
      'description':
          'A compilation of the orientation of Freshmen in school year 2023 - 2024',
    },
    {
      'title': "Holy Angel University's All-new Features and Facilities",
      'subheader': 'General | 14:22 m',
      'description':
          'WATCH how Holy Angel University positions itself as an INTENTIONAL UNIVERSITY where every initiative is intended to help students find success in their studies, career, and life. .',
    },
    {
      'title': "HAU Freshmen Orientation 24-25",
      'subheader': 'General | 0:25 m',
      'description':
          'A compilation of the orientation of Freshmen in school year 2024 - 2025',
    },
    {
      'title': '"HAU Short film "What is my best moment in my Life?"',
      'subheader': 'General | 4:42 m',
      'description':
          'A compilation of the orientation of Freshmen in school year 2024 - 2025',
    },
    {
      'title': 'University Days 2024',
      'subheader': 'General | 4:41 m',
      'description':
          "Missing the U-DAYS 2024 celebration? Let’s rewind the most memorable highlights!",
    },
    // Add details for other movies...
  ];
// Titles, subheaders, and descriptions for SOC VIDEOS
  final List<Map<String, String>> socMovieDetails = [
    {
      'title': "SOC 𝗖𝗼𝗹𝗹𝗲𝗴𝗲 𝗗𝗮𝘆𝘀 '𝟮𝟰-’𝟮𝟱",
      'subheader': 'School of Computing | 0:43 m',
      'description':
          'Join us in a pixelated adventure through the realms of nostalgia!',
    },
    {
      'title':
          '𝐒𝐜𝐡𝐨𝐨𝐥 𝐨𝐟 𝐂𝐨𝐦𝐩𝐮𝐭𝐢𝐧𝐠 𝐆𝐞𝐧𝐞𝐫𝐚𝐥 𝐀𝐬𝐬𝐞𝐦𝐛𝐥𝐲 𝟐𝟎𝟐𝟒',
      'subheader': 'School of Computing | 2:30 m',
      'description':
          "Join us in reliving the highlights of this year’s highly anticipated General Assembly at the School of Computing! ",
    },
    {
      'title': '2000 Radiance: SOC Acquaintance',
      'subheader': 'School of Computing | 1:30 m',
      'description':
          '🌟 Relive the magic! 🌟 Watch our Throwback Saturday at 2000 Radiance: SOC Acquaintance Party! 💫 that hosted a nostalgic night! 🎉',
    },
    // Add more action movies...
  ];

// Titles, subheaders, and descriptions for SEA VIDEOS
  final List<Map<String, String>> seaMovieDetails = [
    {
      'title': 'Mythvlog Madness Promotional Video 1',
      'subheader': 'School of Engineering and Architecture | 2:30 m',
      'description':
          'Mythvlog Madness Promotional Video for the Temple of Aether',
    },
    {
      'title': 'SEA Org Fest. 23-24',
      'subheader': 'School of Engineering and Architecture | 2:16 m',
      'description':
          "Highlights of the School of Engineering and Architecture's epic Freshman Orientation and Org Fest.",
    },
    {
      'title': 'Mythvlog Madness Promotional Video 2',
      'subheader': 'School of Engineering and Architecture | 4:23 m',
      'description': 'Mythvlog Madness Spoof Video for the Temple of Aether',
    },
    // Add more comedy movies...
  ];

// Titles, subheaders, and descriptions for SBA VIDEOS
  final List<Map<String, String>> sbaMovieDetails = [
    {
      'title': 'SBA Days 2023 Recap',
      'subheader': 'School of Business & Accountancy | 2:33 m',
      'description':
          'Step back in time and join us on a mesmerizing journey through the glitz and glam of Tinseltown!',
    },
    {
      'title': 'Love and Fins: Campus Cupid On Duty',
      'subheader': 'School of Business & Accountancy | 0:39 m',
      'description':
          'A Valentines’ Trilogy of Love specifically the Love and Fins: Campus Cupid On Duty segment! ',
    },
    {
      'title': 'SBA 2023 Recap',
      'subheader': 'School of Business & Accountancy | 1:33 m',
      'description':
          "Dolphins! Buckle up as we're taking a whirlwind trip through the vibrant memories of 2023!",
    },
    // Add more SBA movies...
  ];
  // Titles, subheaders, and descriptions for FEAT movie
  final List<Map<String, String>> featDetails = [
    {
      'title': "HAU Basic Education Featurette",
      'subheader': 'Featurette | 0:57 m',
      'description':
          "Watch and witness the grandeur of Holy Angel University's 𝗕𝗮𝘀𝗶𝗰 𝗘𝗱𝘂𝗰𝗮𝘁𝗶𝗼𝗻 𝗗𝗲𝗽𝗮𝗿𝘁𝗺𝗲𝗻𝘁, where every initiative is intended to help students find success in their studies, career, and life. ",
    },
    {
      'title': "HAU School of Engineering and Architecture Featurette",
      'subheader': 'Featurette | 1:42 m',
      'description':
          "Watch and witness the grandeur of Holy Angel University's 𝗦𝗰𝗵𝗼𝗼𝗹 𝗼𝗳 𝗘𝗻𝗴𝗶𝗻𝗲𝗲𝗿𝗶𝗻𝗴 𝗮𝗻𝗱 𝗔𝗿𝗰𝗵𝗶𝘁𝗲𝗰𝘁𝘂𝗿𝗲, where every initiative is intended to help students find success in their studies, career, and life. ",
    },
    {
      'title': "HAU School of Computing Featurette",
      'subheader': 'Featurette | 1:40 m',
      'description':
          "Watch and witness the grandeur of Holy Angel University's 𝗦𝗰𝗵𝗼𝗼𝗹 𝗼𝗳 𝗖𝗼𝗺𝗽𝘂𝘁𝗶𝗻𝗴, where every initiative is intended to help students find success in their studies, career, and life. ",
    },
    {
      'title': 'HAU School of Nursing and Allied Medical Sciences Featurette',
      'subheader': 'Featurette | 2:09 m',
      'description':
          "Watch and witness the grandeur of Holy Angel University's 𝗦𝗰𝗵𝗼𝗼𝗹 𝗼𝗳 𝗡𝘂𝗿𝘀𝗶𝗻𝗴 𝗮𝗻𝗱 𝗔𝗹𝗹𝗶𝗲𝗱 𝗠𝗲𝗱𝗶𝗰𝗮𝗹 𝗦𝗰𝗶𝗲𝗻𝗰𝗲𝘀, where every initiative is intended to help students find success in their studies, career, and life.",
    },
    {
      'title':
          'HAU College of Criminal Justice Education and Forensics Featurette',
      'subheader': 'Featurette | 2:35 m',
      'description':
          "Watch and witness the grandeur of Holy Angel University's 𝗖𝗼𝗹𝗹𝗲𝗴𝗲 𝗼𝗳 𝗖𝗿𝗶𝗺𝗶𝗻𝗮𝗹 𝗝𝘂𝘀𝘁𝗶𝗰𝗲 𝗘𝗱𝘂𝗰𝗮𝘁𝗶𝗼𝗻 𝗮𝗻𝗱 𝗙𝗼𝗿𝗲𝗻𝘀𝗶𝗰𝘀, where every initiative is intended to help students find success in their studies, career, and life. ",
    },
  ];

  // Titles, subheaders, and descriptions for Student Showcase
  final List<Map<String, String>> stDetails = [
    {
      'title': "#HAUToStopTheSpread tips from Ian Ashley Ferrer Batalao",
      'subheader': 'Student Showcase | 3:22 m',
      'description':
          "Invaluable tips to prevent the spread of COVID-19 from BS Aeronautical Engineering freshman Ian Ashley Ferrer Batalao!  ",
    },
    {
      'title': "SOMEWHERE OVER THE RAINBOW - Holy Angel University Students",
      'subheader': 'Student Showcase | 2:33 m',
      'description': 'A cover of the Song "Over the Rainbow" by Judy Garland',
    },
    {
      'title': "I DREAMED A DREAM SMALL - Holy Angel University Students",
      'subheader': 'Student Showcase | 2:33 m',
      'description':
          'A cover of the Song "I Dreamed a Dream" from the 1980 musical Les Misérables',
    },
    {
      'title':
          "HAU Christmas 2023: String Ensemble's God Rest Ye Merry Gentlemen",
      'subheader': 'Student Showcase | 2:36 m',
      'description':
          "Let the enchanting melodies of HAU String Ensemble's 𝗚𝗼𝗱 𝗥𝗲𝘀𝘁 𝗬𝗲 𝗠𝗲𝗿𝗿𝘆 𝗚𝗲𝗻𝘁𝗹𝗲𝗺𝗲𝗻 fill your heart with holiday cheer! 🎻🎄.",
    },
    {
      'title': '#TrueLoveHAUppens2022',
      'subheader': 'Student Showcase | 1:16 m',
      'description':
          "Someday, someone will walk into your life and make you realize why it never worked out with someone else.  ❤️🤍 #TrueLoveHAUppens2022 ",
    },
  ];
// Video URLs for each category
  final List<String> generalUrls = [
    'https://youtube.com/watch?v=MZTAGIQlxGI',
    'https://www.youtube.com/watch?v=gbSMS_wIxUo',
    'https://youtu.be/Nnbci3gwDX8',
    'https://youtu.be/yp4q999YecQ',
    'https://youtu.be/wDeUSewPaKw',
  ];
  // Video URLs for each category
  final List<String> socMovieUrls = [
    'https://youtu.be/X-L1bUt8Ucs',
    'https://youtu.be/kls39sk8v4w',
    'https://youtu.be/A7baKoakJls',
  ];
  // Video URLs for each category
  final List<String> seaMovieUrls = [
    'https://youtu.be/4XbWjauZTW8',
    'https://youtu.be/B_7hOT7P1_w',
    'https://youtu.be/54jt-et5e0c',
  ];
// Video URLs for SBA movies
  final List<String> sbaMovieUrls = [
    'https://youtu.be/uoU_FGzG0DM',
    'https://youtu.be/EPGcdk7XIHY',
    'https://youtu.be/oQBq2ckP5eM',
  ];
// Video URLs for FEAT movies
  final List<String> featMovieUrls = [
    'https://youtu.be/LcB82nxB8_Y?si=kUy4X4Gvn7xQl1DG',
    'https://youtu.be/pJCcSU0ZKDo?si=4wIRu3WgGMExtDky',
    'https://youtu.be/wFj8-J_ohmU?si=HcztAR9cQwLjPiZW',
    'https://youtu.be/NSlFgP9eisA?si=rEgGoF7H4U6jWW7P',
    'https://youtu.be/N5Lvw1VJAEI?si=phdPjibJKl9YzxLK',
  ];

  // Video URLs for Student Showcase
  final List<String> stMovieUrls = [
    'https://youtu.be/0uLtdzDERTY?si=KC_RJbXhOYLinFOB',
    'https://youtu.be/reJPC2E3RpA?si=RUSDhju5aJ0c8jC4',
    'https://youtu.be/jO5LQPag6M8?si=fCeqY869KM8DlZoV',
    'https://youtu.be/VUQkvatxo-g?si=cfz5Z1XnTaAnWusO',
    'https://youtu.be/Hr_9V566DDI?si=y8U6v7lIZ8C5xtSI',
  ];

  List<String> getMoviesForSelectedCategory() {
    switch (selectedCategory) {
      case 'SOC':
        return socMovies;
      case 'SEA':
        return seaMovies;
      case 'SBA':
        return sbaMovies;
      default:
        return general;
    }
  }

  List<String> getVideoUrlsForSelectedCategory() {
    switch (selectedCategory) {
      case 'SOC':
        return socMovieUrls;
      case 'SEA':
        return seaMovieUrls;
      case 'SBA':
        return sbaMovieUrls;
      default:
        return generalUrls;
    }
  }

  // Show YouTube video in a dialog with title, subheader, and description
  void showVideoDialog(
      String videoUrl, String title, String subheader, String description) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: const Color.fromARGB(248, 26, 30, 44),
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(8.0), // Rounded corners for the dialog
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Padding added here for video player with separate values for each edge
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      16.0, 12.0, 16.0, 8.0), // Left, Top, Right, Bottom
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                        5.0), // Rounded corners for video player
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: YoutubePlayer(
                        controller: YoutubePlayerController(
                          initialVideoId:
                              YoutubePlayer.convertUrlToId(videoUrl)!,
                          flags: YoutubePlayerFlags(
                            autoPlay: true,
                            mute: false,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Movie Title
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 8.0),

                      // Subheader
                      Text(
                        subheader,
                        style: TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          color: Colors.grey[300],
                        ),
                      ),
                      SizedBox(height: 16.0),

                      // Description
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> moviesToShow =
        getMoviesForSelectedCategory(); // Get movies based on category
    List<String> videoUrlsToShow =
        getVideoUrlsForSelectedCategory(); // Get video URLs based on category

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Movie Carousel Slider
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0, // Adjust the left padding as needed
                right: 16.0, // Adjust the right padding as needed
                top: 20.0, // Adjust the top padding as needed
                bottom: 0.0, // Adjust the bottom padding as needed
              ),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 250.0,
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
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(
                            4.0), // Apply rounded edges here
                        child: Stack(
                          children: [
                            Image.asset(
                              imagePath,
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width,
                            ),
                            // Gradient overlay only at the bottom part
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  height:
                                      200, // Adjust the height of the gradient overlay as needed
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        const Color.fromARGB(255, 0, 0, 0)
                                            .withOpacity(
                                                1), // Color at the bottom
                                        Colors
                                            .transparent, // Color at the top (transparent)
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 1.0),

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
                    label: 'SOC',
                    isSelected: selectedCategory == 'SOC',
                    onPressed: () {
                      setState(() {
                        selectedCategory = 'SOC';
                      });
                    },
                  ),
                  CategoryButton(
                    label: 'SEA',
                    isSelected: selectedCategory == 'SEA',
                    onPressed: () {
                      setState(() {
                        selectedCategory = 'SEA';
                      });
                    },
                  ),
                  CategoryButton(
                    label: 'SBA',
                    isSelected: selectedCategory == 'SBA',
                    onPressed: () {
                      setState(() {
                        selectedCategory = 'SBA';
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
                'Videos',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 8.0),
            MovieList(
              movieImages: moviesToShow,
              movieUrls: videoUrlsToShow, // Pass the video URLs
              onMovieTap: (index) {
                // Determine which set of details and video URLs to use based on the selected category
                String title = '';
                String subheader = '';
                String description = '';
                String videoUrl = '';

                if (selectedCategory == 'SOC') {
                  title = socMovieDetails[index]['title']!;
                  subheader = socMovieDetails[index]['subheader']!;
                  description = socMovieDetails[index]['description']!;
                  videoUrl = socMovieUrls[index]; // Use SOC movie URLs
                } else if (selectedCategory == 'SEA') {
                  title = seaMovieDetails[index]['title']!;
                  subheader = seaMovieDetails[index]['subheader']!;
                  description = seaMovieDetails[index]['description']!;
                  videoUrl = seaMovieUrls[index]; // Use SEA movie URLs
                } else if (selectedCategory == 'SBA') {
                  title = sbaMovieDetails[index]['title']!;
                  subheader = sbaMovieDetails[index]['subheader']!;
                  description = sbaMovieDetails[index]['description']!;
                  videoUrl = sbaMovieUrls[index]; // Use SBA movie URLs
                } else {
                  title = generalDetails[index]['title']!;
                  subheader = generalDetails[index]['subheader']!;
                  description = generalDetails[index]['description']!;
                  videoUrl = generalUrls[index]; // Use default movie URLs
                }

                // Call the showVideoDialog method with the selected movie's details
                showVideoDialog(videoUrl, title, subheader, description);
              },
            ),

            if (selectedCategory == 'All') ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Featurettes',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              MovieList(
                movieImages: featVideos,
                movieUrls: videoUrlsToShow, // Pass the video URLs
                onMovieTap: (index) {
                  showVideoDialog(
                    featMovieUrls[index],
                    featDetails[index]['title']!,
                    featDetails[index]['subheader']!,
                    featDetails[index]['description']!,
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Student Showcase',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              MovieList(
                movieImages: stVideos,
                movieUrls: videoUrlsToShow, // Pass the video URLs
                onMovieTap: (index) {
                  showVideoDialog(
                    stMovieUrls[index],
                    stDetails[index]['title']!,
                    stDetails[index]['subheader']!,
                    stDetails[index]['description']!,
                  );
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// Category button widget
class CategoryButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;

  CategoryButton({
    required this.label,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected
            ? const Color.fromARGB(255, 241, 78, 28)
            : const Color.fromARGB(255, 15, 15, 15), // Button background color
        foregroundColor: isSelected // Text color based on selection
            ? Colors.white // Color when selected
            : const Color.fromARGB(
                255, 255, 255, 255), // Color when not selected
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
      ),
      onPressed: onPressed,
      child: Text(label),
    );
  }
}

// Movie list widget
class MovieList extends StatelessWidget {
  final List<String> movieImages;
  final List<String> movieUrls;
  final Function(int) onMovieTap;

  MovieList({
    required this.movieImages,
    required this.movieUrls,
    required this.onMovieTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150, // Adjust height to fit the aspect ratio
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movieImages.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => onMovieTap(index),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              width: 150, // Adjust width to fit the aspect ratio
              child: Column(
                children: [
                  // AspectRatio widget to enforce 16:9 aspect ratio
                  AspectRatio(
                    aspectRatio: 16 / 9, // 16:9 aspect ratio
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4.0),
                          child: Image.asset(
                            movieImages[index],
                            fit: BoxFit
                                .cover, // Ensures the image covers the aspect ratio
                          ),
                        ),
                        // Gradient overlay
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  const Color.fromARGB(255, 7, 7, 7).withOpacity(
                                      0.8), // Change color and opacity as needed
                                  Colors.transparent,
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
