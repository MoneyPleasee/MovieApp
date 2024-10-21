import 'package:flutter/material.dart';
import 'package:movieapp/model/model.dart';
import 'package:movieapp/controller/app_controller.dart';

class EditProfilePage extends StatefulWidget {
  final UserInfo userInfo;

  EditProfilePage({required this.userInfo});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController _firstnameController;
  late TextEditingController _lastnameController;
  late TextEditingController _emailController;
  final UserController _userController = UserController();

  @override
  void initState() {
    super.initState();
    _firstnameController = TextEditingController(text: widget.userInfo.fname);
    _lastnameController = TextEditingController(text: widget.userInfo.lname);
    _emailController = TextEditingController(text: widget.userInfo.email);
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
        title: Text('Edit Profile'),
        backgroundColor: Color(0xFF1C1B33),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _firstnameController,
              decoration: InputDecoration(labelText: 'First Name'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _lastnameController,
              decoration: InputDecoration(labelText: 'Last Name'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () async {
                // Update user info
                UserInfo updatedInfo = UserInfo(
                  username: widget.userInfo.username,
                  fname: _firstnameController.text,
                  lname: _lastnameController.text,
                  email: _emailController.text,
                );
                bool success =
                    await _userController.updateUserInfo(updatedInfo);
                if (success) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Profile updated successfully')),
                  );
                  Navigator.pop(context, updatedInfo);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to update profile')),
                  );
                }
              },
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
