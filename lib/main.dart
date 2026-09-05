import 'package:flutter/material.dart';
import 'profile_screen.dart';

void main() {
  runApp(const TikTokApp());
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TikTok Clone',
      theme: ThemeData.dark(),
      home: const TikTokHomeScreen(),
    );
  }
}

class TikTokHomeScreen extends StatefulWidget {
  const TikTokHomeScreen({super.key});

  @override
  State<TikTokHomeScreen> createState() => _TikTokHomeScreenState();
}

class _TikTokHomeScreenState extends State<TikTokHomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // যদি নিচের নেভিগেশন বারে 'Profile' (ইন্ডেক্স 4) সিলেক্ট থাকে, 
      // তবে প্রোফাইল পেজ দেখাবে; অন্যথায় ভিডিও হোম ফিড দেখাবে।
      body: _selectedIndex == 4
          ? const ProfileScreen()
          : PageView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 5,
              itemBuilder: (context, index) {
                return VideoTile(videoIndex: index);
              },
            ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Discover'),
          BottomNavigationBarItem(icon: Icon(Icons.add_box, size: 30), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Inbox'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class VideoTile extends StatefulWidget {
  final int videoIndex;
  const VideoTile({super.key, required this.videoIndex});

  @override
  State<VideoTile> createState() => _VideoTileState();
}

class _VideoTileState extends State<VideoTile> {
  bool _isLiked = false;
  int _likeCount = 1200;
  bool _isPlaying = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // ভিডিও সিমুলেটর ব্যাকগ্রাউন্ড
        GestureDetector(
          onTap: () {
            setState(() {
              _isPlaying = !_isPlaying;
            });
          },
          child: Container(
            color: Colors.grey[900],
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    _isPlaying ? Icons.play_circle_fill : Icons.pause_circle_filled,
                    size: 60,
                    color: Colors.white54,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _isPlaying ? 'Video #${widget.videoIndex + 1} Playing' : 'Paused',
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ),

        // ভিডিওর বাম পাশের ইউজার ইনফো ও টেক্সট
        Positioned(
          left: 15,
          bottom: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '@user_${widget.videoIndex + 1}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'TikTok Clone UI with Flutter in Acode 🚀',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              const SizedBox(height: 10),
              const Row(
                children: [
                  Icon(Icons.music_note, size: 15, color: Colors.white),
                  SizedBox(width: 5),
                  Text(
                    'Original Sound',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),

        // ডান পাশের অ্যাকশন আইকন (লাইক, কমেন্ট, শেয়ার)
        Positioned(
          right: 15,
          bottom: 20,
          child: Column(
            children: [
              const CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white,
                child: Icon(Icons.person, color: Colors.black, size: 30),
              ),
              const SizedBox(height: 20),

              // লাইক বাটন
              IconButton(
                icon: Icon(
                  Icons.favorite,
                  size: 35,
                  color: _isLiked ? Colors.red : Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    _isLiked = !_isLiked;
                    if (_isLiked) {
                      _likeCount++;
                    } else {
                      _likeCount--;
                    }
                  });
                },
              ),
              Text('$_likeCount', style: const TextStyle(color: Colors.white, fontSize: 12)),
              const SizedBox(height: 15),

              // কমেন্ট বাটন
              IconButton(
                icon: const Icon(Icons.comment, size: 35, color: Colors.white),
                onPressed: () {},
              ),
              const Text('45', style: TextStyle(color: Colors.white, fontSize: 12)),
              const SizedBox(height: 15),

              // শেয়ার বাটন
              IconButton(
                icon: const Icon(Icons.share, size: 35, color: Colors.white),
                onPressed: () {},
              ),
              const Text('Share', style: TextStyle(color: Colors.white, fontSize: 12)),
            ],
          ),
        ),
      ],
    );
  }
}
