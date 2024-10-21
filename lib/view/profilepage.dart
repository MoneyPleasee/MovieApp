//profilepage.dart
import 'package:flutter/material.dart';
import 'package:movieapp/model/model.dart';
import 'package:movieapp/view/editprofilepage.dart';
import 'package:provider/provider.dart';

// Main app widget
class ProfileApp extends StatelessWidget {
  final UserInfo? userInfo;

  ProfileApp({required this.userInfo});
  @override
  Widget build(BuildContext context) {
    String username = Provider.of<UserModel>(context).username;

    return MaterialApp(
      title: 'Profile Page',
      theme: ThemeData(
        brightness: Brightness.dark, // Dark theme
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Color(0xFF1C1B33),
      ),
      home: ProfilePage(
          username: username,
          userInfo: userInfo), // Load ProfilePage as the home screen
    );
  }
}

// Profile Page
class ProfilePage extends StatefulWidget {
  final String username;
  final UserInfo? userInfo;
  ProfilePage({required this.username, required this.userInfo});
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Controllers to manage the text fields for username, phone, and email. Put on controller folder ones backend development begins
  late TextEditingController _firstnameController;
  late TextEditingController _lastnameController;
  late TextEditingController _emailController;
  String _profileImagePath = 'lib/assets/feat_1.jpg';

  @override
  void initState() {
    super.initState();
    _firstnameController = TextEditingController(text: widget.userInfo?.fname);
    _lastnameController = TextEditingController(text: widget.userInfo?.lname);
    _emailController = TextEditingController(text: widget.userInfo?.email);
  }

  @override
  void dispose() {
    _firstnameController.dispose();
    _lastnameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

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
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
        ),
        title: Text(
          'Profile Page',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),

      // Main body with profile details
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile picture and edit icon
            Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(_profileImagePath),
                  backgroundColor: Colors.grey,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: IconButton(
                    icon: Icon(Icons.camera_alt, color: Colors.white),
                    onPressed: () {
                      // Add functionality to change profile picture when backend dev begins
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              widget.username, // Static user name display
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final updatedInfo = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        EditProfilePage(userInfo: widget.userInfo!),
                  ),
                );
                if (updatedInfo != null) {
                  setState(() {
                    _firstnameController.text = updatedInfo.fname;
                    _lastnameController.text = updatedInfo.lname;
                    _emailController.text = updatedInfo.email;
                  });
                }
              },
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.grey[400]),
              child:
                  Text('EDIT PROFILE', style: TextStyle(color: Colors.black)),
            ),
            SizedBox(height: 32),

            // Profile information cards for username, phone, and email
            ProfileInfoCard(
              icon: Icons.person,
              label: 'First Name',
              controller: _firstnameController,
            ),
            ProfileInfoCard(
              icon: Icons.phone,
              label: 'Last Name',
              controller: _lastnameController,
            ),
            ProfileInfoCard(
              icon: Icons.email,
              label: 'Email',
              controller: _emailController,
            ),

            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Add logout functionality when backend development begins
              },
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.grey[400]),
              child: Text('LOGOUT', style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom reusable widget for displaying profile information
class ProfileInfoCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final TextEditingController controller;

  // Initialize fields
  ProfileInfoCard({
    required this.icon,
    required this.label,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF2D2B50),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.white),
        title: TextField(
          controller: controller,
          readOnly: true, // Read-only as this is for display purposes only
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            labelText: label, // Label for the text field
            labelStyle: TextStyle(color: Colors.white70),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
