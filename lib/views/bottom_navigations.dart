import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:pill_vault/views/home/home_page.dart';
import 'package:pill_vault/views/medicine_add/add_page.dart';
import 'package:pill_vault/views/medicine_list_view/list_view_page.dart';
import 'package:pill_vault/views/profile/profile_page.dart';
import 'package:pill_vault/views/reminder/reminder_page.dart';

class BottomNavigations extends StatefulWidget {
  const BottomNavigations({super.key});

  @override
  State<BottomNavigations> createState() => _BottomNavigationsState();
}

class _BottomNavigationsState extends State<BottomNavigations> {
  int _selectedIndex = 0;

  final GlobalKey<CurvedNavigationBarState> _curvedNavigationKey = GlobalKey();

  final List<Widget> _pages = const [
    HomePage(),
    ListViewPage(),
    AddPage(),
    ReminderPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        key: _curvedNavigationKey,
        index: _selectedIndex,
        height: 65.0,
        items: const [
          Icon(Icons.home, size: 33, color: Color(0xFF002B20)),
          Icon(Icons.medical_information, size: 33, color: Color(0xFF002B20)),
          Icon(Icons.add, size: 33, color: Color(0xFF002B20)),
          Icon(Icons.notification_add, size: 33, color: Color(0xFF002B20)),
          Icon(Icons.person, size: 33, color: Color(0xFF002B20)),
        ],
        color: Colors.white,
        backgroundColor: Color(0xFFC6FCEF),
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        letIndexChange: (index) => true,
      ),
    );
  }
}
