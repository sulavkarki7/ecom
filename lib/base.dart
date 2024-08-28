import 'package:ecom/ui/screens/cart_screen.dart';
import 'package:ecom/ui/screens/product_list_screen.dart';
import 'package:ecom/ui/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    ProductListScreen(),
    CartScreen(),
    ProfileScreen(
      name: '',
      email: '',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Products'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.grey[800],
        // unselectedFontSize: ,
        unselectedItemColor: Colors.grey[400],
        backgroundColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
