import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// Screen that displays saved movies with search functionality
class SavedMoviesScreen extends StatefulWidget {
  @override
  _SavedMoviesScreenState createState() => _SavedMoviesScreenState();
}

class _SavedMoviesScreenState extends State<SavedMoviesScreen> {
  // Original list of saved movies
  final List<Movie> movies = [
    Movie(
      title: "HAU Angelites' Walk and Freshmen Orientation 23-24",
      genre: 'General, College',
      description:
          'A compilation of the orientation of Freshmen in school year 2023 - 2024',
      imagePath: 'lib/assets/general_1.jpg',
      videoUrl: 'https://youtube.com/watch?v=MZTAGIQlxGI', // Example URL
    ),
    Movie(
      title: "Holy Angel University's All-new Features and Facilities",
      genre: 'General',
      description:
          'WATCH how Holy Angel University positions itself as an INTENTIONAL UNIVERSITY where every initiative is intended to help students find success in their studies, career, and life. .',
      imagePath: 'lib/assets/general_2.jpg',
      videoUrl: 'https://www.youtube.com/watch?v=gbSMS_wIxUo', // Example URL
    ),
    Movie(
      title: "HAU Freshmen Orientation 24-25",
      genre: 'General, College',
      description:
          'A compilation of the orientation of Freshmen in school year 2024 - 2025',
      imagePath: 'lib/assets/general_3.jpg',
      videoUrl: 'https://youtu.be/Nnbci3gwDX8', // Example URL
    ),
    Movie(
      title: '"HAU Short film "What is my best moment in my Life?"',
      genre: 'General, Entertainment, Short Film',
      description:
          "Together with the thousand of Angelites who have witnessed the warmth, beauty and excellence in the university, “𝑯𝑨𝑼, 𝑦𝑜𝑢 𝑎𝑟𝑒 𝑡ℎ𝑒 𝙗𝙚𝙨𝙩 𝙢𝙤𝙢𝙚𝙣𝙩 𝑖𝑡𝑠𝑒𝑙𝑓.”",
      imagePath: 'lib/assets/general_4.jpg',
      videoUrl: 'https://youtu.be/yp4q999YecQ', // Example URL
    ),
    Movie(
      title: 'University Days 2024',
      genre: 'General, Entertainment',
      description:
          "Missing the U-DAYS 2024 celebration? Let’s rewind the most memorable highlights!",
      imagePath: 'lib/assets/general_5.jpg',
      videoUrl: 'https://youtu.be/wDeUSewPaKw', // Example URL
    ),
    Movie(
      // Featurette
      title: "HAU Basic Education Featurette",
      genre: 'Basic Ed, Featurette',
      description:
          "Watch and witness the grandeur of Holy Angel University's 𝗕𝗮𝘀𝗶𝗰 𝗘𝗱𝘂𝗰𝗮𝘁𝗶𝗼𝗻 𝗗𝗲𝗽𝗮𝗿𝘁𝗺𝗲𝗻𝘁, where every initiative is intended to help students find success in their studies, career, and life. ",
      imagePath: 'lib/assets/feat_1.jpg',
      videoUrl:
          'https://youtu.be/LcB82nxB8_Y?si=kUy4X4Gvn7xQl1DG', // Example URL
    ),
    Movie(
      title: "HAU School of Engineering and Architecture Featurette",
      genre: 'College, Engineering, Architecture, SEA, Featurette',
      description:
          "Watch and witness the grandeur of Holy Angel University's 𝗦𝗰𝗵𝗼𝗼𝗹 𝗼𝗳 𝗘𝗻𝗴𝗶𝗻𝗲𝗲𝗿𝗶𝗻𝗴 𝗮𝗻𝗱 𝗔𝗿𝗰𝗵𝗶𝘁𝗲𝗰𝘁𝘂𝗿𝗲, where every initiative is intended to help students find success in their studies, career, and life. ",
      imagePath: 'lib/assets/feat_2.jpg',
      videoUrl:
          'https://youtu.be/pJCcSU0ZKDo?si=4wIRu3WgGMExtDky', // Example URL
    ),
    Movie(
      title: "HAU School of Computing Featurette",
      genre: 'College, Computing, ICT, SOC, Featurette',
      description:
          "Watch and witness the grandeur of Holy Angel University's 𝗦𝗰𝗵𝗼𝗼𝗹 𝗼𝗳 𝗖𝗼𝗺𝗽𝘂𝘁𝗶𝗻𝗴, where every initiative is intended to help students find success in their studies, career, and life. ",
      imagePath: 'lib/assets/feat_3.jpg',
      videoUrl: 'https://youtu.be/wFj8-J_ohmU?si=HcztAR9cQwLjPiZW',
    ),
    Movie(
      title: 'HAU School of Nursing and Allied Medical Sciences Featurette',
      genre: 'College, Nursing, Medical Sciences, SNAMS, Featurette',
      description:
          "Watch and witness the grandeur of Holy Angel University's 𝗦𝗰𝗵𝗼𝗼𝗹 𝗼𝗳 𝗡𝘂𝗿𝘀𝗶𝗻𝗴 𝗮𝗻𝗱 𝗔𝗹𝗹𝗶𝗲𝗱 𝗠𝗲𝗱𝗶𝗰𝗮𝗹 𝗦𝗰𝗶𝗲𝗻𝗰𝗲𝘀, where every initiative is intended to help students find success in their studies, career, and life.",
      imagePath: 'lib/assets/feat_4.jpg',
      videoUrl: 'https://youtu.be/NSlFgP9eisA?si=rEgGoF7H4U6jWW7P',
    ),
    Movie(
      title:
          'HAU College of Criminal Justice Education and Forensics Featurette',
      genre: 'College, Criminology, Forensics, CCJEF, Featurette',
      description:
          "Watch and witness the grandeur of Holy Angel University's 𝗖𝗼𝗹𝗹𝗲𝗴𝗲 𝗼𝗳 𝗖𝗿𝗶𝗺𝗶𝗻𝗮𝗹 𝗝𝘂𝘀𝘁𝗶𝗰𝗲 𝗘𝗱𝘂𝗰𝗮𝘁𝗶𝗼𝗻 𝗮𝗻𝗱 𝗙𝗼𝗿𝗲𝗻𝘀𝗶𝗰𝘀, where every initiative is intended to help students find success in their studies, career, and life. ",
      imagePath: 'lib/assets/feat_5.jpg',
      videoUrl: 'https://youtu.be/N5Lvw1VJAEI?si=phdPjibJKl9YzxLK',
    ),
    Movie(
      // STUDENT SHOWCASE
      title: "#HAUToStopTheSpread tips from Ian Ashley Ferrer Batalao",
      genre: 'Student Showcase, Entertainment',
      description:
          "Invaluable tips to prevent the spread of COVID-19 from BS Aeronautical Engineering freshman Ian Ashley Ferrer Batalao!  ",
      imagePath: 'lib/assets/st_1.jpg',
      videoUrl: 'https://youtu.be/wFj8-J_ohmU?si=HcztAR9cQwLjPiZW',
    ),
    Movie(
      title: "SOMEWHERE OVER THE RAINBOW - Holy Angel University Students",
      genre: 'Student Showcase, Entertainment',
      description: 'A cover of the Song "Over the Rainbow" by Judy Garland',
      imagePath: 'lib/assets/st_2.jpg',
      videoUrl: 'https://youtu.be/NSlFgP9eisA?si=rEgGoF7H4U6jWW7P',
    ),
    Movie(
      title: "I DREAMED A DREAM SMALL - Holy Angel University Students",
      genre: 'Student Showcase, Entertainment',
      description:
          'A cover of the Song "I Dreamed a Dream" from the 1980 musical Les Misérables',
      imagePath: 'lib/assets/st_3.jpg',
      videoUrl: 'https://youtu.be/N5Lvw1VJAEI?si=phdPjibJKl9YzxLK',
    ),
    Movie(
      title:
          "HAU Christmas 2023: String Ensemble's God Rest Ye Merry Gentlemen",
      genre: 'Student Showcase, Entertainment',
      description:
          "Let the enchanting melodies of HAU String Ensemble's 𝗚𝗼𝗱 𝗥𝗲𝘀𝘁 𝗬𝗲 𝗠𝗲𝗿𝗿𝘆 𝗚𝗲𝗻𝘁𝗹𝗲𝗺𝗲𝗻 fill your heart with holiday cheer! 🎻🎄.",
      imagePath: 'lib/assets/st_4.jpg',
      videoUrl: 'https://youtu.be/N5Lvw1VJAEI?si=phdPjibJKl9YzxLK',
    ),
    Movie(
      title: '#TrueLoveHAUppens2022',
      genre: 'Student Showcase, Entertainment, Short Film',
      description:
          "Someday, someone will walk into your life and make you realize why it never worked out with someone else.  ❤️🤍 #TrueLoveHAUppens2022 ",
      imagePath: 'lib/assets/st_5.jpg',
      videoUrl: 'https://youtu.be/N5Lvw1VJAEI?si=phdPjibJKl9YzxLK',
    ),
    Movie(
      // SOC
      title: "SOC 𝗖𝗼𝗹𝗹𝗲𝗴𝗲 𝗗𝗮𝘆𝘀 '𝟮𝟰-’𝟮𝟱",
      genre: 'College, Computing, ICT, SOC, Entertainment',
      description:
          'Join us in a pixelated adventure through the realms of nostalgia!',
      imagePath: 'lib/assets/soc_1.jpg',
      videoUrl: 'https://youtu.be/X-L1bUt8Ucs',
    ),
    Movie(
      title:
          '𝐒𝐜𝐡𝐨𝐨𝐥 𝐨𝐟 𝐂𝐨𝐦𝐩𝐮𝐭𝐢𝐧𝐠 𝐆𝐞𝐧𝐞𝐫𝐚𝐥 𝐀𝐬𝐬𝐞𝐦𝐛𝐥𝐲 𝟐𝟎𝟐𝟒',
      genre: 'College, Computing, ICT, SOC, Entertainment',
      description:
          "Join us in reliving the highlights of this year’s highly anticipated General Assembly at the School of Computing! ",
      imagePath: 'lib/assets/soc_2.jpg',
      videoUrl: 'https://youtu.be/kls39sk8v4w',
    ),
    Movie(
      title: '2000 Radiance: SOC Acquaintance',
      genre: 'College, Computing, ICT, SOC, Entertainment',
      description:
          '🌟 Relive the magic! 🌟 Watch our Throwback Saturday at 2000 Radiance: SOC Acquaintance Party! 💫 that hosted a nostalgic night! 🎉',
      imagePath: 'lib/assets/soc_3.jpg',
      videoUrl: 'https://youtu.be/A7baKoakJls',
    ),
    Movie(
      // SEA
      title: 'Mythvlog Madness Promotional Video 1',
      genre: 'College, Engineering, Architecture, SEA, Entertainment',
      description:
          'Mythvlog Madness Promotional Video for the Temple of Aether',
      imagePath: 'lib/assets/sea_1.jpg',
      videoUrl: 'https://youtu.be/4XbWjauZTW8',
    ),
    Movie(
      title: 'SEA Org Fest. 23-24',
      genre: 'College, Engineering, Architecture, SEA, Entertainment',
      description:
          "Highlights of the School of Engineering and Architecture's epic Freshman Orientation and Org Fest.",
      imagePath: 'lib/assets/sea_2.jpg',
      videoUrl: 'https://youtu.be/B_7hOT7P1_w',
    ),
    Movie(
      title: 'Mythvlog Madness Promotional Video 2',
      genre: 'College, Engineering, Architecture, SEA, Entertainment',
      description: 'Mythvlog Madness Spoof Video for the Temple of Aether',
      imagePath: 'lib/assets/sea_3.jpg',
      videoUrl: 'https://youtu.be/54jt-et5e0c',
    ),
    Movie(
      // SBA
      title: 'SBA Days 2023 Recap',
      genre: 'College, Business, Accountancy, SBA, Entertainment',
      description:
          'Step back in time and join us on a mesmerizing journey through the glitz and glam of Tinseltown!',
      imagePath: 'lib/assets/sba_1.jpg',
      videoUrl: 'https://youtu.be/uoU_FGzG0DM',
    ),
    Movie(
      title: 'SEA Org Fest. 23-24',
      genre: 'College, Business, Accountancy, SBA, Entertainment',
      description:
          'A Valentines’ Trilogy of Love specifically the Love and Fins: Campus Cupid On Duty segment! ',
      imagePath: 'lib/assets/sba_2.jpg',
      videoUrl: 'https://youtu.be/EPGcdk7XIHY',
    ),
    Movie(
      title: 'SBA 2023 Recap',
      genre: 'College, Engineering, Architecture, SEA, Entertainment',
      description:
          "Dolphins! Buckle up as we're taking a whirlwind trip through the vibrant memories of 2023!",
      imagePath: 'lib/assets/sba_3.jpg',
      videoUrl: 'https://youtu.be/oQBq2ckP5eM',
    ),
  ];

