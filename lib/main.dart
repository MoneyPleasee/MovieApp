import 'package:flutter/material.dart';
import 'package:movieapp/controller/app_controller.dart';
import 'package:movieapp/model/model.dart';
import 'package:provider/provider.dart';
import 'view/homepage.dart';
import 'view/savedpage.dart';
import 'view/loginpage.dart';
import 'view/bottomnav.dart';
import 'view/profilepage.dart';

//flutter run -d chrome --web-browser-flag "--disable-web-security"

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final UserController controller = UserController();
  UserInfo? userInfo;
  int _selectedIndex =
      0; // Track the currently selected bottom navigation index
  bool isLoggedIn = false; // Track if the user is logged in

  // List of screens to navigate between when logged in

  @override
  void initState() {
    super.initState();
  }

  // Handle bottom navigation bar item taps
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> islogin(String username) async {
    await _fetchUserInfo(username);
    setState(() {
      isLoggedIn = true;
    });
  }

  Future<void> _fetchUserInfo(String username) async {
    userInfo = await controller.fetchUserByUsername(username);
    setState(() {});
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
      //debugShowCheckedModeBanner: false, //UNCOMMENT THIS TO REMOVE DEBUG BANNER
      home: isLoggedIn ? _buildMainPage() : LoginPage(onLogin: islogin),
    );
  }

  // Build the main page with bottom navigation bar
  Widget _buildMainPage() {
    final List<Widget> _screens = [
      HomeScreen(),
      SavedMoviesScreen(),
      ProfileApp(userInfo: userInfo), // Now this accepts a nullable UserInfo
    ];
    return Scaffold(
      body: _screens[_selectedIndex], // Display the selected screen
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped, // Handle bottom navigation taps
      ),
    );
  }
}
