import 'package:flutter/material.dart';
import 'package:movies/ui/screens/home/profile_tab/profile.dart';
import 'package:movies/ui/screens/home/search/search.dart';
import '../../../generated/assets.dart';
import '../../utils/app_colors.dart';
import 'home_tab/home_tab.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTab = 0;
  List<Widget> screens = [
    HomeTab(),
    Search(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: screens[currentTab],
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 9, right: 9, bottom: 9),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: BottomNavigationBar(
              backgroundColor: AppColors.gray,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
              currentIndex: currentTab,
              onTap: (value) {
                currentTab = value;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                    icon: Image(
                      image: AssetImage(currentTab == 0
                          ? Assets.iconsSelectedhome
                          : Assets.iconsHome),
                    ),
                    label: "Home"),
                BottomNavigationBarItem(
                    icon: Image(
                      image: AssetImage(currentTab == 1
                          ? Assets.iconsSelectedsearch
                          : Assets.iconsSearch),
                    ),
                    label: "Search"),
                BottomNavigationBarItem(
                    icon: Image(
                      image: AssetImage(currentTab == 2
                          ? Assets.iconsSelectedProfiel
                          : Assets.iconsProfiel),
                    ),
                    label: "Profile"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
