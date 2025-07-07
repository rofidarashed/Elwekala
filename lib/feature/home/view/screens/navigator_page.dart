import 'package:el_wekala/core/utils/colors/colors.dart';
import 'package:el_wekala/feature/cart/view/screens/cart_screen.dart';
import 'package:el_wekala/feature/fav/view/screens/fav_screen.dart';
import 'package:el_wekala/feature/home/view/screens/home_screen.dart';
import 'package:el_wekala/feature/profile/view/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  void _onTap(int index) {
    setState(() => _currentIndex = index);
  }

  final List<Widget> _screens = [
    HomeScreen(),
    FavScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onTap,
          backgroundColor: black,
          selectedItemColor: defaultColor,
          unselectedItemColor: gray3,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favorites",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: "Cart",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }
}
