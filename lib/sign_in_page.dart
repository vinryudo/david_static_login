import 'package:flutter/material.dart';

import 'register_page.dart'; // Import the RegisterPage

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _isPasswordVisible = false; // Manage password visibility

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
                      'SIGN IN',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  _buildTextField(
                      'Username', 'Enter your username', TextInputType.text),
                  SizedBox(height: 25),
                  _buildPasswordField('Password'),
                  SizedBox(height: 30),
                  // Align the login button to the right
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: 250, // Set the width of the button
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle sign in action
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
                            'SIGN IN',
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
                  // Align the "Don't have an account" button to the right
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()),
                        );
                      },
                      child: Text(
                        "Don't have an account? Sign Up",
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
