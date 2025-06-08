import 'package:flutter/material.dart';
import 'package:movieapp/controller/app_controller.dart';
import 'package:movieapp/model/model.dart';
import 'package:provider/provider.dart';
import 'view/homepage.dart';
import 'view/savedpage.dart';
import 'view/loginpage.dart';
import 'view/bottomnav.dart';
import 'view/profilepage.dart';

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
  int _selectedIndex = 0;
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
  }

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
      routes: {
        '/profile': (context) => ProfileApp(userInfo: userInfo, onLogout: _handleLogout),
      },
      title: 'Movie Review App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: isLoggedIn ? _buildMainPage() : LoginPage(onLogin: islogin),
    );
  }

  Widget _buildMainPage() {
    final List<Widget> _screens = [
      HomeScreen(),
      SavedMoviesScreen(),
      ProfileApp(userInfo: userInfo, onLogout: _handleLogout),
    ];
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  void _handleLogout() {
    setState(() {
      isLoggedIn = false;
      userInfo = null;
    });

    // Optionally, also clear the UserModel
    Provider.of<UserModel>(context, listen: false).logout();
  }
}