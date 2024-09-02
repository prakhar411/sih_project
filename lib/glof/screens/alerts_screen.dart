import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sih/core/themes/app_pallete.dart';
import '../providers/data_providers.dart';
import '../models/alert.dart';

final alertsProvider = FutureProvider<List<Alert>>((ref) async {
  final data = ref.read(dataProvider);
  return await data.fetchAlerts();
});

class AlertsScreen extends ConsumerWidget {
  const AlertsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final alertsAsyncValue = ref.watch(alertsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Alerts'),
        backgroundColor: Pallete.gradient1, // Deep Orange
      ),
      body: alertsAsyncValue.when(
        data: (alerts) {
          if (alerts.isEmpty) {
            return const Center(
              child: Text(
                'No alerts available',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            );
          }
          return ListView.builder(
            itemCount: alerts.length,
            itemBuilder: (context, index) {
              final alert = alerts[index];
              return Card(
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                elevation: 5,
                color: Theme.of(context).colorScheme.secondary, // Light Orange
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: Text(
                    alert.type,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context)
                          .colorScheme
                          .onSecondary, // Deep Orange
                    ),
                  ),
                  subtitle: Text(
                    alert.message,
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface, // Dark Grey or Black
                    ),
                  ),
                  trailing: Text(
                    alert.timestamp.toString(),
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white, // Dark Grey or Black
                    ),
                  ),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Text('Error: $error',
              style: const TextStyle(color: Colors.white, fontSize: 20)),
        ),
      ),
    );
  }
}
