import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:islamic_app/core/theming/app_colors.dart';
import 'package:islamic_app/features/alarm/ui/alarm_screen_body.dart';
import 'package:islamic_app/features/home/ui/home_screen_body.dart';
import 'package:islamic_app/features/qibla/ui/qibla_screen_body.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _bodies = [
    const HomeScreenBody(),
    const QiblaScreenBody(),
    const HomeScreenBody(),
    const AlarmScreenBody(),
    const HomeScreenBody(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _bodies[_currentIndex],
        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: BottomNavigationBar(
          selectedItemColor: AppColors.primaryColor,
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
          elevation: 0,
          selectedFontSize: 18.sp,
          unselectedFontSize: 14.sp,
          iconSize: 25.r,
          type: BottomNavigationBarType.shifting,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'الرئيسية',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore_outlined),
              label: 'القبلة',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_rounded),
              label: 'ورد اليوم',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.timer_outlined),
              label: 'المنبه',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_pin),
              label: 'حسابي',
            ),
          ],
        ),
      ),
    );
  }
}
