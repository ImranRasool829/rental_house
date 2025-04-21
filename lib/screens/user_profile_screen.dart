import 'package:flutter/material.dart';
import '../custom_widget/custom_button.dart';
import '../custom_widget/custom_text_field.dart';
import '../custom_widget/gradient_background.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
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
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
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
                    // Profile Picture
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white.withOpacity(0.2),
                      child: Icon(Icons.person, size: 50, color: Colors.white70),
                    ),
                    const SizedBox(height: 20),

                    // Name Input
                    CustomTextField(
                      controller: nameController,
                      label: "Full Name",
                      icon: Icons.person_outline,
                      isPassword: false,
                    ),
                    const SizedBox(height: 10),

                    // Email Input
                    CustomTextField(
                      controller: emailController,
                      label: "Email",
                      icon: Icons.email_outlined,
                      isPassword: false,
                    ),
                    const SizedBox(height: 10),

                    // Phone Input
                    CustomTextField(
                      controller: phoneController,
                      label: "Phone Number",
                      icon: Icons.phone_outlined,
                      isPassword: false,
                    ),
                    const SizedBox(height: 20),

                    // Save Button
                    CustomButton(
                      text: "Save Profile",
                      onPressed: () {
                        // TODO: Handle Save Profile Logic
                      },
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
