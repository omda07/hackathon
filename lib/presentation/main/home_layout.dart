import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:marathon/controller/app_provider.dart';
import 'package:marathon/presentation/resources/color_manager.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Welcome to ODC Hackathon',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: ColorManager.white),
            ),
            elevation: 0,
            actions: [
              IconButton(
                  onPressed: () {
                    value.getBackendUsers();
                    value.getMathematicsUsers();
                    value.getAlgorithmModelUsers();
                    value.getUser();
                  },
                  icon: const Icon(Icons.refresh_outlined)),
            ],
          ),
          body: ConditionalBuilder(
            condition:
            value.backendUserModel != null,
            builder: (context) => Center(
              child: value.screens[value.currentIndex],
            ),
            fallback: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black.withOpacity(.1),
                )
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                child: GNav(
                  rippleColor: Colors.grey[300]!,
                  hoverColor: Colors.grey[100]!,
                  gap: 8,
                  activeColor: Colors.deepOrange,
                  iconSize: 24,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  duration: const Duration(milliseconds: 400),
                  tabBackgroundColor: Colors.grey[100]!,
                  color: Colors.black,
                  tabs: const [
                    GButton(
                      icon: Icons.queue_play_next_outlined,
                      text: 'Backend',
                    ),
                    GButton(
                      icon: Icons.architecture_outlined,
                      text: 'Mathematics',
                    ),
                    GButton(
                      icon: Icons.newspaper_outlined,
                      text: 'Algorithm',
                    ),
                  ],
                  selectedIndex: value.currentIndex,
                  onTabChange: (index) {
                    value.changeBottomNav(index);
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
