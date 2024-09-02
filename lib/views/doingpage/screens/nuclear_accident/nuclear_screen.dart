import 'package:flutter/material.dart';

class NuclearScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nuclear Accident'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              color: Colors.grey[300],
              child: Center(
                child: Text(
                  'Video Placeholder',
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Do's",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Container(
              height: 100,
              color: Colors.green[100],
              child: Center(
                child: Text(
                  "Add Do's here...",
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Don'ts",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Container(
              height: 100,
              color: Colors.red[100],
              child: Center(
                child: Text(
                  "Add Don'ts here...",
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Precautions",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Container(
              height: 100,
              color: Colors.blue[100],
              child: Center(
                child: Text(
                  "Add precautions here...",
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
