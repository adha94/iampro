// MADE WITH ❤️ BY ADHA94 FOR HEZMEDIA
import 'package:flutter/material.dart';
import 'package:iampro_client/screens/for_manager/engineers_list.dart';
import 'package:iampro_client/screens/for_manager/notifications_manager.dart';
import 'package:iampro_client/screens/for_manager/profile_manager.dart';
import 'package:iampro_client/screens/for_manager/progress_manager.dart';

class EntryPointManager extends StatefulWidget {
  const EntryPointManager({Key? key}) : super(key: key);

  @override
  State<EntryPointManager> createState() => _EntryPointManagerState();
}

class _EntryPointManagerState extends State<EntryPointManager> {
  int index = 0;
  final List<Widget> screens = [
    const NotificationsManager(),
    const ProgressManager(title: 'Progress'),
    const EngineersList(),
    const ProfileManager()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.blue,
          labelTextStyle: MaterialStateProperty.all(
              const TextStyle(fontSize: 12, fontWeight: FontWeight.normal)),
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        ),
        child: NavigationBar(
          selectedIndex: index,
          animationDuration: const Duration(seconds: 2),
          onDestinationSelected: (index) => setState(() {
            this.index = index;
          }),
          height: 60,
          destinations: const [
            NavigationDestination(
                icon: Icon(
                  Icons.notifications_outlined,
                ),
                selectedIcon: Icon(Icons.notifications),
                label: 'Notifications'),
            NavigationDestination(
                icon: Icon(Icons.bar_chart_outlined),
                selectedIcon: Icon(Icons.bar_chart),
                label: 'Progress'),
            NavigationDestination(
                icon: Icon(Icons.engineering_outlined),
                selectedIcon: Icon(Icons.engineering),
                label: 'Engineers List'),
            NavigationDestination(
                icon: Icon(Icons.person_outlined),
                selectedIcon: Icon(Icons.person),
                label: 'Profile')
          ],
        ),
      ),
    );
  }
}
