// IAMPRO TEST ACCOUNTS (Username: Password)
// Admin: admin1@admin1.com:admin1  Client: client@client1.com:client1  Manager: manager@manager1.com:manager1
//REGULAR USER TEST ACCOUNTS
//  redzaminhat@twitter.com:redzaminhat hairulz93@gmail.com:hairulazreen
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:iampro_client/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

DocumentSnapshot? documentSnapshot;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // _init();
  runApp(const MyApp());
}

_init() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final token = prefs.getString("userID");
  documentSnapshot =
      await FirebaseFirestore.instance.collection('users').doc(token).get();
  if (token != null) {
    print('Token: $token');
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    initialization();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 3));
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'iAMPRO',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LoginPage(title: 'Login'));
  }
}
