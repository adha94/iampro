// MADE WITH ❤️ BY ADHA94 FOR HEZMEDIA
import 'package:firebase_auth/firebase_auth.dart';
import 'package:iampro_client/screens/for_admin/add_new_company.dart';
import 'package:iampro_client/screens/for_admin/view_devices.dart';
import 'package:iampro_client/screens/for_admin/view_products.dart';
import 'package:iampro_client/screens/login.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class UtilitiesAdmin extends StatefulWidget {
  const UtilitiesAdmin({Key? key}) : super(key: key);

  @override
  State<UtilitiesAdmin> createState() => _UtilitiesAdminState();
}

class _UtilitiesAdminState extends State<UtilitiesAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            'Utilities',
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
                          content:
                              const Text("Are you sure you want to logout?"),
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
        backgroundColor: const Color(0xFFFFFFFF),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              //crossAxisAlignment: CrossAxisAlignment.center,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: NeumorphicButton(
                    style: NeumorphicStyle(
                      boxShape: NeumorphicBoxShape.roundRect(
                        const BorderRadius.all(Radius.circular(12.0)),
                      ),
                      color: Colors.blueAccent,
                      depth: 2,
                      intensity: 4,
                      shape: NeumorphicShape.concave,
                      surfaceIntensity: 6,
                      shadowLightColor: const Color(0xFFA7A9AF),
                    ),
                    duration: const Duration(seconds: 1),
                    minDistance: 100,
                    child: Column(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.add_business),
                          iconSize: 35,
                          onPressed: (() => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AddNewCompany()))),
                        ),
                        const Text('Add New Company')
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: NeumorphicButton(
                    style: NeumorphicStyle(
                      boxShape: NeumorphicBoxShape.roundRect(
                        const BorderRadius.all(Radius.circular(12.0)),
                      ),
                      color: Colors.blueAccent,
                      depth: 2,
                      intensity: 4,
                      shape: NeumorphicShape.concave,
                      surfaceIntensity: 6,
                      shadowLightColor: const Color(0xFFA7A9AF),
                    ),
                    duration: const Duration(seconds: 1),
                    minDistance: 100,
                    child: Column(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.dvr),
                          iconSize: 35,
                          onPressed: (() => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ViewDevices()))),
                        ),
                        const Text('View Devices')
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: NeumorphicButton(
                    style: NeumorphicStyle(
                      boxShape: NeumorphicBoxShape.roundRect(
                        const BorderRadius.all(Radius.circular(12.0)),
                      ),
                      color: Colors.blueAccent,
                      depth: 2,
                      intensity: 4,
                      shape: NeumorphicShape.concave,
                      surfaceIntensity: 6,
                      shadowLightColor: const Color(0xFFA7A9AF),
                    ),
                    duration: const Duration(seconds: 1),
                    minDistance: 100,
                    child: Column(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.desktop_windows),
                          iconSize: 35,
                          onPressed: (() => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ViewProducts()))),
                        ),
                        const Text('View Products')
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: NeumorphicButton(
                    style: NeumorphicStyle(
                      boxShape: NeumorphicBoxShape.roundRect(
                        const BorderRadius.all(Radius.circular(12.0)),
                      ),
                      color: Colors.blueAccent,
                      depth: 2,
                      intensity: 4,
                      shape: NeumorphicShape.concave,
                      surfaceIntensity: 6,
                      shadowLightColor: const Color(0xFFA7A9AF),
                    ),
                    duration: const Duration(seconds: 1),
                    minDistance: 100,
                    child: Column(
                      children: const [
                        IconButton(
                          icon: Icon(Icons.summarize),
                          iconSize: 35,
                          onPressed: null,
                        ),
                        Text('View Monthly Report')
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    if (!mounted) return;
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const LoginPage(title: 'Login')));
  }
}
