import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  String userType = "Household"; // Default user type
  late AnimationController _controller;
  late Animation<double> _fadeInAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    _fadeInAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: AnimatedBuilder(
          animation: _fadeInAnimation,
          builder: (context, child) {
            return Opacity(
              opacity: _fadeInAnimation.value,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 280,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.yellowAccent, Colors.green.shade400],
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
                          opacity: _fadeInAnimation,
                          child: Text(
                            "E-waste Sign In",
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ChoiceChip(
                                label: Text("Household"),
                                selected: userType == "Household",
                                selectedColor: Colors.green,
                                onSelected: (selected) {
                                  setState(() {
                                    userType = "Household";
                                  });
                                },
                              ),
                              SizedBox(width: 10),
                              ChoiceChip(
                                label: Text("Corporate"),
                                selected: userType == "Corporate",
                                selectedColor: Colors.green,
                                onSelected: (selected) {
                                  setState(() {
                                    userType = "Corporate";
                                  });
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "Email",
                              labelStyle: TextStyle(color: Colors.green),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.green, width: 2),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
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
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle: TextStyle(color: Colors.green),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.green, width: 2),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
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
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // Navigate based on user type
                                Navigator.pushNamed(context, '/home', arguments: userType);
                              }
                            },
                            child: Text(
                              "Sign In as $userType",
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                          SizedBox(height: 20),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/signup');
                            },
                            child: Text(
                              "Don't have an account? Sign up",
                              style: TextStyle(color: Colors.green, fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
