import 'package:flutter/material.dart';
import 'view/homepage.dart';
import 'view/savedpage.dart';
import 'view/loginpage.dart';
import 'view/bottomnav.dart';
import 'view/searchscreen.dart';
import 'view/profilepage.dart';

//flutter run -d chrome --web-browser-flag "--disable-web-security"

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex =
      0; // Track the currently selected bottom navigation index
  bool isLoggedIn = false; // Track if the user is logged in

  // List of screens to navigate between when logged in
  final List<Widget> _screens = [
    HomeScreen(),
    SavedMoviesScreen(),
    ProfilePage(),
  ];

  // Handle bottom navigation bar item taps
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void islogin() {
    setState(() {
      isLoggedIn = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Review App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
      ),
      // Show login page if not logged in, otherwise show main app
      home: isLoggedIn ? _buildMainPage() : LoginPage(onLogin: islogin),
    );
  }

  // Build the main page with bottom navigation bar
  Widget _buildMainPage() {
    return Scaffold(
      body: _screens[_selectedIndex], // Display the selected screen
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped, // Handle bottom navigation taps
      ),
    );
  }
}
