import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sih/auth/dialogue/dialogue.dart';
import 'package:sih/auth/loginpage/login.dart';
import 'package:sih/auth/widgets/gradient_button.dart';
import 'package:sih/instant_help_screen/help.dart';

class Frontpage extends StatefulWidget {
  const Frontpage({super.key});

  @override
  State<Frontpage> createState() => _FrontpageState();
}

class _FrontpageState extends State<Frontpage> {
  Position? _currentPosition;

  Future<void> _fetchAndStoreLocation() async {
    try {
      // Check for location permissions
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Location services are disabled.')),
        );
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission != LocationPermission.whileInUse &&
            permission != LocationPermission.always) {
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')),
          );
          return;
        }
      }

      // Fetch the current location
      Position position = await Geolocator.getCurrentPosition(
          // ignore: deprecated_member_use
          desiredAccuracy: LocationAccuracy.high);

      // Debugging: Print the location data
      print(
          "Location fetched: Latitude: ${position.latitude}, Longitude: ${position.longitude}");

      setState(() {
        _currentPosition = position;
      });

      _showLocationDialog(); // Show the dialog with the location information
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching location: $e')),
      );
      print('Error fetching location: $e');
    }
  }

  void _showLocationDialog() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DialogueBox(
          position: _currentPosition,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Add your app's logo here with a circular avatar
              Container(
                width: 150, // Adjust width as needed
                height: 150, // Adjust height as needed
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .scaffoldBackgroundColor, // Background color
                  shape: BoxShape.circle, // Circular shape
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/logo_bg.jpg', // Path to your logo
                    fit: BoxFit.cover, // Fit the image inside the circle
                  ),
                ),
              ),
              const SizedBox(height: 20), // Space between logo and button
              AuthGradientButton(
                buttonText: "Log In / Sign Up",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  _fetchAndStoreLocation(); // Fetch location when clicked
                },
                child: const BorderedIconTextWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
