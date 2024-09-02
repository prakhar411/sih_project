import 'package:flutter/material.dart';
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
  // LocationData? _locationData;

  // Future<void> _fetchAndStoreLocation() async {
  //   final Location location = Location();

  //   bool _serviceEnabled;
  //   PermissionStatus _permissionGranted;

  //   _serviceEnabled = await location.serviceEnabled();
  //   if (!_serviceEnabled) {
  //     _serviceEnabled = await location.requestService();
  //     if (!_serviceEnabled) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(content: Text('Location services are disabled.')),
  //       );
  //       return;
  //     }
  //   }

  //   _permissionGranted = await location.hasPermission();
  //   if (_permissionGranted == PermissionStatus.denied) {
  //     _permissionGranted = await location.requestPermission();
  //     if (_permissionGranted != PermissionStatus.granted) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(content: Text('Location permissions are denied')),
  //       );
  //       return;
  //     }
  //   }

  //   LocationData locationData = await location.getLocation();

  //   setState(() {
  //     _locationData = locationData;
  //   });

  //   _showLocationDialog();
  // }

  // void _showLocationDialog() {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => DialogueBox(
  //         locationData: _locationData,
  //       ),
  //     ),
  //   );
  // }

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
              AuthGradientButton(
                  buttonText: "Log In / Sign Up",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  }),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DialogueBox()),
                  );
                },
                child: BorderedIconTextWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
