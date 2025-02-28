import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  String userType = "Household";
  late AnimationController _controller;
  late Animation<double> _animation;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _saveUserData() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseFirestore.instance.collection('users').add({
          'name': _nameController.text,
          'email': _emailController.text,
          'password': _passwordController.text, // You should hash passwords in production
          'userType': userType,
          'createdAt': Timestamp.now(),
        });

        // Navigate to home page after successful signup
        Navigator.pushReplacementNamed(context, '/home');
      } catch (e) {
        print("Error saving data: $e");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error saving data. Please try again.")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.green, Colors.green],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 60,
                  left: 20,
                  child: FadeTransition(
                    opacity: _animation,
                    child: Text(
                      "Join E-waste",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: "Name",
                        labelStyle: GoogleFonts.poppins(
                          textStyle: TextStyle(color: Colors.green.shade700),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your name";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: GoogleFonts.poppins(
                          textStyle: TextStyle(color: Colors.green.shade700),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your email";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: GoogleFonts.poppins(
                          textStyle: TextStyle(color: Colors.green),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your password";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ChoiceChip(
                          label: Text("Household"),
                          selected: userType == "Household",
                          onSelected: (selected) {
                            setState(() {
                              userType = "Household";
                            });
                          },
                          selectedColor: Colors.green.shade700,
                          labelStyle: TextStyle(
                            color: userType == "Household" ? Colors.white : Colors.green,
                          ),
                        ),
                        SizedBox(width: 10),
                        ChoiceChip(
                          label: Text("Corporate"),
                          selected: userType == "Corporate",
                          onSelected: (selected) {
                            setState(() {
                              userType = "Corporate";
                            });
                          },
                          selectedColor: Colors.green.shade700,
                          labelStyle: TextStyle(
                            color: userType == "Corporate" ? Colors.white : Colors.green,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: Colors.green.shade700,
                      ),
                      onPressed: _saveUserData, // Call Firestore save function
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/signin');
                      },
                      child: Text(
                        "Already have an account? Sign in",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(color: Colors.green.shade700, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
