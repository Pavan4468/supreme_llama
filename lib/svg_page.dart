import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.green,
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
    ),
    home: NGOPage(),
  ));
}

class NGOPage extends StatelessWidget {
  final List<Map<String, String>> ngos = [
    {
      "name": "Robin Hood Army",
      "description": "Focuses on feeding the hungry by collecting excess food from restaurants.",
      "contact": "+91 90089 90089",
      "address": "No specific HQ, operates across Bangalore",
      "image": "https://plus.unsplash.com/premium_photo-1678837556129-d8cdd80cbe25?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8bmdvc3xlbnwwfHwwfHx8MA%3D%3D"
    },
    {
      "name": "Goonj",
      "description": "Works on disaster relief, rural development, and clothing donations.",
      "contact": "+91 80 4090 7172",
      "address": "No. 15, 1st Floor, 8th Main, Vasanthnagar, Bangalore - 560052",
      "image": "https://plus.unsplash.com/premium_photo-1679444992181-cb5296652b1a?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fG5nb3N8ZW58MHx8MHx8fDA%3D"
    },
    {
      "name": "Akshaya Patra Foundation",
      "description": "Provides mid-day meals to school children.",
      "contact": "+91 80 2345 7890",
      "address": "HK Hill, Chord Rd, Rajajinagar, Bengaluru, Karnataka 560010",
      "image": "https://images.unsplash.com/photo-1535090042247-30387644aec5?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fG5nb3N8ZW58MHx8MHx8fDA%3D"
    },
    {
      "name": "The/Nudge Foundation",
      "description": "Focuses on poverty alleviation and skill development.",
      "contact": "+91 80 4161 2500",
      "address": "No. 559, 2nd Floor, 9th A Main, Indiranagar, Bangalore - 560038",
      "image": "https://plus.unsplash.com/premium_photo-1679260900300-88b80c98c089?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjF8fG5nb3N8ZW58MHx8MHx8fDA%3D"
    },
    {
      "name": "U&I Trust",
      "description": "Works in education and rehabilitation for underprivileged children.",
      "contact": "+91 99860 02222",
      "address": "No. 12, 2nd Floor, 1st Cross, Ashwini Layout, Bangalore - 560047",
      "image": "https://plus.unsplash.com/premium_photo-1681152790487-0177e04892df?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjV8fG5nb3N8ZW58MHx8MHx8fDA%3D"
    },
    {
      "name": "SNEHA NGO",
      "description": "Supports children, women, and elderly people in need.",
      "contact": "+91 22 2404 0088",
      "address": "No specific Bangalore office, operates regionally",
      "image": "https://images.unsplash.com/photo-1579296440601-efe78a19fa91?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fG5nb3N8ZW58MHx8MHx8fDA%3D"
    },
    {
      "name": "Samarthanam Trust for the Disabled",
      "description": "Works towards the empowerment of differently-abled individuals.",
      "contact": "+91 80 2658 2570",
      "address": "CA-39, 15th Cross, 16th Main, Sector 4, HSR Layout, Bangalore - 560102",
      "image": "https://plus.unsplash.com/premium_photo-1666726272929-b0e9f14ff563?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjN8fG5nb3N8ZW58MHx8MHx8fDA%3D"
    },
    {
      "name": "Bangalore Cares",
      "description": "Connects donors with various NGOs.",
      "contact": "+91 80 2520 1925",
      "address": "Virtual platform, no physical address",
      "image": "https://plus.unsplash.com/premium_photo-1683133593455-814352d8f6d0?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aGVscGluZ3xlbnwwfHwwfHx8MA%3D%3D"
    },
    {
      "name": "Dream India Network",
      "description": "Focuses on child welfare and education.",
      "contact": "+91 98862 34567",
      "address": "No. 23, 2nd Cross, Koramangala, Bangalore - 560034",
      "image": "https://images.unsplash.com/photo-1611934180042-da791b4091e7?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGhlbHBpbmd8ZW58MHx8MHx8fDA%3D"
    },
    {
      "name": "Youth for Seva",
      "description": "Encourages youth participation in social causes.",
      "contact": "+91 80 2671 3555",
      "address": "No. 171, 1st Cross, 1st Block, Koramangala, Bangalore - 560034",
      "image": "https://images.unsplash.com/photo-1608342381036-15657da6bf58?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGhlbHBpbmd8ZW58MHx8MHx8fDA%3D"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Helping Clubs & NGOs in Bangalore'),
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: ngos.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => NGODescriptionPage(ngo: ngos[index]),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return SlideTransition(
                        position: Tween<Offset>(
                          begin: Offset(1, 0),
                          end: Offset(0, 0),
                        ).animate(animation),
                        child: child,
                      );
                    },
                  ),
                );
              },
              child: Card(
                color: Colors.green.shade800,
                elevation: 8,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.volunteer_activism, color: Colors.green),
                    ),
                    title: Text(
                      ngos[index]["name"]!,
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
                    ),
                    subtitle: Text(
                      ngos[index]["description"]!,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class NGODescriptionPage extends StatelessWidget {
  final Map<String, String> ngo;

  NGODescriptionPage({required this.ngo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ngo["name"]!),
        elevation: 4,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // NGO Image
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    ngo["image"]!,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 200,
                        color: Colors.grey,
                        child: Center(child: Text("Image not available", style: TextStyle(color: Colors.white))),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              // NGO Name
              Text(
                ngo["name"]!,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.green),
              ),
              SizedBox(height: 12),
              // Description
              Text(
                "Description:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green.shade700),
              ),
              SizedBox(height: 8),
              Text(
                ngo["description"]!,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: 20),
              // Contact
              Text(
                "Contact:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green.shade700),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.phone, color: Colors.green, size: 20),
                  SizedBox(width: 8),
                  Text(
                    ngo["contact"]!,
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Address
              Text(
                "Address:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green.shade700),
              ),
              SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.location_on, color: Colors.green, size: 20),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      ngo["address"]!,
                      style: TextStyle(fontSize: 16, color: Colors.black),
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