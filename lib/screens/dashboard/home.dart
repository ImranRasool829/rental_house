import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rental_house_land_app/screens/dashboard/ai_powered_dashboard.dart';
import 'package:rental_house_land_app/screens/dashboard/property.dart';
import 'package:rental_house_land_app/screens/dashboard/service.dart';
import '../../custom_widget/gradient_background.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

//Back: Ctrl + Cmd + Left Arrow
//Forward: Ctrl + Cmd + Right Arrow

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late AnimationController _controller;
  late Animation<double> _fadeInAnimation;

  final List<Widget> _screens = [
    AIPoweredDashboardScreen(),
    PropertyScreen(),
    ServiceScreen(),
  ];

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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.grey[500],
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(255, 255, 255, 0.1),
                    Color.fromRGBO(255, 255, 255, 0.1),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Text(
                'Landlord Menu',
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.dashboard, color: Colors.white70),
              title: Text(
                'Dashboard',
                style: GoogleFonts.poppins(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
              //  _onItemTapped(0);
              },
            ),
            ListTile(
              leading: Icon(Icons.person, color: Colors.white70),
              title: Text(
                'Profile',
                style: GoogleFonts.poppins(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
                context.push('/profile');
              },
            ),
            ListTile(
              leading: Icon(Icons.home_work_outlined, color: Colors.white70),
              title: Text(
                'Property',
                style: GoogleFonts.poppins(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
               // _onItemTapped(2);
              },
            ),
          ],
        ),
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64),
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
              bottom: BorderSide(color: Color.fromRGBO(255, 255, 255, 0.2)),
            ),
          ),
          child: AppBar(
            iconTheme: const IconThemeData(color: Colors.white70),
            title: Text(
              _selectedIndex == 0
                  ? 'Dashboard'
                  : _selectedIndex == 1
                  ? 'Profile'
                  : 'Property',
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
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          const GradientBackground(child: SizedBox.expand()),
          SafeArea(
            child: FadeTransition(
              opacity: _fadeInAnimation,
              child: _screens[_selectedIndex],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(44, 44, 78, 0.6),
              Color.fromRGBO(44, 44, 78, 0.6),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: const Border(
            top: BorderSide(color: Color.fromRGBO(255, 255, 255, 0.2)),
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          currentIndex: _selectedIndex,
          elevation: 0,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.maps_home_work),
              label: 'dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.store),
              label: 'Marketplace',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home_repair_service_outlined),
              label: 'Service',
            ),
          ],
        ),
      ),
    );
  }
}



