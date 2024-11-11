import 'package:flutter/material.dart';

import 'sign_in_page.dart'; // Import the SignInPage

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background container with decoration image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'images/login_bk.png'), // replace with your image
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Center(
              // Center the Column widget
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center vertically
                children: [
                  SizedBox(height: 100), // Spacing from the top
                  Align(
                    alignment:
                        Alignment.centerLeft, // Aligns the text to the left
                    child: Text(
                      'REGISTER',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  _buildTextField('Name', 'John Doe', TextInputType.name),
                  SizedBox(height: 25),
                  _buildTextField(
                      'Mobile Number', '8129*****', TextInputType.phone),
                  SizedBox(height: 25),
                  _buildTextField(
                      'Email', 'example@email.com', TextInputType.emailAddress),
                  SizedBox(height: 25),
                  _buildPasswordField('Password'),
                  SizedBox(height: 30),
                  // Align the signup button to the right
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: 250, // Set the width of the button
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle sign-up logic
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          backgroundColor: Colors.orange, // Button color
                        ),
                        child: Center(
                          child: Text(
                            'SIGN UP',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Align the "Already have an account" button to the right
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // Navigate to the SignInPage
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignInPage()),
                        );
                      },
                      child: Text(
                        'Already have an account? Sign In',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Build text field widget
  Widget _buildTextField(
      String label, String hint, TextInputType keyboardType) {
    return TextField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
      ),
    );
  }

  // Build password field widget with visibility toggle
  Widget _buildPasswordField(String label) {
    return TextField(
      obscureText: !_isPasswordVisible, // Toggle based on visibility state
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible; // Toggle visibility
            });
          },
        ),
      ),
    );
  }
}
