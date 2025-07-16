import 'package:el_wekala/core/utils/colors/colors.dart';
import 'package:el_wekala/feature/cart/view/screens/cart_screen.dart';
import 'package:el_wekala/feature/fav/view/screens/fav_screen.dart';
import 'package:el_wekala/feature/home/view/screens/home_screen.dart';
import 'package:el_wekala/feature/profile/view/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  int _currentIndex = 0;
  late List<AnimationController> _animationControllers;
  late List<Animation<double>> _animations;

  final List<Widget> _screens = [
    const HomeScreen(),
    const FavScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _animationControllers = List.generate(
      4,
      (index) => AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 300),
      ),
    );
    _animations = _animationControllers
        .map((controller) => Tween<double>(begin: 1.0, end: 1.2).animate(
              CurvedAnimation(
                parent: controller,
                curve: Curves.easeInOut,
              ),
            ))
        .toList();
    _animationControllers[0].forward();
  }

  @override
  void dispose() {
    for (var controller in _animationControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _onTap(int index) {
    setState(() {
      _animationControllers[_currentIndex].reverse();
      _currentIndex = index;
      _animationControllers[index].forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 2,
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: _onTap,
            backgroundColor: Colors.white,
            selectedItemColor: defaultColor,
            unselectedItemColor: Colors.grey,
            selectedLabelStyle: TextStyle(fontSize: 12.sp),
            unselectedLabelStyle: TextStyle(fontSize: 12.sp),
            type: BottomNavigationBarType.fixed,
            elevation: 10,
            items: [
              _buildAnimatedNavItem(Icons.home_outlined, Icons.home, "Home", 0),
              _buildAnimatedNavItem(
                  Icons.favorite_border, Icons.favorite, "Favorites", 1),
              _buildAnimatedNavItem(Icons.shopping_cart_outlined,
                  Icons.shopping_cart, "Cart", 2),
              _buildAnimatedNavItem(
                  Icons.person_outline, Icons.person, "Profile", 3),
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildAnimatedNavItem(
      IconData icon, IconData activeIcon, String label, int index) {
    return BottomNavigationBarItem(
      icon: ScaleTransition(
        scale: _animations[index],
        child: Icon(_currentIndex == index ? activeIcon : icon, size: 24.sp),
      ),
      label: label,
    );
  }
}