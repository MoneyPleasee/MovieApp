//loginpage.dart
import 'package:flutter/material.dart';
import '../controller/app_controller.dart';
import '../model/model.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback onLogin;

  // Constructor that accepts the onLogin callback
  LoginPage({required this.onLogin});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final LoginController _loginController = LoginController();
  // Constructor that accepts the onLogin callback
  Future<void> _login() async {
    User user = User(
      username: _usernameController.text,
      password: _passwordController.text,
    );
    bool success = await _loginController.login(user);

    if (success) {
      widget.onLogin();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Add this to avoid overflow
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black87, Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          // Wrap the content in SingleChildScrollView
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                    height: 100), // Add some top space to center content better
                // Logo at the top
                Center(
                  child: Image.asset(
                    'lib/assets/applogo2.png',
                    width: 120, // Adjust width as needed
                    height: 120, // Adjust height as needed
                  ),
                ),
                SizedBox(height: 40), // Space between logo and welcome text
                Text(
                  'Welcome to CINEMUST',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                    height: 24), // Space between welcome text and text fields
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    hintText: 'Username',
                    hintStyle: TextStyle(color: Colors.white70),
                    filled: true,
                    fillColor: Colors.white12,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                    height:
                        16), // Space between username and password text fields
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.white70),
                    filled: true,
                    fillColor: Colors.white12,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                    height:
                        24), // Space between password field and login button
                ElevatedButton(
                  onPressed:
                      _login, // Trigger the onLogin callback when pressed
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 24), // Space at the bottom
              ],
            ),
          ),
        ),
      ),
    );
  }
}
