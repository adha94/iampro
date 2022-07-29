// MADE WITH ❤️ BY ADHA94 FOR HEZMEDIA
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iampro_client/screens/for_engineer/report_list_details_engineer.dart';
import 'package:iampro_client/screens/login.dart';

class ReportListEngineer extends StatefulWidget {
  const ReportListEngineer({Key? key}) : super(key: key);

  @override
  State<ReportListEngineer> createState() => _ReportListEngineerState();
}

class _ReportListEngineerState extends State<ReportListEngineer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String? deviceIDlink;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xFF0000FF),
          leadingWidth: 40,
          centerTitle: true,
          title: const Text(
            'Reports',
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
            child: StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection('report').snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
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
                                      builder: (context) =>
                                          ReportDetailsEngineer(
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
                                  title: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    textDirection: TextDirection.ltr,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '#' +
                                            ((documentSnapshot['report_id'])
                                                .toString()) +
                                            ' - ' +
                                            documentSnapshot['device_name'],
                                      ),
                                      const SizedBox(height: 1),
                                      Text(
                                        documentSnapshot['client_id'] +
                                            ' - ' +
                                            documentSnapshot['client_position'],
                                      ),
                                      const SizedBox(height: 1),
                                    ],
                                  ),
                                  subtitle:
                                      Text(documentSnapshot['report_status']),
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                })));
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    if (!mounted) return;
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const LoginPage(title: 'Login')));
  }
}
