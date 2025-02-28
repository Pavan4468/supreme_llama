import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Registration App',
      theme: ThemeData(
        primaryColor: Colors.green,
        scaffoldBackgroundColor: Colors.white,
      ),
      
    );
  }
}

// Home Screen Widget
class TypeScreen extends StatelessWidget {
  final String registrationType;

  const TypeScreen({super.key, required this.registrationType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome, $registrationType User!',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const RegistrationPage()),
                ); // Changed to pushReplacement to go back to registration
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: const Text(
                'Back to Registration',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  String? selectedRegistrationType;
  final _formKey = GlobalKey<FormState>();
  
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Register Now',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Please select your registration type',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildRegistrationTypeCard(
                    title: 'Household',
                    icon: Icons.home,
                    value: 'household',
                  ),
                  _buildRegistrationTypeCard(
                    title: 'Corporate',
                    icon: Icons.business,
                    value: 'corporate',
                  ),
                ],
              ),
              const SizedBox(height: 30),
              _buildTextField(
                controller: _nameController,
                label: selectedRegistrationType == 'household' 
                    ? 'Full Name' 
                    : 'Company Name',
                icon: Icons.person,
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: _emailController,
                label: 'Email',
                icon: Icons.email,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Email';
                  }
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: _phoneController,
                label: 'Phone Number',
                icon: Icons.phone,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Phone Number';
                  }
                  if (value.length < 10) {
                    return 'Please enter a valid phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: _addressController,
                label: 'Address',
                icon: Icons.location_on,
                maxLines: 2,
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() && 
                        selectedRegistrationType != null) {
                      // Navigate to TypeScreen as the new home screen
                      Navigator.pushReplacement( // Changed from push to pushReplacement
                        context,
                        MaterialPageRoute(
                          builder: (context) => TypeScreen(
                            registrationType: selectedRegistrationType!,
                          ),
                        ),
                      );
                      // Clear form after successful submission
                      _nameController.clear();
                      _emailController.clear();
                      _phoneController.clear();
                      _addressController.clear();
                      setState(() {
                        selectedRegistrationType = null;
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please fill all fields correctly and select registration type'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRegistrationTypeCard({
    required String title,
    required IconData icon,
    required String value,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedRegistrationType = value;
        });
      },
      child: Container(
        width: 140,
        height: 120,
        decoration: BoxDecoration(
          color: selectedRegistrationType == value 
              ? Colors.green.withOpacity(0.1) 
              : Colors.white,
          border: Border.all(
            color: selectedRegistrationType == value 
                ? Colors.green 
                : Colors.grey,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
              color: selectedRegistrationType == value 
                  ? Colors.green 
                  : Colors.black,
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: selectedRegistrationType == value 
                    ? Colors.green 
                    : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.green),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.green, width: 2),
        ),
        labelStyle: const TextStyle(color: Colors.black),
      ),
      validator: validator ?? (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
    );
  }
}