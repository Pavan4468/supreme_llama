import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.black,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
          titleLarge: TextStyle(color: Colors.white),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
          ),
        ),
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  final List<Map<String, String>> users = const [
    {
      'name': 'John Doe',
      'avatar': 'https://randomuser.me/api/portraits/men/1.jpg',
      'image': 'https://images.unsplash.com/photo-1526951521990-620dc14c214b?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8ZSUyMHdhc3RlfGVufDB8fDB8fHww',
      'description': 'Collects old electronics for recycling. Offers doorstep pickup. Helps reduce pollution. Contact for safe disposal of gadgets.',
      'location': 'https://maps.google.com/?q=40.7128,-74.0060',
      'weight': '10 kg',
    },
    {
      'name': 'Alice Smith',
      'avatar': 'https://randomuser.me/api/portraits/women/2.jpg',
      'image': 'https://images.unsplash.com/photo-1523293915678-d126868e96f1?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8ZSUyMHdhc3RlfGVufDB8fDB8fHww',
      'description': ' Grows chemical-free vegetables and fruits. Supplies fresh produce. Supports sustainable farming. Home delivery available.',
      'location': 'https://maps.google.com/?q=34.0522,-118.2437',
      'weight': '15 kg',
    },
    {
      'name': 'Bob Johnson',
      'avatar': 'https://randomuser.me/api/portraits/men/3.jpg',
      'image': 'https://picsum.photos/seed/assist3/400/300',
      'description': 'Creates eco-friendly handmade gifts, home décor, and accessories. Custom orders accepted. Promotes traditional artistry.',
      'location': 'https://maps.google.com/?q=41.8781,-87.6298',
      'weight': '8 kg',
    },
    {
      'name': 'Emma Brown',
      'avatar': 'https://randomuser.me/api/portraits/women/4.jpg',
      'image': 'https://images.unsplash.com/photo-1612965110667-4175024b0dcc?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGUlMjB3YXN0ZXxlbnwwfHwwfHx8MA%3D%3D',
      'description': 'Designs logos, posters, and social media content. Affordable pricing. Quick delivery. Offers unique and creative visuals.',
      'location': 'https://maps.google.com/?q=29.7604,-95.3698',
      'weight': '12 kg',
    },
    {
      'name': 'Michael White',
      'avatar': 'https://randomuser.me/api/portraits/men/5.jpg',
      'image': 'https://images.unsplash.com/photo-1637773339519-679b29199c18?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fGUlMjB3YXN0ZXxlbnwwfHwwfHx8MA%3D%3D',
      'description': 'Provides personal and group yoga sessions. Helps with mental relaxation and fitness. Online and offline classes available..',
      'location': 'https://maps.google.com/?q=25.7617,-80.1918',
      'weight': '9 kg',
    },
    {
      'name': 'Sophia Green',
      'avatar': 'https://randomuser.me/api/portraits/women/6.jpg',
      'image': 'https://images.unsplash.com/photo-1632667226262-3f341ec5afff?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fGUlMjB3YXN0ZXxlbnwwfHwwfHx8MA%3D%3D',
      'description': 'Buys and sells second-hand furniture in good condition. Affordable rates. Supports recycling and sustainability.',
      'location': 'https://maps.google.com/?q=47.6062,-122.3321',
      'weight': '11 kg',
    },
    {
      'name': 'David Black',
      'avatar': 'https://randomuser.me/api/portraits/men/7.jpg',
      'image': 'https://images.unsplash.com/photo-1649595409836-71bfe4c5ec6c?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGUlMjB3YXN0ZXxlbnwwfHwwfHx8MA%3D%3D',
      'description': ' Offers professional grooming for dogs and cats. Home service available. Ensures pet hygiene and care.',
      'location': 'https://maps.google.com/?q=32.7767,-96.7970',
      'weight': '14 kg',
    },
    {
      'name': 'Olivia Gray',
      'avatar': 'https://randomuser.me/api/portraits/women/8.jpg',
      'image': 'https://images.unsplash.com/photo-1534489573486-7d1fa4f436e4?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mjd8fGUlMjB3YXN0ZXxlbnwwfHwwfHx8MA%3D%3D',
      'description': 'Makes custom cakes, pastries, and cookies. Uses organic ingredients. Takes bulk party orders. Delivers fresh desserts.',
      'location': 'https://maps.google.com/?q=37.7749,-122.4194',
      'weight': '7 kg',
    },
    {
      'name': 'James Wilson',
      'avatar': 'https://randomuser.me/api/portraits/men/9.jpg',
      'image': 'https://images.unsplash.com/flagged/photo-1572213426852-0e4ed8f41ff6?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mjh8fGUlMjB3YXN0ZXxlbnwwfHwwfHx8MA%3D%3D',
      'description': 'Fixes all mobile brands at reasonable rates. Offers doorstep service. Expert in screen and battery replacements.',
      'location': 'https://maps.google.com/?q=42.3601,-71.0589',
      'weight': '13 kg',
    },
    {
      'name': 'Lily Martinez',
      'avatar': 'https://randomuser.me/api/portraits/women/10.jpg',
      'image': 'https://images.unsplash.com/photo-1618580298796-8c681e026369?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzF8fGUlMjB3YXN0ZXxlbnwwfHwwfHx8MA%3D%3D',
      'description': ' Captures weddings, birthdays, and corporate events. High-quality photography. Provides edited albums and videos.',
      'location': 'https://maps.google.com/?q=39.7392,-104.9903',
      'weight': '10 kg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      automaticallyImplyLeading: false,
  title: const Text(
    'E-WASTE',
    style: TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
  ),
  backgroundColor: Colors.transparent, // Transparent to show gradient
  elevation: 4, // Subtle shadow for depth
  flexibleSpace: Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.green[900]!, Colors.green[600]!],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
  ),
  centerTitle: true, // Centers the title for a balanced look
),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Card(
              elevation: 8,
              color: Colors.grey[900],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) => UserDetailsPage(user: user),
                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                        const begin = Offset(1.0, 0.0);
                        const end = Offset.zero;
                        const curve = Curves.easeInOut;
                        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                        return SlideTransition(
                          position: animation.drive(tween),
                          child: child,
                        );
                      },
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: NetworkImage(user['avatar']!),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  user['name']!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  user['description']!,
                                  style: TextStyle(color: Colors.grey[400], fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                          const Icon(Icons.arrow_forward_ios, color: Colors.green, size: 18),
                        ],
                      ),
                      const SizedBox(height: 10),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          user['image']!,
                          height: 150, // Adjusted height for better visibility
                          width: double.infinity, // Full width
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class UserDetailsPage extends StatelessWidget {
  final Map<String, String> user;

  const UserDetailsPage({super.key, required this.user});

  Future<void> _openMap(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not open $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user['name']!),
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: user['name']!,
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(user['avatar']!),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                user['name']!,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                user['description']!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  user['image']!,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey[850],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.scale, color: Colors.green, size: 20),
                    const SizedBox(width: 10),
                    Text(
                      'Weight of Wastage: ${user['weight']}',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                icon: const Icon(Icons.map),
                label: const Text('View on Map'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[700],
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  elevation: 5,
                ),
                onPressed: () => _openMap(user['location']!),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[600],
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      elevation: 5,
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Request Accepted')),
                      );
                    },
                    child: const Text(
                      'Accept',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[600],
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      elevation: 5,
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Request Declined')),
                      );
                    },
                    child: const Text(
                      'Decline',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}