import 'package:flutter/material.dart';
import 'package:sih/core/themes/app_pallete.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Center(
                child: CircleAvatar(
              backgroundColor: Colors.amber[600],
              radius: 50,
              child: Icon(
                Icons.person,
                size: 80,
              ),
            )),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'Aapdarthi', // Replace with user's name
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                'aapdarthihelpdesk@gmail.com', // Replace with user's email
                style: TextStyle(
                  fontSize: 16,
                  color: Pallete.greyColor,
                ),
              ),
            ),
            const SizedBox(height: 40),
            ProfileOption(
              icon: Icons.person,
              text: 'Account Information',
              onTap: () {
                // Navigate to account information page
              },
            ),
            ProfileOption(
              icon: Icons.settings,
              text: 'Settings',
              onTap: () {
                // Navigate to settings page
              },
            ),
            ProfileOption(
              icon: Icons.help,
              text: 'Help & Support',
              onTap: () {
                // Navigate to help & support page
              },
            ),
            ProfileOption(
              icon: Icons.logout,
              text: 'Logout',
              onTap: () {
                // Handle logout
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileOption extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const ProfileOption({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Pallete.gradient1),
      title: Text(text),
      onTap: onTap,
    );
  }
}
