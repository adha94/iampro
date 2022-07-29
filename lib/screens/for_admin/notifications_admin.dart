// MADE WITH ❤️ BY ADHA94 FOR HEZMEDIA
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iampro_client/screens/for_admin/notifications_details_admin.dart';
import 'package:iampro_client/screens/login.dart';

class NotificationsAdmin extends StatefulWidget {
  const NotificationsAdmin({Key? key}) : super(key: key);

  @override
  State<NotificationsAdmin> createState() => _NotificationsAdminState();
}

class _NotificationsAdminState extends State<NotificationsAdmin> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xFF0000FF),
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Image.asset(
              'assets/images/iAMPRO_Logo_White.png',
              width: 30,
              height: 30,
              fit: BoxFit.scaleDown,
            ),
          ),
          leadingWidth: 40,
          centerTitle: true,
          title: const Text(
            'Notifications',
            style: TextStyle(
              fontFamily: 'Proxima Nova',
              color: Color(0xFFFFFFFF),
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
            child: Column(mainAxisSize: MainAxisSize.min, children: [
          Expanded(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('report')
                      .orderBy('placeholder', descending: true)
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot documentSnapshot =
                              snapshot.data!.docs[index];
                          return Material(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              NotificationsDetailsAdmin(
                                                  documentSnapshot[
                                                      'report_id'])));
                                },
                                child: Card(
                                  shadowColor: Colors.grey,
                                  elevation: 2,
                                  margin: const EdgeInsets.all(5),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          const SizedBox(width: 10),
                                          const CircleAvatar(
                                            backgroundImage: AssetImage(
                                                'assets/images/User_for_Notification.png'),
                                          ),
                                          const SizedBox(width: 20),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            textDirection: TextDirection.ltr,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              documentSnapshot['isRead'] ==
                                                      false
                                                  ? Text(
                                                      (documentSnapshot[
                                                              'client_id'] +
                                                          ' - ' +
                                                          documentSnapshot[
                                                              'client_name']),
                                                      style: const TextStyle(
                                                          fontFamily:
                                                              'Proxima Nova',
                                                          color:
                                                              Color(0xFF091249),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 14),
                                                    )
                                                  : Text(
                                                      (documentSnapshot[
                                                              'client_id'] +
                                                          ' - ' +
                                                          documentSnapshot[
                                                              'client_name']),
                                                      style: const TextStyle(
                                                          fontFamily:
                                                              'Proxima Nova',
                                                          color:
                                                              Color(0xFF091249),
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          fontSize: 14),
                                                    ),
                                              const SizedBox(height: 2),
                                              documentSnapshot['isRead'] ==
                                                      false
                                                  ? Text(
                                                      documentSnapshot[
                                                              'device_id'] +
                                                          ' - ' +
                                                          documentSnapshot[
                                                              'device_name'],
                                                      style: const TextStyle(
                                                          fontFamily:
                                                              'Proxima Nova',
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12),
                                                    )
                                                  : Text(
                                                      documentSnapshot[
                                                              'device_id'] +
                                                          ' - ' +
                                                          documentSnapshot[
                                                              'device_name'],
                                                      style: const TextStyle(
                                                          fontFamily:
                                                              'Proxima Nova',
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          fontSize: 12),
                                                    ),
                                              const SizedBox(height: 2),
                                              getStatusIndicator(
                                                  documentSnapshot[
                                                      'report_status']),
                                              const SizedBox(height: 2),
                                              Text(
                                                documentSnapshot['report_time'],
                                                style: const TextStyle(
                                                    fontFamily: 'Proxima Nova',
                                                    color: Colors.blue,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 10),
                                              ),
                                            ],
                                          )
                                        ]),
                                  ),
                                ),
                              ),
                            ),
                          );
                        });
                  }))
        ])));
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    if (!mounted) return;
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const LoginPage(title: 'Login')));
  }

  Widget getStatusIndicator(String indicator) {
    if (indicator == 'Pending') {
      return const Text(
        'PENDING',
        style: TextStyle(
            fontFamily: 'Proxima Nova',
            color: Colors.amberAccent,
            fontWeight: FontWeight.bold,
            fontSize: 14),
      );
    } else if (indicator == 'In Progress') {
      return Text(
        'IN PROGRESS',
        style: TextStyle(
            fontFamily: 'Proxima Nova',
            color: Colors.amber.shade900,
            fontWeight: FontWeight.bold,
            fontSize: 14),
      );
    } else if (indicator == 'Awaiting Confirmation') {
      return Text(
        'AWAITING CONFIRMATION',
        style: TextStyle(
            fontFamily: 'Proxima Nova',
            color: Colors.blue.shade900,
            fontWeight: FontWeight.bold,
            fontSize: 14),
      );
    } else if (indicator == 'Completed') {
      return Text(
        'COMPLETED',
        style: TextStyle(
            fontFamily: 'Proxima Nova',
            color: Colors.green.shade900,
            fontWeight: FontWeight.bold,
            fontSize: 14),
      );
    } else if (indicator == 'Incomplete') {
      return Text(
        'INCOMPLETE',
        style: TextStyle(
            fontFamily: 'Proxima Nova',
            color: Colors.red.shade900,
            fontWeight: FontWeight.bold,
            fontSize: 14),
      );
    } else {
      throw const Text('INVALID STATUS');
    }
  }
}
