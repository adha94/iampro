// MADE WITH ❤️ BY ADHA94 FOR HEZMEDIA
import 'package:flutter/material.dart';
import 'package:iampro_client/screens/for_client/home_page.dart';
import 'package:iampro_client/screens/for_client/notifications.dart';
import 'package:iampro_client/screens/for_client/profile.dart';
import 'package:iampro_client/screens/for_client/progress.dart';
import 'package:iampro_client/screens/for_client/qr_scan_page.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({Key? key}) : super(key: key);

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  int index = 0;
  final List<Widget> screens = [
    HomePage(title: 'Dashboard'),
    const NotificationsClient(),
    const Progress(title: 'Progress'),
    const Profile()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      floatingActionButton: FloatingActionButton(
        elevation: 1,
        onPressed: () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const QRScanPage()));
        },
        child: const Icon(Icons.qr_code_scanner_rounded),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
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
                  Icons.description_outlined,
                ),
                selectedIcon: Icon(Icons.description),
                label: 'Dashboard'),
            NavigationDestination(
                icon: Icon(Icons.notifications_outlined),
                selectedIcon: Icon(Icons.notifications),
                label: 'Notifications'),
            NavigationDestination(
                icon: Icon(Icons.bar_chart_outlined),
                selectedIcon: Icon(Icons.bar_chart),
                label: 'Progress'),
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
