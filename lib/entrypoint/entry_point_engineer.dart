// MADE WITH ❤️ BY ADHA94 FOR HEZMEDIA
import 'package:flutter/material.dart';
import 'package:iampro_client/screens/for_engineer/notifications_engineer.dart';
import 'package:iampro_client/screens/for_engineer/profile_engineer.dart';
import 'package:iampro_client/screens/for_engineer/progress_engineer.dart';
import 'package:iampro_client/screens/for_engineer/report_list_engineer.dart';

class EntryPointEngineer extends StatefulWidget {
  const EntryPointEngineer({Key? key}) : super(key: key);

  @override
  State<EntryPointEngineer> createState() => _EntryPointEngineerState();
}

class _EntryPointEngineerState extends State<EntryPointEngineer> {
  int index = 0;
  final List<Widget> screens = [
    const NotificationsEngineer(),
    const ProgressEngineer(title: 'Progress'),
    const ReportListEngineer(),
    const ProfileEngineer()
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
                icon: Icon(Icons.ballot_outlined),
                selectedIcon: Icon(Icons.ballot),
                label: 'Report'),
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
