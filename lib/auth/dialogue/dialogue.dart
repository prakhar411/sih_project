import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class DialogueBox extends StatelessWidget {
  final Position? position;

  const DialogueBox({super.key, this.position});

  @override
  Widget build(BuildContext context) {
    final String locationUrl = position != null
        ? 'https://www.google.com/maps?q=${position!.latitude},${position!.longitude}'
        : 'Location not available';

    return AlertDialog(
      title: const Text(
        'Instant Help!',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Location: $locationUrl',
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.maxFinite,
              height: 400,
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: _buildAllGridItems(context),
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Close'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  List<Widget> _buildAllGridItems(BuildContext context) {
    return [
      _buildGridItem(context, 'SOS', Icons.warning_amber_outlined,
          const Color.fromARGB(255, 255, 17, 0)),
      _buildGridItem(context, 'Earthquake', Icons.public, Colors.orange),
      _buildGridItem(context, 'Tsunami', Icons.water, Colors.blue),
      _buildGridItem(context, 'Floods', Icons.cloud, Colors.teal),
      _buildGridItem(context, 'Fire', Icons.fire_extinguisher, Colors.red),
      _buildGridItem(context, 'Transportation Accident', Icons.directions_car,
          Colors.green),
      _buildGridItem(context, 'Explosion', Icons.bolt, Colors.yellow),
      _buildGridItem(context, 'Landslide', Icons.terrain, Colors.brown),
      _buildGridItem(context, 'Hurricane', Icons.storm, Colors.deepPurple),
      _buildGridItem(
          context, 'Volcanic Eruption', Icons.landscape, Colors.deepOrange),
      _buildGridItem(context, 'Chemical Spill', Icons.science, Colors.cyan),
      _buildGridItem(context, 'Nuclear Accident', Icons.warning, Colors.pink),
      _buildGridItem(context, 'Tornado', Icons.cloud, Colors.indigo),
      _buildGridItem(context, 'Power Outage', Icons.power_off, Colors.grey),
      _buildGridItem(
          context, 'Pandemic', Icons.health_and_safety, Colors.purple),
      _buildGridItem(context, 'Drought', Icons.wb_sunny, Colors.amber),
      _buildGridItem(
          context, 'Extreme Heat', Icons.thermostat, Colors.redAccent),
      _buildGridItem(context, 'Blizzard', Icons.ac_unit, Colors.lightBlue),
      _buildGridItem(context, 'Cyber Attack', Icons.computer, Colors.blueGrey),
    ];
  }

  Widget _buildGridItem(
      BuildContext context, String title, IconData icon, Color color) {
    return GestureDetector(
      onTap: () {
        if (position != null) {
          _sendSmsWithLocation(context, title);
        } else {
          _showSnackBar(context, 'Location not available');
        }
      },
      child: Card(
        color: color.withOpacity(0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _sendSmsWithLocation(
      BuildContext context, String disasterType) async {
    String phoneNumber;
    String message;

    // Define specific phone number and message for "SOS"
    if (disasterType == 'SOS') {
      phoneNumber =
          '9129979433'; // Replace with the actual phone number for SOS
      message = position != null
          ? 'SOS! I am in Danger : ${Uri.encodeFull('https://www.google.com/maps?q=${position!.latitude},${position!.longitude}').replaceAll('%3A', ':').replaceAll('%2F', '/')}. Please send immediate assistance as soon as possible'
          : 'SOS! Location not available. Please send immediate assistance.';
    } else {
      phoneNumber = '6307876246'; // Default phone number for other disasters
      message = position != null
          ? 'I am stranded here: ${Uri.encodeFull('https://www.google.com/maps?q=${position!.latitude},${position!.longitude}').replaceAll('%3A', ':').replaceAll('%2F', '/')}. Please send help as soon as possible. Incident Type: $disasterType'
          : 'Location not available. Please send help as soon as possible. Incident Type: $disasterType';
    }

    final Uri smsUri = Uri(
      scheme: 'sms',
      path: phoneNumber,
      queryParameters: {'body': message},
    );

    try {
      if (await canLaunchUrl(smsUri)) {
        await launchUrl(smsUri);
      } else {
        _showSnackBar(context, 'Cannot send SMS');
      }
    } catch (e) {
      _showSnackBar(context, 'Error: $e');
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
