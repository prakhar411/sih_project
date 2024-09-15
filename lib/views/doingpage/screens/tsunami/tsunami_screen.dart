import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class TsunamiScreen extends StatefulWidget {
  const TsunamiScreen({super.key});

  @override
  _TsunamiScreenState createState() => _TsunamiScreenState();
}

class _TsunamiScreenState extends State<TsunamiScreen> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    // Initialize the video player with the correct asset path
    _controller = VideoPlayerController.asset('assets/tsunami.mp4')
      ..initialize().then((_) {
        setState(() {}); // Update UI once the video is initialized
      });
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the video controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tsunami Preparedness'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Video Player
              _controller.value.isInitialized
                  ? Column(
                      children: [
                        AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(
                                _isPlaying ? Icons.pause : Icons.play_arrow,
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
                            ),
                            IconButton(
                              icon: const Icon(Icons.stop),
                              onPressed: () {
                                setState(() {
                                  _controller.pause();
                                  _controller.seekTo(Duration.zero);
                                  _isPlaying = false;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
              const SizedBox(height: 30),

              // Do's Section
              _buildSectionHeader("Do's", Colors.green),
              _buildInfoCard(
                """1. Move to higher ground immediately if you hear a warning.
2. Follow evacuation orders from authorities.
3. Stay away from the coast until the all clear is given.
4. Be aware of multiple waves; they may come over hours.
5. Carry an emergency kit with food, water, and first aid.
6. Help others evacuate if possible.
7. Pay attention to natural warnings like earthquakes.""",
                Colors.green[100],
              ),
              const SizedBox(height: 20),

              // Don'ts Section
              _buildSectionHeader("Don'ts", Colors.red),
              _buildInfoCard(
                """1. Don’t stay near the shore to watch the tsunami.
2. Don’t return to the coast until it's officially safe.
3. Don’t use low-lying roads during evacuation.
4. Don’t assume the first wave is the last.
5. Don’t ignore earthquake signs if you're near the coast.""",
                Colors.red[100],
              ),
              const SizedBox(height: 20),

              // Precautions Section
              _buildSectionHeader("Precautions", Colors.blue),
              _buildInfoCard(
                """1. Know the evacuation routes in your area.
2. Prepare a disaster kit with essentials.
3. Teach your family about warning signs and evacuation plans.
4. Stay informed through alerts and weather updates.
5. Secure your home by reinforcing foundations if in high-risk areas.""",
                Colors.blue[100],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // Widget to build section headers
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

  // Widget to build the information card
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
