import 'package:flutter/material.dart';
import 'package:sih/core/themes/app_pallete.dart';

class Aboutpage extends StatelessWidget {
  const Aboutpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(
              'About Us',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Pallete.gradient1,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Aapdarthi is dedicated to helping communities in need by providing essential information and support during emergencies. Our app offers real-time disaster updates, offline location fetching, and more to keep users informed and safe.',
              style: TextStyle(
                fontSize: 16,
                color: Pallete.greyColor,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Pallete.gradient1,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Email: support@example.com\nPhone: +123 456 7890',
              style: TextStyle(
                fontSize: 16,
                color: Pallete.greyColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
