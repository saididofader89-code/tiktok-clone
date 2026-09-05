import 'package:flutter/material.dart';

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
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/home': (context) => const TikTokHomeScreen(),
      },
    );
  }
}

// ==================== 1. HOME SCREEN (MAIN SHELL) ====================
class TikTokHomeScreen extends StatefulWidget {
  const TikTokHomeScreen({super.key});

  @override
  State<TikTokHomeScreen> createState() => _TikTokHomeScreenState();
}

class _TikTokHomeScreenState extends State<TikTokHomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    VideoFeedBody(),
    DiscoverScreen(),
    UploadScreen(),
    InboxScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _screens[_selectedIndex],
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

// ==================== 2. LOGIN SCREEN ====================
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.video_library, size: 80, color: Colors.pinkAccent),
              const SizedBox(height: 20),
              const Text(
                'Welcome to TikTok Clone',
                style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/home');
                },
                child: const Text('Log In / Enter App', style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ==================== 3. VIDEO FEED SCREEN ====================
class VideoFeedBody extends StatelessWidget {
  const VideoFeedBody({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Container(
          color: Colors.grey[900],
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.play_circle_fill, size: 70, color: Colors.white54),
                    const SizedBox(height: 10),
                    Text('Video #${index + 1}', style: const TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              Positioned(
                right: 15,
                bottom: 50,
                child: Column(
                  children: const [
                    Icon(Icons.favorite, color: Colors.white, size: 35),
                    SizedBox(height: 5),
                    Text('1.2k', style: TextStyle(color: Colors.white)),
                    SizedBox(height: 15),
                    Icon(Icons.comment, color: Colors.white, size: 35),
                    SizedBox(height: 5),
                    Text('450', style: TextStyle(color: Colors.white)),
                    SizedBox(height: 15),
                    Icon(Icons.share, color: Colors.white, size: 35),
                    SizedBox(height: 5),
                    Text('Share', style: TextStyle(color: Colors.white)),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

// ==================== 4. DISCOVER SCREEN ====================
class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const TextField(
          decoration: InputDecoration(
            hintText: 'Search...',
            hintStyle: TextStyle(color: Colors.grey),
            prefixIcon: Icon(Icons.search, color: Colors.grey),
            border: InputBorder.none,
          ),
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const Center(
        child: Text('Discover / Search Page', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

// ==================== 5. UPLOAD SCREEN ====================
class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.cloud_upload, size: 80, color: Colors.grey),
            const SizedBox(height: 15),
            const Text('Upload Video Page', style: TextStyle(color: Colors.white, fontSize: 18)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Select Video'),
            )
          ],
        ),
      ),
    );
  }
}

// ==================== 6. INBOX SCREEN ====================
class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Inbox'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, color: Colors.white),
            ),
            title: Text('User ${index + 1}', style: const TextStyle(color: Colors.white)),
            subtitle: const Text('liked your video.', style: TextStyle(color: Colors.grey)),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 15),
          );
        },
      ),
    );
  }
}

// ==================== 7. PROFILE SCREEN ====================
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Saidi Dofader',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15),

            // ১. প্রোফাইল পিকচার
            const CircleAvatar(
              radius: 45,
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 10),

            // ২. ইউজারনেম
            const Text(
              '@saidi_dofader',
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),

            // ৩. ফলোয়িং, ফলোয়ার ও লাইক সংখ্যা
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildStatColumn('120', 'Following'),
                _buildStatContainer(),
                _buildStatColumn('5.4K', 'Followers'),
                _buildStatContainer(),
                _buildStatColumn('12K', 'Likes'),
              ],
            ),
            const SizedBox(height: 20),

            // ৪. প্রোফাইল এডিট বাটন
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.grey),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              ),
              onPressed: () {},
              child: const Text(
                'Edit Profile',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),

            // ৫. আপলোড করা ভিডিওর গ্রিড (Grid View)
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 9,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.grey[800],
                  child: Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildStatColumn(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          label,
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ],
    );
  }

  static Widget _buildStatContainer() {
    return Container(
      height: 15,
      width: 1,
      color: Colors.grey[700],
      margin: const EdgeInsets.symmetric(horizontal: 15),
    );
  }
}