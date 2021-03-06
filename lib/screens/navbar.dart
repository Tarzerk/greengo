import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:greengo/screens/home_screen.dart';
import 'package:greengo/screens/analytics_screen.dart';
import 'package:greengo/screens/imageRecog_screen.dart';
import 'package:greengo/screens/authentication_screen.dart';
import 'package:greengo/screens/navbar.dart';
import 'package:greengo/screens/tips_screen.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedScreen = 0;

  final List<Widget> _widgetOptions = [
    HomeScreen(),
    AnalyticsScreen(),
    CameraApp(),
    TipsScreen(),
    HomePage()
  ];

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedScreen),
      ),
      bottomNavigationBar: Container(
        color: Color(0xFF154C8A),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: GNav(
            backgroundColor: Color(0xFF154C8A),
            color: Colors.white,
            activeColor: Color(0xFF2DD15B),
            tabBackgroundColor: Color(0xFF154C8A),
            gap: 5,
            onTabChange: (index) {
              _navigateBottomBar(index);
            },
            padding: EdgeInsets.all(16),
            tabs: const [
              GButton(
                icon: Icons.home_rounded,
                text: 'Home',
              ),
              GButton(
                icon: Icons.bar_chart_rounded,
                text: 'Ranks',
              ),
              GButton(
                icon: Icons.camera_alt_rounded,
                text: 'Camera',
              ),
              GButton(
                icon: Icons.question_mark_rounded,
                text: 'Tips',
              ),
              GButton(
                icon: Icons.logout_rounded,
                text: 'Logout',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
