import 'package:david_static_login/screens/home_page.dart';
import 'package:david_static_login/services/authenticate.dart';
import 'package:flutter/material.dart';

import 'register_page.dart'; // Import the RegisterPage

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _isPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/login_bk.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 100),
                    Align(
                      alignment: Alignment.centerLeft,
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
                        'Email', 'example@email.com', TextInputType.emailAddress,
                        _emailController),
                    SizedBox(height: 25),
                    _buildPasswordField('Password', _passwordController),
                    SizedBox(height: 30),
                    Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        width: 250,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _signInWithEmailAndPassword();
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => HomePage()),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            backgroundColor: Colors.orange,
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
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RegisterPage()),
                          );
                        },
                        child: Text(
                          'Don\'t have an account? Sign Up',
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
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, String hint, TextInputType keyboardType,
      TextEditingController controller) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your $label';
        }
        return null;
      },
    );
  }

  Widget _buildPasswordField(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      obscureText: !_isPasswordVisible,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your $label';
        }
        if (value.length < 6) {
          return 'Password must be at least 6 characters long';
        }
        return null;
      },
    );
  }

  Future<void> _signInWithEmailAndPassword() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    // Create an instance of Authentication
    final auth = Authentication();

    try {
      final userCredential = await auth.signInWithEmailAndPassword(email, password);
      if (userCredential != null) {
        print('Sign in successful!');
        // Navigate to the next screen (e.g., home screen)
      } else {
        print('Sign in failed.');
      }
    } catch (e) {
      print('An unexpected error occurred: ${e.toString()}');
    }
  }
}