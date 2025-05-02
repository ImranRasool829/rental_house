import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rental_house_land_app/custom_widget/custom_text.dart';
import '../../custom_widget/custom_button.dart';
import '../../custom_widget/gradient_background.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  String? selectedFileName;
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(255, 255, 255, 0.15),
                Color.fromRGBO(255, 255, 255, 0.05),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            border: Border(
              bottom: BorderSide(color: Color.fromRGBO(255, 255, 255, 0.3)),
            ),
          ),
          child: AppBar(
            iconTheme: const IconThemeData(color: Colors.white70),
            title: Text(
              "Landlord Profile",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
      ),
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
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 0.1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Color.fromRGBO(255, 255, 255, 0.3),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.2),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 16),
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage(
                              'assets/avatar_placeholder.png',
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'John Doe',
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'john.doe@email.com',
                            style: GoogleFonts.poppins(color: Colors.white70),
                          ),
                          CustomTextWidget(
                            text: '+1 234 567 8901',
                            color: Colors.white70,
                          ),
                          SizedBox(height: 8),
                          CustomButton(
                            text: 'Edit Profile',
                            onPressed: () {
                              //doStuff
                            },
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(169, 169, 169, 0.1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Color.fromRGBO(169, 169, 169, 0.3),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(169, 169, 169, 0.2),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                      ),

                      child: Column(
                        children: [
                          Text(
                            'Property Overview',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _infoCard('Listed', '3'),
                              _infoCard('Pending', '1'),
                              _infoCard('Tenants', '5'),
                            ],
                          ),
                          SizedBox(height: 16),
                          CustomButton(
                            text: 'Add New Property',
                            onPressed: () {},
                          ),
                          SizedBox(height: 24),
                          Text(
                            'Verification Documents',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 12),
                          _documentTile('Government ID', true),
                          _documentTile('Address Proof', false),
                          _documentTile('Bank Details', false),
                          if (selectedFileName != null)
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                'Selected File: $selectedFileName',
                                style: GoogleFonts.poppins(
                                  color: Colors.white70,
                                ),
                              ),
                            ),
                          SizedBox(height: 10),
                          CustomButton(
                            text: 'Upload Document',
                            onPressed: () {
                              //doStuff
                            },
                          ),
                          SizedBox(height: 24),
                          Divider(),
                          Text(
                            'Account Settings',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          ListTile(
                            leading: Icon(Icons.lock, color: Colors.white70),
                            title: Text(
                              'Change Password',
                              style: GoogleFonts.poppins(color: Colors.white),
                            ),
                            onTap: () {},
                          ),
                          ListTile(
                            leading: Icon(Icons.payment, color: Colors.white70),
                            title: Text(
                              'Payment Settings',
                              style: GoogleFonts.poppins(color: Colors.white),
                            ),
                            onTap: () {},
                          ),
                          ListTile(
                            leading: Icon(Icons.logout, color: Colors.white70),
                            title: Text(
                              'Logout',
                              style: GoogleFonts.poppins(color: Colors.white),
                            ),
                            onTap: () {},
                          ),
                        ],
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

  Widget _infoCard(String title, String value) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          title,
          style: GoogleFonts.poppins(fontSize: 14, color: Colors.white70),
        ),
      ],
    );
  }

  Widget _documentTile(String title, bool isUploaded) {
    return ListTile(
      leading: Icon(
        isUploaded ? Icons.check_circle : Icons.error_outline,
        color: isUploaded ? Colors.green : Colors.red,
      ),
      title: Text(
        title,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Text(
        isUploaded ? 'Uploaded' : 'Missing',
        style: GoogleFonts.poppins(
          color: isUploaded ? Colors.green : Colors.red,
        ),
      ),
    );
  }
}
