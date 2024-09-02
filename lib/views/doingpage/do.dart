import 'package:flutter/material.dart';
import 'package:sih/views/doingpage/screens/blizzard/blizzard_screen.dart';
import 'package:sih/views/doingpage/screens/chemical_spill/chemical_spill_screen.dart';
import 'package:sih/views/doingpage/screens/cyber_attack/cyber_attack_screen.dart';
import 'package:sih/views/doingpage/screens/drought/drought_screen.dart';
import 'package:sih/views/doingpage/screens/extreme_heat/heat_screen.dart';
import 'package:sih/views/doingpage/screens/floods/flood_screen.dart';
import 'package:sih/views/doingpage/screens/hurricane/hurricane_Screen.dart';
import 'package:sih/views/doingpage/screens/nuclear_accident/nuclear_screen.dart';
import 'package:sih/views/doingpage/screens/pandemic/pandemic_screen.dart';
import 'package:sih/views/doingpage/screens/power_outage/outage.dart';
import 'package:sih/views/doingpage/screens/tornado/tornado_screen.dart';
import 'package:sih/views/doingpage/screens/transportation_accident/transportation_accident_screen.dart';
import 'package:sih/views/doingpage/screens/volcanic_eruption/eruption_screen.dart';
import 'screens/earthquake/earthquake_screen.dart';
import 'screens/tsunami/tsunami_screen.dart';
import 'screens/fire/fire_screen.dart';
import 'screens/explosion/explosion_screen.dart';
import 'screens/landslide/landslide_screen.dart';

class DoandDont extends StatelessWidget {
  const DoandDont({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            _buildGridItem(context, 'Earthquake', Icons.public, Colors.orange,
                EarthquakeScreen()),
            _buildGridItem(
                context, 'Tsunami', Icons.water, Colors.blue, TsunamiScreen()),
            _buildGridItem(
                context, 'Floods', Icons.cloud, Colors.teal, FloodsScreen()),
            _buildGridItem(context, 'Fire', Icons.fire_extinguisher, Colors.red,
                FireScreen()),
            _buildGridItem(
                context,
                'Transportation Accident',
                Icons.directions_car,
                Colors.green,
                TransportationAccidentScreen()),
            _buildGridItem(context, 'Explosion', Icons.bolt, Colors.yellow,
                ExplosionScreen()),
            _buildGridItem(context, 'Landslide', Icons.terrain, Colors.brown,
                LandslideScreen()),
            _buildGridItem(context, 'Hurricane', Icons.storm, Colors.deepPurple,
                HurricaneScreen()),
            _buildGridItem(context, 'Volcanic Eruption', Icons.landscape,
                Colors.deepOrange, EruptionScreen()),
            _buildGridItem(context, 'Chemical Spill', Icons.science,
                Colors.cyan, ChemicalSpillScreen()),
            _buildGridItem(context, 'Nuclear Accident', Icons.warning,
                Colors.pink, NuclearScreen()),
            _buildGridItem(context, 'Tornado', Icons.cloud, Colors.indigo,
                TornadoScreen()),
            _buildGridItem(context, 'Power Outage', Icons.power_off,
                Colors.grey, PowerOutageScreen()),
            _buildGridItem(context, 'Pandemic', Icons.health_and_safety,
                Colors.purple, PandemicScreen()),
            _buildGridItem(context, 'Drought', Icons.wb_sunny, Colors.amber,
                DroughtScreen()),
            _buildGridItem(context, 'Extreme Heat', Icons.thermostat,
                Colors.redAccent, HeatScreen()),
            _buildGridItem(context, 'Blizzard', Icons.ac_unit, Colors.lightBlue,
                BlizzardScreen()),
            _buildGridItem(context, 'Cyber Attack', Icons.computer,
                Colors.blueGrey, CyberAttackScreen()),
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(BuildContext context, String title, IconData icon,
      Color color, Widget destination) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      },
      child: Card(
        color: color.withOpacity(0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
              color: color,
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
