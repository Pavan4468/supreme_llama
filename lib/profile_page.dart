import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';

void main() {
  runApp(EWasteProfileApp());
}

class EWasteProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            FadeInDown(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/profile.webp'),
              ),
            ),
            SizedBox(height: 10),
            FadeInDown(
              delay: Duration(milliseconds: 300),
              child: Text(
                'Mercy',
                style: GoogleFonts.montserrat(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 5),
            FadeInDown(
              delay: Duration(milliseconds: 600),
              child: Text(
                'E-Waste Advocate',
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(height: 30),
            FadeInUp(
              delay: Duration(milliseconds: 900),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Text(
                      'Global E-Waste Statistics',
                      style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        statBox('74M', 'Metric Tons (2030)'),
                        statBox('50M+', 'Toxic Landfills'),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        statBox('20%', 'Recycled Properly'),
                        statBox('80%', 'Mismanaged'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            FadeInUp(
              delay: Duration(milliseconds: 1200),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'E-waste contains hazardous chemicals and heavy metals that pose risks to human health and the environment. Proper recycling and disposal are essential to mitigate these issues.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            FadeInUp(
              delay: Duration(milliseconds: 1500),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                ),
                onPressed: () {},
                child: Text(
                  'Learn How to Recycle',
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget statBox(String value, String title) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.montserrat(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          title,
          style: GoogleFonts.montserrat(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
