import 'package:flutter/material.dart';
import 'package:rental_house_land_app/screens/auth/forget_password.dart';
import 'package:rental_house_land_app/screens/auth/registration.dart';
import 'package:rental_house_land_app/screens/setting/profile.dart';
import 'custom_widget/custom_button.dart';
import 'custom_widget/custom_text.dart';
import 'custom_widget/custom_text_button.dart';
import 'custom_widget/custom_text_field.dart';
import 'custom_widget/gradient_background.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;

  late AnimationController _controller;
  late Animation<double> _fadeInAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const GradientBackground(child: SizedBox.expand()),
          SafeArea(
            child: FadeTransition(
              opacity: _fadeInAnimation,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 40),
                    // Glassmorphism Login Box
                    Center(
                      child: FadeTransition(
                        opacity: _fadeInAnimation,
                        child: Container(
                          padding: const EdgeInsets.all(24),
                          width: 360,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 0.2),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Color.fromRGBO(255, 255, 255, 0.3),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.3),
                                blurRadius: 15,
                                spreadRadius: 3,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // App Logo (House Icon)
                              const CircleAvatar(
                                radius: 45,
                                backgroundColor: Colors.white24,
                                child: Icon(
                                  Icons.home,
                                  color: Colors.white,
                                  size: 50,
                                ),
                              ),
                              const SizedBox(height: 20),

                              CustomTextWidget(
                                text: "Welcome to Home!",
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),

                              const SizedBox(height: 15),

                              CustomTextField(
                                controller: emailController,
                                label: "Email",
                                icon: Icons.email_outlined,
                              ),

                              const SizedBox(height: 15),

                              CustomTextField(
                                controller: passwordController,
                                label: "Password",
                                icon: Icons.lock_outline,
                                isPassword: true,
                              ),

                              CustomTextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) =>
                                              const ForgotPasswordScreen(),
                                    ),
                                  );
                                },
                                text: "Forgot Password?",
                              ),

                              const SizedBox(height: 16),

                              CustomButton(
                                text: "Login",
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => const ProfileScreen(),
                                    ),
                                  );
                                },
                                backgroundColor: Color.fromRGBO(
                                  255,
                                  215,
                                  64,
                                  0.7,
                                ),
                                textColor: Colors.white,
                                fontSize: 16,
                                borderRadius: 12,
                              ),

                              const SizedBox(height: 15),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 32,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomTextWidget(
                  text: 'New User?',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                CustomTextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegistrationScreen(),
                      ),
                    );
                  },
                  text: "Register",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