  // List of movies that match the search query
  List<Movie> filteredMovies = [];

  // Controller for the search field
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initially, all movies are shown
    filteredMovies = movies;
  }

  // Method to filter the movie list based on the search query
  void filterMovies(String query) {
    final results = movies.where((movie) {
      final lowerCaseTitle = movie.title.toLowerCase();
      final lowerCaseGenre = movie.genre.toLowerCase();
      final lowerCaseQuery = query.toLowerCase();
      // Check if the query matches the title or the genre
      return lowerCaseTitle.contains(lowerCaseQuery) ||
          lowerCaseGenre.contains(lowerCaseQuery);
    }).toList();

    setState(() {
      filteredMovies = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 7, 8, 21),
                Color.fromARGB(255, 26, 26, 26)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Text(
          'Search Videos',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            // Search field to filter the movie list
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search Videos...',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: const Color.fromARGB(255, 253, 246, 246),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: filterMovies,
            ),
          ),
          Expanded(
            // Displays the filtered list of movies using ListView.builder
            child: ListView.builder(
              itemCount: filteredMovies.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: MovieContainer(
                    imagePath: filteredMovies[index].imagePath,
                    title: filteredMovies[index].title,
                    genre: filteredMovies[index].genre,
                    description: filteredMovies[index].description,
                    videoUrl: filteredMovies[index].videoUrl, // Pass videoUrl
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MovieContainer extends StatelessWidget {
  final String imagePath;
  final String title;
  final String genre;
  final String description;
  final String videoUrl; // Added video URL parameter

  MovieContainer({
    required this.imagePath,
    required this.title,
    required this.genre,
    required this.description,
    required this.videoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 17, 13, 18),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 160,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
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
                  SizedBox(height: 4), // Space between title and genre
                  Text(
                    genre,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(height: 8),
                  // Using LayoutBuilder to adjust font size of description
                  LayoutBuilder(
                    builder: (context, constraints) {
                      // Calculate the font size based on the container's width
                      double fontSize = constraints.maxWidth < 200 ? 12 : 14;

                      return Text(
                        description,
                        style: TextStyle(
                            color: Colors.white70, fontSize: fontSize),
                        maxLines: 3, // Limit to 3 lines
                        overflow: TextOverflow.ellipsis, // Handle overflow
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.play_arrow,
                size: 30, color: const Color.fromARGB(255, 218, 40, 67)),
            onPressed: () {
              showVideoDialog(context, videoUrl); // Only pass the video URL
            },
          ),
        ],
      ),
    );
  }

  // Method to display the video dialog with only the video player
  void showVideoDialog(BuildContext context, String videoUrl) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: const Color.fromARGB(248, 26, 30, 44),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: YoutubePlayer(
                controller: YoutubePlayerController(
                  initialVideoId: YoutubePlayer.convertUrlToId(videoUrl)!,
                  flags: YoutubePlayerFlags(
                    autoPlay: true,
                    mute: false,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

// Method to display the video dialog with only the video player
void showVideoDialog(BuildContext context, String videoUrl) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: const Color.fromARGB(248, 26, 30, 44),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: YoutubePlayer(
              controller: YoutubePlayerController(
                initialVideoId: YoutubePlayer.convertUrlToId(videoUrl)!,
                flags: YoutubePlayerFlags(
                  autoPlay: true,
                  mute: false,
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}

// Movie model class that holds movie details
class Movie {
  final String title;
  final String genre;
  final String description;
  final String imagePath;
  final String videoUrl; // Added videoUrl property

  Movie({
    required this.title,
    required this.genre,
    required this.description,
    required this.imagePath,
    required this.videoUrl,
  });
}
