import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AIPoweredDashboardScreen extends StatefulWidget {
  const AIPoweredDashboardScreen({super.key});

  @override
  State<AIPoweredDashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<AIPoweredDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text(
          'Dashboard Screen',
          style: GoogleFonts.poppins(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
