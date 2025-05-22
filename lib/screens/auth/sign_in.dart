import 'package:flutter/material.dart';
import 'package:gobidder/widgets/theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;
  bool _hidePass = true;

  Future<void> _signIn() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    try {
      final response = await Supabase.instance.client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      final user = response.user;
      if (user != null) {
        if (!mounted) return;
        Navigator.pushReplacementNamed(context, '/home');
      }
    } on AuthException catch (e) {
      _showError(e.message);
    } catch (e) {
      _showError("Unexpected error: $e");
    }

    setState(() {
      _isLoading = false;
    });
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
                            "SIGN IN",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: ThemeColor,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Welcome back! Please sign in to your account.",
                          style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                        ),
                        const SizedBox(height: 30),

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

                        // Sign in button
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
                            onPressed: _isLoading ? null : _signIn,
                            child: _isLoading
                                ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                  strokeWidth: 2, color: Colors.white),
                            )
                                : const Text(
                              'Sign In',
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
                            label: const Text("Sign in with Google", style: TextStyle(color: Colors.black)),
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
                            const Text("Don't have an account? "),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/signup');
                              },
                              child: Text(
                                "Sign Up",
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
