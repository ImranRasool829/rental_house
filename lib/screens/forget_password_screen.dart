import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../custom_widget/custom_button.dart';
import '../custom_widget/custom_text_field.dart';
import '../custom_widget/gradient_background.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController emailController = TextEditingController();
  late AnimationController _controller;
  late Animation<double> _fadeInAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    )..forward();

    _fadeInAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
  }

  @override
  void dispose() {
    _controller.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          
          const GradientBackground(child: SizedBox.expand()),

          // Content
          Center(
            child: FadeTransition(
              opacity: _fadeInAnimation,
              child: Container(
                padding: const EdgeInsets.all(24),
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white.withOpacity(0.3)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Title
                    Text(
                      "Reset Password",
                      style: GoogleFonts.poppins(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Subtitle
                    Text(
                      "Enter your email to receive a password reset link.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Email Input Field
                    CustomTextField(
                      controller: emailController,
                      label: "Email",
                      icon: Icons.email_outlined,
                      isPassword: false,
                    ),
                    const SizedBox(height: 20),

                    // Reset Password Button
                    CustomButton(
                      text: "Send Reset Link",
                      onPressed: () {
                        // TODO: Handle Password Reset Logic
                      },
                    ),

                    const SizedBox(height: 15),

                    // Back to Login
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context); // Go back to login
                      },
                      child: Text(
                        "Back to Login",
                        style: GoogleFonts.poppins(color: Colors.white70),
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
}
