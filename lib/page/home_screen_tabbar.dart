/*************  ✨ Codeium Command ⭐  *************/
import 'package:auto_route/auto_route.dart';
import 'package:beep_shop/features/auth/logic/bloc/auth_bloc.dart';
import 'package:beep_shop/page/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_badge/icon_badge.dart';
import 'package:iconsax/iconsax.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

@RoutePage()
class HomeTabbsarScreen extends StatefulWidget {
  const HomeTabbsarScreen({super.key});

  @override
  State<HomeTabbsarScreen> createState() => _HomeTabbsarScreenState();
}

class _HomeTabbsarScreenState extends State<HomeTabbsarScreen>
    with TickerProviderStateMixin {
  int _currentIndex = 0;
  late final TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        actions: [
          IconBadge(
            icon: const Icon(
              Iconsax.shopping_cart,
            ),
            itemCount: 5,
            badgeColor: Colors.green,
            itemColor: Colors.white,
            hideZero: true,
            onTap: () {
              print('test');
            },
          ),
        ],
      ),
      body: TabBarView(
        controller: tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const HomeScreen(),
          Container(
            color: Colors.pink,
          ),
          Container(
            color: Colors.orange,
          ),
          Container(
            color: Colors.teal,
          )
        ],
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) {
          tabController.animateTo(i);
          setState(
            () => _currentIndex = i,
          );
        },
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: const Icon(Iconsax.home),
            title: const Text("Home"),
            selectedColor: Colors.purple,
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: const Icon(Iconsax.heart),
            title: const Text("Likes"),
            selectedColor: Colors.pink,
          ),

          /// Search
          SalomonBottomBarItem(
            icon: const Icon(Iconsax.search_normal),
            title: const Text("Search"),
            selectedColor: Colors.orange,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: const Icon(Iconsax.user),
            title: const Text("Profile"),
            selectedColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}
