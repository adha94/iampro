// MADE WITH ❤️ BY ADHA94 FOR HEZMEDIA
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iampro_client/model/model_client.dart';
import 'package:iampro_client/screens/for_client/progress_details.dart';
import 'package:iampro_client/screens/login.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Progress extends StatefulWidget {
  const Progress({Key? key, required String title}) : super(key: key);

  @override
  State<Progress> createState() => _ProgressState();
}

class _ProgressState extends State<Progress> {
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
    String? deviceIDlink;
    double? autoSetter;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: const Color(0xFF0000FF),
        leadingWidth: 40,
        centerTitle: true,
        title: const Text(
          'Progress',
          style: TextStyle(
            fontFamily: 'Proxima Nova',
            color: Color(0xFFFFFFFF),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Image.asset(
            'assets/images/iAMPRO_Logo_White.png',
            width: 30,
            height: 30,
            fit: BoxFit.scaleDown,
          ),
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
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('report')
                .orderBy('placeholder', descending: true)
                //.where('client_name', isEqualTo: loggedInUser.fullName)
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        DocumentSnapshot documentSnapshot =
                            snapshot.data!.docs[index];
                        if (documentSnapshot['device_name'] == 'Alarm') {
                          deviceIDlink = 'assets/images/alarm_no_border.png';
                        } else if (documentSnapshot['device_name'] == 'BAS') {
                          deviceIDlink = 'assets/images/bas_no_border.png';
                        } else if (documentSnapshot['device_name'] == 'CAS') {
                          deviceIDlink = 'assets/images/Cas_no_border.png';
                        } else if (documentSnapshot['device_name'] == 'CCTV') {
                          deviceIDlink = 'assets/images/cctv_no_border.png';
                        } else if (documentSnapshot['device_name'] == 'PABX') {
                          deviceIDlink = 'assets/images/pabx_no_border.png';
                        } else if (documentSnapshot['device_name'] == 'PMS') {
                          deviceIDlink = 'assets/images/pms_no_border.png';
                        } else if (documentSnapshot['device_name'] ==
                            'Smart Home') {
                          deviceIDlink =
                              'assets/images/smart_home_no_border.png';
                        } else if (documentSnapshot['device_name'] ==
                            'Smart TV') {
                          deviceIDlink = 'assets/images/smatv_no_border.png';
                        }

                        if (documentSnapshot['report_status'] == 'Pending') {
                          autoSetter = 0.25;
                        } else if (documentSnapshot['report_status'] ==
                            'In Progress') {
                          autoSetter = 0.50;
                        } else if (documentSnapshot['report_status'] ==
                            'Awaiting Confirmation') {
                          autoSetter = 0.75;
                        } else if (documentSnapshot['report_status'] ==
                            'Completed') {
                          autoSetter = 1.00;
                        } else if (documentSnapshot['report_status'] ==
                            'Incomplete') {
                          autoSetter = 0.375;
                        }
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return Material(
                          elevation: 20,
                          shadowColor: Colors.grey,
                          shape: const RoundedRectangleBorder(),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(18, 5, 18, 5),
                            child: GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProgressDetails(
                                          documentSnapshot['report_id']))),
                              child: Card(
                                child: ListTile(
                                  leading: Image.asset(
                                    deviceIDlink!,
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.scaleDown,
                                    alignment: Alignment.centerLeft,
                                  ),
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(documentSnapshot['device_id']),
                                      const SizedBox(width: 1),
                                      Text(documentSnapshot['report_time'],
                                          style: const TextStyle(
                                              fontFamily: 'Proxima Nova',
                                              color: Colors.grey,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 14)),
                                    ],
                                  ),
                                  subtitle: LinearPercentIndicator(
                                      animation: true,
                                      animationDuration: 500,
                                      barRadius: const Radius.circular(16),
                                      percent: autoSetter!,
                                      backgroundColor: Colors.white,
                                      progressColor: Colors.blue),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }),
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
