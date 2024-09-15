import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sih/chatbot/myhomepage.dart';
import 'package:sih/core/themes/app_pallete.dart';
import 'package:sih/realtime_disaster_updates/disaster_screen.dart';
import 'package:sih/views/about/about.dart';
import 'package:sih/views/alertspage/alert.dart';
import 'package:sih/views/doingpage/do.dart';
import 'package:sih/views/donate/fund.dart';
import 'package:sih/views/homepage/homecontentpage.dart';
import 'package:sih/views/profilepage/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeContentPage(),
    const DoandDont(),
    const AlertsPage(),
    const Profile(),
    const Aboutpage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.all(3.0),
          child: ClipOval(
            child: Image.asset(
              'assets/logo_bg.jpg', // Path to your logo
              fit: BoxFit.cover, // Fit the image inside the circle
            ),
          ),
        ),
        title: Row(
          children: [
            const SizedBox(width: 0),
            Expanded(
              child: Text(
                'Aapdarthi',
                style: TextStyle(
                  color: Colors.orange[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
            const SizedBox(width: 20),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const FaIcon(
                    FontAwesomeIcons.facebookMessenger,
                    color: Pallete.gradient1,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyHomePage(),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: const FaIcon(
                    FontAwesomeIcons.houseSignal,
                    color: Pallete.gradient2,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DisasterListScreen(
                          flutterLocalNotificationsPlugin:
                              FlutterLocalNotificationsPlugin(),
                        ),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.solidMoneyBill1),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.black,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.orange[800],
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.history), label: 'Do\'S & Don\'t'),
          BottomNavigationBarItem(icon: Icon(Icons.water_drop), label: 'GLOF'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About'),
        ],
      ),
    );
  }
}
