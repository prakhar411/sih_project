import 'package:flutter/material.dart';
import 'package:sih/auth/widgets/gradient_button.dart';

class HomeContentPage extends StatefulWidget {
  const HomeContentPage({super.key});

  @override
  _HomeContentPageState createState() => _HomeContentPageState();
}

class _HomeContentPageState extends State<HomeContentPage> {
  int _selectedOption = -1; // To keep track of the selected option
  final TextEditingController _reportController = TextEditingController();

  void _handleOptionChange(int index) {
    setState(() {
      _selectedOption = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Section
            Text(
              'HELP:',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.orange[800],
              ),
            ),
            const SizedBox(height: 10),

            // Options Section
            SizedBox(
              height: 300, // Fixed height for the scrollable area
              child: ListView.builder(
                itemCount: 10, // Updated to 10 options
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
                    leading: Radio<int>(
                      value: index,
                      groupValue: _selectedOption,
                      onChanged: (val) => _handleOptionChange(index),
                      activeColor: Colors.orange[800],
                    ),
                    title: Text('Option ${index + 1}'),
                    onTap: () => _handleOptionChange(index),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // Submit Button
            Center(
                child: AuthGradientButton(buttonText: 'Submit', onTap: () {})),

            const SizedBox(height: 20),

            // Report Section
            Text(
              'REPORT:',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.orange[800],
              ),
            ),
            const SizedBox(height: 10),

            // Report TextField
            TextField(
              controller: _reportController,
              maxLines: 5,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Type...',
                hintStyle: TextStyle(color: Colors.grey),
                contentPadding:
                    EdgeInsets.all(10.0), // Padding inside the text field
              ),
            ),

            const SizedBox(height: 10),

            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.mic, color: Colors.orange[800]),
                  onPressed: () {
                    // Placeholder for the action (originally for speech-to-text)
                  },
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.orange[800]),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
