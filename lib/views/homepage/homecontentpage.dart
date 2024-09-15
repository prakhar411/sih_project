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

  // List of disaster names
  final List<String> disasterNames = [
    'Flood',
    'Earthquake',
    'Tsunami',
    'Cyclone',
    'Wildfire',
    'Landslide',
    'Drought',
    'Volcanic Eruption',
    'Avalanche',
    'Tornado',
  ];

  void _handleOptionChange(int index) {
    setState(() {
      _selectedOption = index;
    });
  }

  void _showSubmissionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(20.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'SUBMITTED',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange[800],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text(
                'Your report has been submitted. The concerned authorities will be informed. Rescue teams will reach you shortly. Please be patient and stay calm!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          actions: [
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text(
                  'OK',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.orange,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
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
                itemCount: disasterNames.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
                    leading: Radio<int>(
                      value: index,
                      groupValue: _selectedOption,
                      onChanged: (val) => _handleOptionChange(index),
                      activeColor: Colors.orange[800],
                    ),
                    title: Text(disasterNames[index]), // Display disaster name
                    onTap: () => _handleOptionChange(index),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // Submit Button
            Center(
              child: AuthGradientButton(
                buttonText: 'Submit',
                onTap: () {
                  _showSubmissionDialog(context);
                },
              ),
            ),

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
              decoration: const InputDecoration(
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
