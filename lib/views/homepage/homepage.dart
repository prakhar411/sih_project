import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sih/chatbot/myhomepage.dart';
import 'package:sih/core/themes/app_pallete.dart';
import 'package:sih/realtime_disaster_updates/disaster_screen.dart';
import 'package:sih/views/about/about.dart';
import 'package:sih/views/alertspage/alert.dart';
import 'package:sih/views/doingpage/do.dart';
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
    const HomeContentPage(), // Use the appropriate page here
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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey[300],
                radius: 18,
                child: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              const Text(
                'Name',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
              const SizedBox(
                width: 130,
              ),
              Row(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: const FaIcon(
                          FontAwesomeIcons.facebookMessenger,
                          color: Pallete.gradient1,
                        ),
                        onPressed: () {
                          // add here
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MyHomePage()));
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
                    ],
                  ),

                  // const SizedBox(
                  //   width: 5,
                  // ),
                  // CircleAvatar(
                  //   backgroundColor: Colors.grey[300],
                  //   radius: 15,
                  //   child: const Icon(
                  //     Icons.person,
                  //     color: Colors.grey,
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
          backgroundColor: //Colors.orange[800],
              Colors.black),
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
