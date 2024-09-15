import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class EarthquakeScreen extends StatefulWidget {
  const EarthquakeScreen({super.key});

  @override
  _EarthquakeScreenState createState() => _EarthquakeScreenState();
}

class _EarthquakeScreenState extends State<EarthquakeScreen> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;
  bool _isFullScreen = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    _controller = VideoPlayerController.network(
      'https://drive.google.com/uc?export=stream&id=1R0L1lrN_6YSueVzNUWrjHrrydgVe_Ort',
    )..initialize().then((_) {
        setState(() {}); // Update UI once the video is initialized
      });
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the video controller
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]); // Reset orientation settings
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Earthquake Preparedness'),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Video Player
              _controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: Stack(
                        children: [
                          VideoPlayer(_controller),
                          Positioned(
                            bottom: 0,
                            child: _buildVideoControls(),
                          ),
                        ],
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
              const SizedBox(height: 30),

              // Do's Section
              _buildSectionHeader("Do's", Colors.green),
              _buildInfoCard(
                """1. Drop, Cover, and Hold On under sturdy furniture.
        2. Stay indoors until the shaking stops.
        3. Move away from windows and anything that could fall.
        4. If outside, move to open space away from buildings and trees.
        5. If in a vehicle, stop safely away from bridges and overpasses.
        6. Be prepared for aftershocks and follow official instructions.
        7. Help others if it’s safe and assist the injured.""",
                Colors.green[100],
              ),
              const SizedBox(height: 20),

              // Don'ts Section
              _buildSectionHeader("Don'ts", Colors.red),
              _buildInfoCard(
                """1. Don’t run outside during the shaking.
        2. Don’t use elevators—use stairs instead.
        3. Don’t stand in doorways—they aren’t safer than other spots.
        4. Don’t use open flames due to the risk of gas leaks.
        5. Don’t stay near heavy objects or glass that could fall or break.
        6. Don’t panic—stay calm and focus on protecting yourself.""",
                Colors.red[100],
              ),
              const SizedBox(height: 20),

              // Precautions Section
              _buildSectionHeader("Precautions", Colors.blue),
              _buildInfoCard(
                """1. Drop, cover, and hold under sturdy furniture or against an interior wall.
        2. Stay indoors and avoid windows, outer walls, and tall furniture.
        3. If outdoors, move to an open area away from buildings, trees, and power lines.
        4. After the earthquake, check for injuries and hazards.
        5. Be prepared for aftershocks and follow emergency instructions.""",
                Colors.blue[100],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(_isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen),
      //   onPressed: () {
      //     setState(() {
      //       _isFullScreen = !_isFullScreen;
      //       if (_isFullScreen) {
      //         SystemChrome.setPreferredOrientations([
      //           DeviceOrientation.portraitUp,
      //         ]);
      //         Navigator.of(context).push(
      //           MaterialPageRoute(
      //             builder: (context) => Scaffold(
      //               body: Center(
      //                 child: AspectRatio(
      //                   aspectRatio: _controller.value.aspectRatio,
      //                   child: Stack(
      //                     children: [
      //                       VideoPlayer(_controller),
      //                       Positioned(
      //                         bottom: 0,
      //                         child: _buildVideoControls(),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           ),
      //         );
      //       } else {
      //         SystemChrome.setPreferredOrientations([
      //           DeviceOrientation.portraitUp,
      //         ]);
      //         Navigator.of(context).pop();
      //       }
      //     });
      //   },
      // ),
    );
  }

  Widget _buildVideoControls() {
    return Container(
      color: Colors.black.withOpacity(0.5),
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildPlayPauseButton(),
          _buildFullScreenButton(),
        ],
      ),
    );
  }

  Widget _buildPlayPauseButton() {
    return IconButton(
      icon: Icon(
        _isPlaying ? Icons.pause : Icons.play_arrow,
        size: 32,
        color: Colors.white,
      ),
      onPressed: () {
        setState(() {
          if (_isPlaying) {
            _controller.pause();
          } else {
            _controller.play();
          }
          _isPlaying = !_isPlaying;
        });
      },
    );
  }

  Widget _buildFullScreenButton() {
    return IconButton(
      icon: Icon(
        _isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen,
        size: 32,
        color: Colors.white,
      ),
      onPressed: () {
        setState(() {
          _isFullScreen = !_isFullScreen;
          if (_isFullScreen) {
            SystemChrome.setPreferredOrientations([
              DeviceOrientation.portraitUp,
            ]);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Scaffold(
                  body: Center(
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: Stack(
                        children: [
                          VideoPlayer(_controller),
                          Positioned(
                            bottom: 0,
                            child: _buildVideoControls(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          } else {
            SystemChrome.setPreferredOrientations([
              DeviceOrientation.portraitUp,
            ]);
            Navigator.of(context).pop();
          }
        });
      },
    );
  }

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
