import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sih/glof/realtime_data.dart';
import 'package:sih/glof/screens/alerts_screen.dart';
import '../providers/data_providers.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Use the sensorDataProvider to get the state
    final dataAsyncValue = ref.watch(sensorDataProvider);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Glacial Lake Monitoring'),
        backgroundColor: Colors.black, // Deep Orange
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AlertsScreen()));
            },
          ),
          IconButton(
            icon: const Icon(
                Icons.bar_chart), // Use a suitable icon for Real-Time Data
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RealTimeDataScreen()));
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        color: Colors.orange[800], // Set the color of the refresh indicator
        onRefresh: () async {
          // Refetch the data
          // ignore: unused_result
          ref.refresh(sensorDataProvider);
        },
        child: dataAsyncValue.when(
          data: (data) => Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildDataCard(
                      context, 'Elevation', '${data.elevation} meters'),
                  _buildDataCard(context, 'Slope', '${data.slope} degrees'),
                  _buildDataCard(context, 'Aspect', '${data.aspect} degrees'),
                  // Add more cards or widgets here if needed
                ],
              ),
            ),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(
            child: Text('Error: $error',
                style: const TextStyle(color: Colors.white, fontSize: 18)),
          ),
        ),
      ),
    );
  }

  Widget _buildDataCard(BuildContext context, String title, String value) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 5,
      color: Theme.of(context).colorScheme.secondary, // Light Orange
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSecondary, // Deep Orange
          ),
        ),
        subtitle: Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}
