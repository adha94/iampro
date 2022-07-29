// MADE WITH ❤️ BY ADHA94 FOR HEZMEDIA
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iampro_client/entrypoint/entry_point_manager.dart';
import 'package:iampro_client/model/model_manager.dart';
import 'package:intl/intl.dart';

class NotificationsManagerPending extends StatefulWidget {
  const NotificationsManagerPending(this.firestoreDocID, {Key? key})
      : super(key: key);
  final int firestoreDocID;

  @override
  State<NotificationsManagerPending> createState() =>
      _NotificationsManagerPendingState();
}

class _NotificationsManagerPendingState
    extends State<NotificationsManagerPending> {
  Manager loggedInManager = Manager();
  User? user = FirebaseAuth.instance.currentUser;
  DocumentSnapshot? ds;
  String? dropDownValue;
  String? engineerID;
  String formattedDate = DateFormat.yMMMEd().format(DateTime.now());
  DateTime placeholder = DateTime.now();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInManager = Manager.fromMap(value.data());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: const Color(0xFF0000FF),
        leadingWidth: 40,
        centerTitle: true,
        title: const Text(
          'Notifications Details - Pending',
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
                        child: Center(
                          child: StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection('users')
                                  .where('user_type', isEqualTo: 'Engineer')
                                  .snapshots(),
                              builder: (context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (!snapshot.hasData) {
                                  return const Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator(
                                          color: Colors.blue),
                                    ),
                                  );
                                }
                                return DropdownButton<String>(
                                  value: dropDownValue,
                                  onChanged: (String? value) {
                                    setState(() {
                                      dropDownValue = value;
                                    });
                                  },
                                  items: snapshot.data!.docs.map((ds) {
                                    return DropdownMenuItem<String>(
                                      value: ds['display_name'],
                                      child: Text(
                                        ('${ds['id']} - ${ds['display_name']}'),
                                        style: const TextStyle(
                                            fontFamily: 'Proxima Nova',
                                            color: Color(0xFF091249),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                    );
                                  }).toList(),
                                  elevation: 8,
                                  hint:
                                      const Text('Please assign an engineer.'),
                                );
                              }),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 5),
                        child: ElevatedButton.icon(
                          icon: const Icon(Icons.engineering),
                          label: const Text('ASSIGN ENGINEER',
                              style: TextStyle(
                                  fontFamily: 'Proxima Nova',
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14)),
                          onPressed: () async {
                            QuerySnapshot getEngineerID =
                                await FirebaseFirestore.instance
                                    .collection('users')
                                    .where('user_type', isEqualTo: 'Engineer')
                                    .where('display_name',
                                        isEqualTo: dropDownValue.toString())
                                    .get();
                            QueryDocumentSnapshot queryEngineerID =
                                getEngineerID.docs[0];
                            DocumentReference referEngineerID =
                                queryEngineerID.reference;
                            await referEngineerID
                                .get()
                                .then((value) => engineerID = value['id']);
                            QuerySnapshot getReportID = await FirebaseFirestore
                                .instance
                                .collection('report')
                                .where('report_id',
                                    isEqualTo: widget.firestoreDocID)
                                .get();
                            QueryDocumentSnapshot queryReportID =
                                getReportID.docs[0];
                            DocumentReference referReportID =
                                queryReportID.reference;
                            await referReportID.update({
                              'arrival_time': formattedDate,
                              'manager_id': loggedInManager.id,
                              'manager_name': loggedInManager.displayName,
                              'engineer_id': engineerID,
                              'engineer_name': dropDownValue.toString(),
                              'report_status': 'In Progress',
                              'placeholder': placeholder,
                            }).then((value) {
                              FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(user?.uid)
                                  .update({
                                'cases_unsolved': FieldValue.increment(1)
                              });
                              referEngineerID.update(
                                  {'cases_unsolved': FieldValue.increment(1)});
                              const snackBar = SnackBar(
                                  content: Text(
                                      'The engineer has been assigned to the report.'));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return const EntryPointManager();
                              }));
                            });
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            minimumSize:
                                MaterialStateProperty.all(const Size(250, 40)),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue),
                            shadowColor:
                                MaterialStateProperty.all(Colors.blueAccent),
                          ),
                        ),
                      ),
                    ]);
                  }));
            }),
      ),
    );
  }
}
