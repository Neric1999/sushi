import 'package:flutter/material.dart';
import 'package:sushi/views/screens/cart.screen.dart';
import 'package:sushi/views/screens/favorites.screen.dart';
import 'package:sushi/views/screens/home.screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    FavoritesScreen(),
    CartScreen(),
    Text('Tab 4'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildIcon(String assetName, int index) {
    bool isSelected = _selectedIndex == index;
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFFF6838) : Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: ImageIcon(
          AssetImage(assetName),
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _buildIcon('assets/images/Discovery.png', 0),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon('assets/images/Star.png', 1),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon('assets/images/‌Bag - 3.png', 2),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon('assets/images/User.png', 3),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFFFF6838),
        onTap: _onItemTapped,
      ),
    );
  }
}
