import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frontiers_market_interview/presentation/screens/login_page.dart';
import 'package:image_picker/image_picker.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController nameController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    User? user = _auth.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'User Profile',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Roboto', // Change this to your preferred sleek font
            fontWeight: FontWeight.bold, // Lighter font weight for a sleek look
            fontSize: 24, // Adjust the size as needed
          ),
        ),
        backgroundColor: Colors.black, // Set AppBar color to black
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ...[
              Text('Email: ${user?.email}'),
            ],
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.black.withOpacity(0.7)),
                padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0)),
                textStyle: MaterialStateProperty.all(
                    const TextStyle(fontFamily: 'Roboto')),
              ),
              onPressed: () async {
                await _auth.signOut();
                // Navigate to another page after signing out
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: const Text('Logout',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
