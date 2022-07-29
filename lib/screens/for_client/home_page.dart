// MADE WITH ❤️ BY ADHA94 FOR HEZMEDIA
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iampro_client/model/model_client.dart';
import 'package:iampro_client/screens/for_client/device_report/alarm_report.dart';
import 'package:iampro_client/screens/for_client/device_report/bas_report.dart';
import 'package:iampro_client/screens/for_client/device_report/cas_report.dart';
import 'package:iampro_client/screens/for_client/device_report/cctv_report.dart';
import 'package:iampro_client/screens/for_client/device_report/pabx_report.dart';
import 'package:iampro_client/screens/for_client/device_report/pms_report.dart';
import 'package:iampro_client/screens/for_client/device_report/smarthome_report.dart';
import 'package:iampro_client/screens/for_client/device_report/smatv_report.dart';
import 'package:iampro_client/screens/login.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required String title}) : super(key: key);

  final controller = ScrollController();
  final numbers = List.generate(8, (index) => '$index');

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String? deviceCategory;
  User? user = FirebaseAuth.instance.currentUser;
  Client loggedInClient = Client();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInClient = Client.fromMap(value.data());
      setState(() {
        loggedInClient.displayName;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    String a = '';
    String b = '';
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0000FF),
        leadingWidth: 40,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Image.asset(
            'assets/images/iAMPRO_Logo_White.png',
            width: 30,
            height: 30,
            fit: BoxFit.scaleDown,
          ),
        ),
        title: const Text(
          'Dashboard',
          style: TextStyle(
            fontFamily: 'Proxima Nova',
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(
              icon: const Icon(Icons.power_settings_new),
              color: Colors.white,
              iconSize: 25,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Confirm Logout"),
                        content: const Text("Are you sure you want to logout?"),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        actions: [
                          TextButton(
                              onPressed: () => logout(context),
                              child: const Text("Confirm")),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Cancel"))
                        ],
                      );
                    });
              }),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Hello, ',
                  style: TextStyle(
                    fontFamily: 'Proxima Nova',
                    fontSize: 20,
                    color: Color(0xFF235CC3),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${loggedInClient.displayName}.',
                  style: const TextStyle(
                    fontFamily: 'Proxima Nova',
                    fontSize: 20,
                    color: Color(0xFF235CC3),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
            child: Text(
              'What would you like to report today?',
              style: TextStyle(
                fontFamily: 'Proxima Nova',
                color: Color(0xFF091249),
                fontWeight: FontWeight.normal,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
            child: Container(
              width: 375,
              height: 40,
              decoration: const BoxDecoration(
                color: Color(0xFFEEEEEE),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Choose your device',
                    style: TextStyle(
                      fontFamily: 'Proxima Nova',
                      color: Color(0xFF091249),
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: 375,
              height: 400,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 10,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    )
                  ]),
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1,
                ),
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CCTVReport(a, b),
                        ),
                      );
                    },
                    child: GridTile(
                      footer: const SizedBox(
                        height: 14,
                        child: GridTileBar(
                          backgroundColor: Colors.white70,
                          title: Center(
                              child: Text('CCTV',
                                  style: TextStyle(color: Colors.black))),
                        ),
                      ),
                      child: Image.asset('assets/images/cctv_no_border.png',
                          width: 100, height: 100, fit: BoxFit.cover),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CASReport(a, b),
                        ),
                      );
                    },
                    child: GridTile(
                      footer: const SizedBox(
                        height: 14,
                        child: GridTileBar(
                          backgroundColor: Colors.white70,
                          title: Center(
                              child: Text('CAS',
                                  style: TextStyle(color: Colors.black))),
                        ),
                      ),
                      child: Image.asset('assets/images/cas_no_border.png',
                          width: 100, height: 100, fit: BoxFit.cover),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PABXReport(a, b),
                        ),
                      );
                    },
                    child: GridTile(
                      footer: const SizedBox(
                        height: 14,
                        child: GridTileBar(
                          backgroundColor: Colors.white70,
                          title: Center(
                              child: Text('PABX',
                                  style: TextStyle(color: Colors.black))),
                        ),
                      ),
                      child: Image.asset('assets/images/pabx_no_border.png',
                          width: 100, height: 100, fit: BoxFit.cover),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AlarmReport(a, b),
                        ),
                      );
                    },
                    child: GridTile(
                      footer: const SizedBox(
                        height: 14,
                        child: GridTileBar(
                          backgroundColor: Colors.white70,
                          title: Center(
                              child: Text('Alarm',
                                  style: TextStyle(color: Colors.black))),
                        ),
                      ),
                      child: Image.asset('assets/images/alarm_no_border.png',
                          width: 100, height: 100, fit: BoxFit.cover),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BASReport(a, b),
                        ),
                      );
                    },
                    child: GridTile(
                      footer: const SizedBox(
                        height: 14,
                        child: GridTileBar(
                          backgroundColor: Colors.white70,
                          title: Center(
                              child: Text('BAS',
                                  style: TextStyle(color: Colors.black))),
                        ),
                      ),
                      child: Image.asset('assets/images/bas_no_border.png',
                          width: 100, height: 100, fit: BoxFit.cover),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SMATVReport(a, b),
                        ),
                      );
                    },
                    child: GridTile(
                      footer: const SizedBox(
                        height: 14,
                        child: GridTileBar(
                          backgroundColor: Colors.white70,
                          title: Center(
                              child: Text('Smart TV',
                                  style: TextStyle(color: Colors.black))),
                        ),
                      ),
                      child: Image.asset('assets/images/smatv_no_border.png',
                          width: 100, height: 100, fit: BoxFit.cover),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SmartHomeReport(a, b),
                        ),
                      );
                    },
                    child: GridTile(
                      footer: const SizedBox(
                        height: 14,
                        child: GridTileBar(
                          backgroundColor: Colors.white70,
                          title: Center(
                              child: Text('Smart Home',
                                  style: TextStyle(color: Colors.black))),
                        ),
                      ),
                      child: Image.asset(
                          'assets/images/smart_home_no_border.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PMSReport(a, b),
                        ),
                      );
                    },
                    child: GridTile(
                      footer: const SizedBox(
                        height: 14,
                        child: GridTileBar(
                          backgroundColor: Colors.white70,
                          title: Center(
                              child: Text('PMS',
                                  style: TextStyle(color: Colors.black))),
                        ),
                      ),
                      child: Image.asset('assets/images/pms_no_border.png',
                          width: 100, height: 100, fit: BoxFit.cover),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    if (!mounted) return;
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const LoginPage(title: 'Login')));
  }
}
