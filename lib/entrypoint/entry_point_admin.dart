// MADE WITH ❤️ BY ADHA94 FOR HEZMEDIA
import 'package:flutter/material.dart';
import 'package:iampro_client/screens/for_admin/notifications_admin.dart';
import 'package:iampro_client/screens/for_admin/progress_admin.dart';
import 'package:iampro_client/screens/for_admin/utilities.dart';
import 'package:iampro_client/screens/for_admin/view_users.dart';

class EntryPointAdmin extends StatefulWidget {
  const EntryPointAdmin({Key? key}) : super(key: key);

  @override
  State<EntryPointAdmin> createState() => _EntryPointAdminState();
}

class _EntryPointAdminState extends State<EntryPointAdmin> {
  int index = 0;
  final List<Widget> screens = [
    const NotificationsAdmin(),
    const ProgressAdmin(),
    const ViewUsers(),
    const UtilitiesAdmin()
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
              labelBehavior:
                  NavigationDestinationLabelBehavior.onlyShowSelected,
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
                  icon: Icon(Icons.group_outlined),
                  selectedIcon: Icon(Icons.group),
                  label: 'Users',
                ),
                NavigationDestination(
                  icon: Icon(Icons.settings_outlined),
                  selectedIcon: Icon(Icons.settings),
                  label: 'Utilities',
                )
              ],
            )));
  }
}
