import 'package:flutter/material.dart';
import 'package:gobidder/widgets/theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;
  bool _hidePass = true;

  Future<void> _signUp() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    final fullName = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    try {
      final response = await Supabase.instance.client.auth.signUp(
        email: email,
        password: password,
      );

      final user = response.user;
      if (user != null) {
        await Supabase.instance.client.from('profiles').insert({
          'id': user.id,
          'name': fullName,
        });

        if (!mounted) return;

        // ✅ Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Account created successfully"),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ),
        );

        // ✅ Delay before navigation
        await Future.delayed(const Duration(seconds: 2));
        Navigator.pushReplacementNamed(context, '/signin');
      }
    } on AuthException catch (e) {
      print("AuthException: ${e.message}");
      _showError(e.message);
    } catch (e) {
      print("Unexpected error: $e");
      _showError("Unexpected error: $e");
    }

    setState(() {
      _isLoading = false;
    });
  }


  Future<void> _signUpWithGoogle() async {
    try {
      final supabase = Supabase.instance.client;

      // Trigger Google sign-in using web OAuth flow
      final response = await supabase.auth.signInWithOAuth(
        Provider.google,
        redirectTo: 'http://localhost:3000', // Replace with your actual deployed URL if needed
      );

      // print("Google Sign-In Triggered: ${response.url}");
    } catch (e) {
      print("Google Sign-In error: $e");
      _showError("Google Sign-In failed.");
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30),
                        Center(
                          child: Text(
                            "CREATE ACCOUNT",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: ThemeColor,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "We provide a full range of auction products and services for you.",
                          style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                        ),
                        const SizedBox(height: 30),

                        // Full Name
                        TextFormField(
                          controller: _nameController,
                          validator: (value) =>
                          value == null || value.isEmpty ? 'Enter full name' : null,
                          decoration: InputDecoration(
                            labelText: 'Full Name',
                            suffixIcon: const Icon(Icons.person_outline),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: ThemeColor),
                            ),
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(color: Colors.grey.shade700),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Email
                        TextFormField(
                          controller: _emailController,
                          validator: (value) =>
                          value == null || !value.contains('@') ? 'Enter valid email' : null,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            suffixIcon: const Icon(Icons.email_outlined),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: ThemeColor),
                            ),
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(color: Colors.grey.shade700),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Password
                        TextFormField(
                          controller: _passwordController,
                          obscureText: _hidePass,
                          validator: (value) =>
                          value == null || value.length < 6 ? 'Password too short' : null,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _hidePass = !_hidePass;
                                });
                              },
                              icon: _hidePass
                                  ? const Icon(Icons.remove_red_eye_outlined)
                                  : const Icon(Icons.close_outlined),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: ThemeColor),
                            ),
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(color: Colors.grey.shade700),
                          ),
                        ),
                        const SizedBox(height: 30),

                        // Sign up button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ThemeColor,
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: _isLoading ? null : _signUp,
                            child: _isLoading
                                ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                            )
                                : const Text(
                              'Sign Up',
                              style: TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        Row(
                          children: [
                            const Expanded(child: Divider(thickness: 1)),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Text("OR", style: TextStyle(color: Colors.grey)),
                            ),
                            const Expanded(child: Divider(thickness: 1)),
                          ],
                        ),
                        const SizedBox(height: 20),

                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton.icon(
                            icon: Image.asset('assets/images/google-logo.png', height: 20),
                            label: const Text("Sign up with Google", style: TextStyle(color: Colors.black)),
                            onPressed: () {
                              // Handle Google sign in
                            },
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),

                        const Spacer(),
                        const SizedBox(height: 30),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Already have an account? "),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Sign In",
                                style: TextStyle(color: ThemeColor, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }
}
