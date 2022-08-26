import 'package:flutter/material.dart';
import 'package:qdesc_test/ui/screens/admin_screen.dart';
import 'package:qdesc_test/ui/screens/customer_screen.dart';
import 'package:qdesc_test/ui/screens/employee_screen.dart';
import 'package:qdesc_test/ui/screens/support_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
          backgroundColor: Colors.white60,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.fitHeight,
              ),
              const SizedBox(
                width: 20,
              ),
              Image.asset(
                'assets/images/menu.png',
                fit: BoxFit.fitHeight,
              ),
            ],
          ),
        ),
      ),
      body: getBody(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black45,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            label: 'Costomers',
            icon: Icon(
              Icons.album_rounded,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Employee',
            icon: Icon(
              Icons.album_rounded,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Support',
            icon: Icon(
              Icons.album_rounded,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Admin',
            icon: Icon(
              Icons.album_rounded,
            ),
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget getBody() {
    if (_selectedIndex == 0) {
      return const CustomerScreen();
    } else if (_selectedIndex == 1) {
      return const EmployeeScreen();
    } else if (_selectedIndex == 1) {
      return const SupportScreen();
    } else {
      return const AdminScreen();
    }
  }
}
