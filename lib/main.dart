import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Import screen files
import 'screens/home_screen.dart';
import 'screens/portfolio_screen.dart';
import 'screens/input_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'yoliday',
        theme: ThemeData(useMaterial3: true),
        home: const MainScreen(),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    PortfolioScreen(),
    InputScreen(),
    ProfileScreen(),
  ];

  final List<String> iconPaths = [
    'assets/icons/home.svg',
    'assets/icons/portfolio.svg',
    'assets/icons/input.svg',
    'assets/icons/profile.svg',
  ];

  final List<String> labels = ['Home', 'Portfolio', 'Input', 'Profile'];

  static const Color activeColor = Colors.deepOrange;
  static const Color inactiveColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: _screens[_selectedIndex],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 8.h, top: 4.h),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            HapticFeedback.lightImpact(); // Optional feedback
            setState(() => _selectedIndex = index);
          },
          items: List.generate(4, (index) {
            return BottomNavigationBarItem(
              icon: SvgPicture.asset(
                iconPaths[index],
                width: 24.w,
                height: 24.w,
                colorFilter: ColorFilter.mode(
                  _selectedIndex == index ? activeColor : inactiveColor,
                  BlendMode.srcIn,
                ),
              ),
              label: labels[index],
            );
          }),
          selectedItemColor: activeColor,
          unselectedItemColor: inactiveColor,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 2,
        ),
      ),
    );
  }
}
