import 'package:devflow/core/widgets/app_bottom_nav_icon.dart';
import 'package:flutter/material.dart';

class AppBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const AppBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: AppBottomNavIcon(
            data: 'assets/icons/home.png',
            isActive: currentIndex == 0,
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: AppBottomNavIcon(
            data: 'assets/icons/folder.png',
            isActive: currentIndex == 1,
          ),
          label: "Projects",
        ),
        BottomNavigationBarItem(
          icon: AppBottomNavIcon(
            data: 'assets/icons/checklist.png',
            isActive: currentIndex == 2,
          ),
          label: "Tasks",
        ),
        BottomNavigationBarItem(
          icon: AppBottomNavIcon(
            data: 'assets/icons/timer.png',
            isActive: currentIndex == 3,
          ),
          label: "Timer",
        ),
        BottomNavigationBarItem(
          icon: AppBottomNavIcon(
            data: 'assets/icons/more.png',
            isActive: currentIndex == 4,
          ),
          label: "More",
        ),
      ],
    );
  }
}
