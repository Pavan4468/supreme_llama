import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:animations/animations.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  // Controllers for text fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _avatarController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  // Firestore instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _uploadData() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      try {
        await _firestore.collection('users').add({
          'name': _nameController.text,
          'avatar': _avatarController.text,
          'image': _imageController.text,
          'description': _descriptionController.text,
          'location': _locationController.text,
          'weight': _weightController.text,
          'timestamp': FieldValue.serverTimestamp(), // Optional: for sorting
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Data uploaded successfully!')),
        );
        _clearForm();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error uploading data: $e')),
        );
      } finally {
        setState(() => _isLoading = false);
      }
    }
  }

  void _clearForm() {
    _nameController.clear();
    _avatarController.clear();
    _imageController.clear();
    _descriptionController.clear();
    _locationController.clear();
    _weightController.clear();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _avatarController.dispose();
    _imageController.dispose();
    _descriptionController.dispose();
    _locationController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Upload Page',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 4,
        shadowColor: Colors.black54,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      body: Center(
        child: OpenContainer(
          closedElevation: 5,
          transitionDuration: const Duration(milliseconds: 500),
          closedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          closedColor: Colors.green,
          closedBuilder: (context, action) => FloatingActionButton(
            onPressed: action,
            backgroundColor: Colors.green,
            child: const Icon(Icons.add, color: Colors.white),
          ),
          openBuilder: (context, action) => _uploadUI(),
        ),
      ),
    );
  }

  Widget _uploadUI() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Data'),
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: _isLoading
          ? const Center(child: SpinKitCircle(color: Colors.green, size: 50))
          : SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildTextField(_nameController, 'Name', 'Enter your name'),
                    const SizedBox(height: 15),
                    _buildTextField(_avatarController, 'Profile Image URL',
                        'Enter HTTP URL for profile image',
                        keyboardType: TextInputType.url),
                    const SizedBox(height: 15),
                    _buildTextField(_imageController, 'Content Image URL',
                        'Enter HTTP URL for content image',
                        keyboardType: TextInputType.url),
                    const SizedBox(height: 15),
                    _buildTextField(_descriptionController, 'Description',
                        'Enter description'),
                    const SizedBox(height: 15),
                    _buildTextField(_locationController, 'Map Link',
                        'Enter Google Maps URL',
                        keyboardType: TextInputType.url),
                    const SizedBox(height: 15),
                    _buildTextField(_weightController, 'Weight of Wastage',
                        'Enter weight (e.g., 10 kg)',
                        keyboardType: TextInputType.number),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: _uploadData,
                      icon: const Icon(Icons.upload),
                      label: const Text('Upload'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String label, String hint,
      {TextInputType keyboardType = TextInputType.text}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        labelStyle: const TextStyle(color: Colors.white),
        hintStyle: TextStyle(color: Colors.grey[400]),
        filled: true,
        fillColor: Colors.grey[850],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
      style: const TextStyle(color: Colors.white),
      keyboardType: keyboardType,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        if (keyboardType == TextInputType.url &&
            !Uri.tryParse(value)!.hasAbsolutePath) {
          return 'Please enter a valid URL';
        }
        return null;
      },
    );
  }
}