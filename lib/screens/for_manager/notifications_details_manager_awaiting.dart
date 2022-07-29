// MADE WITH ❤️ BY ADHA94 FOR HEZMEDIA
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iampro_client/model/model_manager.dart';
import 'package:iampro_client/screens/for_manager/notifications_manager.dart';

class NotificationsManagerAwaiting extends StatefulWidget {
  const NotificationsManagerAwaiting(this.firestoreDocID, {Key? key})
      : super(key: key);
  final int firestoreDocID;

  @override
  State<NotificationsManagerAwaiting> createState() =>
      _NotificationsManagerAwaitingState();
}

class _NotificationsManagerAwaitingState
    extends State<NotificationsManagerAwaiting> {
  Manager loggedInManager = Manager();
  User? user = FirebaseAuth.instance.currentUser;
  TextEditingController? managerComments = TextEditingController();
  File? image;
  DocumentSnapshot? ds;
  String? dropDownValue;
  DateTime placeholder = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: const Color(0xFF0000FF),
        leadingWidth: 40,
        centerTitle: true,
        title: const Text(
          'Notifications Details - Awaiting',
          style: TextStyle(
            fontFamily: 'Proxima Nova',
            color: Color(0xFFFFFFFF),
          ),
        ),
      ),
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('report')
                .where('report_id', isEqualTo: widget.firestoreDocID)
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                  itemCount: 1,
                  itemBuilder: ((context, index) {
                    DocumentSnapshot ds = snapshot.data!.docs[index];

                    return Column(children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                        child: Card(
                          shadowColor: Colors.grey,
                          elevation: 2,
                          margin: const EdgeInsets.all(5),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                const Center(child: Text('CLIENT')),
                                const SizedBox(height: 10),
                                Row(children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.grey.shade300,
                                    backgroundImage: ds['company_logo'] != null
                                        ? NetworkImage(ds['company_logo'])
                                        : const NetworkImage(
                                            'https://startupjobs.asia/assets/d63988b5/ac4a7810/images/default/company-logo-placeholder.png'),
                                    radius: 50,
                                  ),
                                  const SizedBox(width: 50),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        ds['client_id'] ?? 'Not yet assigned',
                                        style: const TextStyle(
                                          fontFamily: 'Proxima Nova',
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        ds['client_name'] ?? 'Not yet assigned',
                                        style: const TextStyle(
                                          fontFamily: 'Proxima Nova',
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ])
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                        child: Card(
                          shadowColor: Colors.grey,
                          elevation: 2,
                          margin: const EdgeInsets.all(5),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Center(child: Text('REPORT DETAILS')),
                                Text(
                                  ds['device_id'],
                                  style: const TextStyle(
                                    fontFamily: 'Proxima Nova',
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  ds['device_name'],
                                  style: const TextStyle(
                                    fontFamily: 'Proxima Nova',
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                  ),
                                ),
                                Flexible(
                                  child: Row(
                                    children: [
                                      //const Icon(Icons.priority_high),
                                      Flexible(
                                        child: Text(
                                          (List.from(ds['problems'])
                                              .toString()),
                                          textAlign: TextAlign.end,
                                          style: const TextStyle(
                                            fontFamily: 'Proxima Nova',
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    ds['remarks'] ?? 'Not specified',
                                    style: const TextStyle(
                                      fontFamily: 'Proxima Nova',
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    ds['client_comment'] ?? 'Not specified',
                                    style: const TextStyle(
                                      fontFamily: 'Proxima Nova',
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                  child: ds['proof'] != null
                                      ? Image.network(ds['proof'])
                                      : Image.network(
                                          'https://startupjobs.asia/assets/d63988b5/ac4a7810/images/default/company-logo-placeholder.png'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                        child: Card(
                          shadowColor: Colors.grey,
                          elevation: 2,
                          margin: const EdgeInsets.all(5),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                const Center(child: Text('MANAGER')),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    const SizedBox(width: 10),
                                    CircleAvatar(
                                      backgroundImage: ds[
                                                  'manager_photo_url'] !=
                                              null
                                          ? NetworkImage(
                                              ds['manager_photo_url'])
                                          : const NetworkImage(
                                              'https://www.pngfind.com/pngs/m/610-6104451_image-placeholder-png-user-profile-placeholder-image-png.png',
                                              scale: 10),
                                    ),
                                    const SizedBox(width: 10),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          ds['manager_id'] ??
                                              'Not yet assigned',
                                          style: const TextStyle(
                                            fontFamily: 'Proxima Nova',
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14,
                                          ),
                                        ),
                                        Flexible(
                                          child: Text(
                                            ds['manager_name'] ??
                                                'Not yet assigned',
                                            style: const TextStyle(
                                              fontFamily: 'Proxima Nova',
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                        child: Card(
                          shadowColor: Colors.grey,
                          elevation: 2,
                          margin: const EdgeInsets.all(5),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                const Center(child: Text('ENGINEER')),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    const SizedBox(width: 10),
                                    CircleAvatar(
                                      backgroundImage: ds[
                                                  'engineer_photo_url'] !=
                                              null
                                          ? NetworkImage(
                                              ds['engineer_photo_url'])
                                          : const NetworkImage(
                                              'https://www.pngfind.com/pngs/m/610-6104451_image-placeholder-png-user-profile-placeholder-image-png.png',
                                              scale: 10),
                                    ),
                                    const SizedBox(width: 10),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          ds['engineer_id'] ??
                                              'Not yet assigned',
                                          style: const TextStyle(
                                            fontFamily: 'Proxima Nova',
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14,
                                          ),
                                        ),
                                        Flexible(
                                          child: Text(
                                            ds['engineer_name'] ??
                                                'Not yet assigned',
                                            style: const TextStyle(
                                              fontFamily: 'Proxima Nova',
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Text(
                                            ds['engineer_comment'] ??
                                                'Not yet assigned',
                                            style: const TextStyle(
                                              fontFamily: 'Proxima Nova',
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 14,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Report Time',
                              style: TextStyle(
                                fontFamily: 'Proxima Nova',
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              ds['report_time'],
                              style: const TextStyle(
                                fontFamily: 'Proxima Nova',
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Arrival Time',
                              style: TextStyle(
                                fontFamily: 'Proxima Nova',
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              ds['arrival_time'] ?? 'Not yet assigned',
                              style: const TextStyle(
                                fontFamily: 'Proxima Nova',
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Comment less than 250 words',
                            contentPadding: const EdgeInsets.all(10),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: Colors.white),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          controller: managerComments,
                          textAlign: TextAlign.start,
                          keyboardType: TextInputType.multiline,
                          textInputAction: TextInputAction.done,
                          maxLines: 4,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton.icon(
                              onPressed: () async {
                                try {
                                  QuerySnapshot getReportID =
                                      await FirebaseFirestore.instance
                                          .collection('report')
                                          .where('report_id',
                                              isEqualTo: widget.firestoreDocID)
                                          .get();
                                  QueryDocumentSnapshot queryReportID =
                                      getReportID.docs[0];
                                  DocumentReference referReportID =
                                      queryReportID.reference;
                                  await referReportID.update({
                                    'manager_comment': managerComments!.text,
                                    'report_status': 'Completed',
                                    'placeholder': placeholder,
                                  }).then((value) async {
                                    FirebaseFirestore.instance
                                        .collection('users')
                                        .doc(user?.uid)
                                        .update({
                                      'cases_solved': FieldValue.increment(1),
                                      'cases_unsolved':
                                          FieldValue.increment(-1),
                                    });
                                    QuerySnapshot getEngineerID =
                                        await FirebaseFirestore.instance
                                            .collection('users')
                                            .where('user_type',
                                                isEqualTo: 'Engineer')
                                            .where('id',
                                                isEqualTo: ds['engineer_id'])
                                            .get();
                                    QueryDocumentSnapshot queryEngineerID =
                                        getEngineerID.docs[0];
                                    DocumentReference referEngineerID =
                                        queryEngineerID.reference;
                                    referEngineerID.update({
                                      'cases_solved': FieldValue.increment(1),
                                      'cases_unsolved':
                                          FieldValue.increment(-1),
                                    });
                                    return Fluttertoast.showToast(
                                        msg: 'Report complete. Case closed.');
                                  });
                                } catch (e) {
                                  Fluttertoast.showToast(
                                      msg: 'An error occured');
                                }
                                if (!mounted) return;
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const NotificationsManager()));
                              },
                              label: const Text('APPROVE',
                                  style: TextStyle(color: Colors.white)),
                              icon: const Icon(Icons.done, color: Colors.white),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors
                                      .lightBlueAccent //elevated btton background color
                                  ),
                            ),
                            ElevatedButton.icon(
                              onPressed: () async {
                                try {
                                  QuerySnapshot getReportID =
                                      await FirebaseFirestore.instance
                                          .collection('report')
                                          .where('report_id',
                                              isEqualTo: widget.firestoreDocID)
                                          .get();
                                  QueryDocumentSnapshot queryReportID =
                                      getReportID.docs[0];
                                  DocumentReference referReportID =
                                      queryReportID.reference;
                                  await referReportID.update({
                                    'manager_comment': managerComments!.text,
                                    'report_status': 'Incomplete',
                                    'placeholder': placeholder,
                                  }).then((value) => Fluttertoast.showToast(
                                      msg:
                                          'The engineer\'s work has been rejected.'));
                                } catch (e) {
                                  Fluttertoast.showToast(
                                      msg: 'An error occured');
                                }
                                if (!mounted) return;
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const NotificationsManager()));
                              },
                              label: const Text('REJECT',
                                  style: TextStyle(color: Colors.white)),
                              icon:
                                  const Icon(Icons.close, color: Colors.white),
                              style: ElevatedButton.styleFrom(
                                primary: Colors
                                    .red, //elevated btton background color
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]);
                  }));
            }),
      ),
    );
  }
}
