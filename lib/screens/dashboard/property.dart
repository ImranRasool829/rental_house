import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PropertyScreen extends StatefulWidget {
  const PropertyScreen({super.key});

  @override
  State<PropertyScreen> createState() => _PropertyScreenState();
}

class _PropertyScreenState extends State<PropertyScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Property Screen',
        style: GoogleFonts.poppins(color: Colors.white, fontSize: 24),
      ),
    );
  }
}
