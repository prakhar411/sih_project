import 'package:flutter/material.dart';

class FloodsScreen extends StatelessWidget {
  const FloodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flood Preparedness'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Video Placeholder
              Container(
                height: 200,
                color: Colors.grey[300],
                child: const Center(
                  child: Text(
                    'Video Placeholder',
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Do's Section
              _buildSectionHeader("Do's", Colors.green),
              _buildInfoCard(
                """1. Stay informed through alerts and follow evacuation orders.
2. Move to higher ground or the highest safe location in your home.
3. Turn off utilities like gas and electricity if instructed.
4. Prepare an emergency kit with essentials in case of evacuation.
5. Help others evacuate, especially the elderly and children.
6. Avoid floodwaters, as they may hide dangers.
7. Follow official updates for further instructions.""",
                Colors.green[100],
              ),
              const SizedBox(height: 20),

              // Don'ts Section
              _buildSectionHeader("Don'ts", Colors.red),
              _buildInfoCard(
                """1. Don’t walk or drive through floodwaters—they can sweep you away.
2. Don’t touch electrical equipment if standing in water.
3. Don’t ignore evacuation orders—leave immediately when told.
4. Don’t return home too soon—wait for official clearance.
5. Don’t drink contaminated water—only use bottled or boiled water.
6. Don’t park in flood-prone areas or leave loose items outside.""",
                Colors.red[100],
              ),
              const SizedBox(height: 20),

              // Precautions Section
              _buildSectionHeader("Precautions", Colors.blue),
              _buildInfoCard(
                """1. Know flood evacuation routes in your area.
2. Store important documents in waterproof containers.
3. Elevate utilities like electrical appliances and wiring to higher ground.
4. Install check valves in plumbing to prevent floodwaters from backing up into your home.
5. Keep emergency contact information handy and ensure all family members are familiar with it.
6. Have a communication plan with family members in case you get separated.
7. Listen to local authorities for information on safe drinking water after a flood.""",
                Colors.blue[100],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // Section Header Widget
  Widget _buildSectionHeader(String title, Color color) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }

  // Info Card Widget
  Widget _buildInfoCard(String content, Color? bgColor) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 8,
            spreadRadius: 2,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: Text(
        content,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black87,
          height: 1.5,
        ),
      ),
    );
  }
}
