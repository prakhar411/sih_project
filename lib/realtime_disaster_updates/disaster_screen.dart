import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
// import 'package:sih/core/themes/app_pallete.dart';
import 'package:sih/realtime_disaster_updates/models/disaster_info.dart';
import 'package:sih/realtime_disaster_updates/services/api_service.dart';

class DisasterListScreen extends StatefulWidget {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  const DisasterListScreen(
      {super.key, required this.flutterLocalNotificationsPlugin});

  @override
  _DisasterListScreenState createState() => _DisasterListScreenState();
}

class _DisasterListScreenState extends State<DisasterListScreen> {
  late Future<List<DisasterInfo>> _disasterInfo;

  @override
  void initState() {
    super.initState();
    _disasterInfo = ApiService().fetchDisasterInfo();
    _showNotifications();
  }

  Future<void> _showNotifications() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails('your_channel_id', 'your_channel_name',
            importance: Importance.max, priority: Priority.high);
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await widget.flutterLocalNotificationsPlugin.show(
        0, 'Alert', 'This is a test notification', platformChannelSpecifics);
  }

  Future<void> _refreshDisasterInfo() async {
    setState(() {
      _disasterInfo = ApiService().fetchDisasterInfo();
    });
  }

  String _formatDate(DateTime dateTime) {
    try {
      final DateFormat formatter =
          DateFormat('yyyy-MM-dd – hh:mm a'); // AM/PM format
      return formatter.format(dateTime);
    } catch (e) {
      return dateTime.toString();
    }
  }

  Icon _getDisasterIcon(String category) {
    switch (category.toLowerCase()) {
      case 'flood':
        return const Icon(Icons.water, color: Colors.blue, size: 40.0);
      case 'earthquake':
        return const Icon(Icons.warning, color: Colors.brown, size: 40.0);
      case 'fire':
        return const Icon(Icons.fireplace, color: Colors.yellow, size: 40.0);
      case 'storm':
        return const Icon(Icons.storm, color: Colors.grey, size: 40.0);
      case 'explosion':
        return const Icon(
          Icons.local_fire_department,
          color: Colors.deepOrange,
        );
      default:
        return const Icon(Icons.error, color: Colors.white, size: 40.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Disaster Information',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: RefreshIndicator(
        onRefresh: _refreshDisasterInfo,
        child: FutureBuilder<List<DisasterInfo>>(
          future: _disasterInfo,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                  child: Text(
                'Error: ${snapshot.error}',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                  child: Text('No disaster information available.',
                      style: TextStyle(color: Colors.white)));
            } else {
              final disasterList = snapshot.data!;
              return ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: disasterList.length,
                itemBuilder: (context, index) {
                  final disaster = disasterList[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          // Color(0xFFF0C27B),
                          //  Color(0xFF4B1248),
                          Color(0xFF000000),
                          // Pallete.gradient1,
                          Color.fromARGB(255, 255, 161, 9),
                          // Pallete.gradient3,

                          // Color(0XFF0f9b0f)
                          // Color.fromARGB(255, 7, 255, 15),
                        ],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _getDisasterIcon(disaster.category),
                              const SizedBox(width: 16.0),
                              Expanded(
                                child: Text(
                                  disaster.title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                    color: Colors.white,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            '${disaster.category} - ${disaster.description}',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey[300],
                            ),
                          ),
                          const SizedBox(
                              height:
                                  8.0), // Add spacing between content and date
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              _formatDate(disaster.timestamp),
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: Colors.white54,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
