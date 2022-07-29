// MADE WITH ❤️ BY ADHA94 FOR HEZMEDIA
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image/flutter_image.dart';

class NotificationsDetailsAdmin extends StatelessWidget {
  const NotificationsDetailsAdmin(this.firestoreDocID, {Key? key})
      : super(key: key);
  final int firestoreDocID;

  @override
  Widget build(BuildContext context) {
    //File? image;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: const Color(0xFF0000FF),
        leadingWidth: 40,
        centerTitle: true,
        title: const Text(
          'Notifications Details',
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
                .where('report_id', isEqualTo: firestoreDocID)
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
                    setAsUnread();
                    return Column(
                      children: [
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
                                      backgroundImage: const NetworkImageWithRetry(
                                          'https://img.freepik.com/premium-vector/pharmacy-logo-vector_23987-171.jpg'),
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
                                          ds['client_name'] ??
                                              'Not yet assigned',
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                                    child: Text(
                                      (List.from(ds['problems']).toString()),
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
                                  Flexible(
                                    child: Text(
                                      ds['remarks'] ?? 'Not specified',
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
                                      ds['client_comment'] ?? 'Not specified',
                                      style: const TextStyle(
                                        fontFamily: 'Proxima Nova',
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                    child: Center(
                                      child: ds['proof'] != null
                                          ? Image.network(ds['proof'])
                                          : Image.network(
                                              'https://startupjobs.asia/assets/d63988b5/ac4a7810/images/default/company-logo-placeholder.png'),
                                    ),
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
                                      const CircleAvatar(
                                        backgroundImage: AssetImage(
                                            'assets/images/User_for_Notification.png'),
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
                                          Flexible(
                                            child: Text(
                                              ds['manager_comment'] ??
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
                                      const CircleAvatar(
                                        backgroundImage: AssetImage(
                                            'assets/images/User_for_Notification.png'),
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
                      ],
                    );
                  }));
            }),
      ),
    );
  }

  Future setAsUnread() async {
    QuerySnapshot getReportID = await FirebaseFirestore.instance
        .collection('report')
        .where('report_id', isEqualTo: firestoreDocID)
        .get();
    QueryDocumentSnapshot queryReportID = getReportID.docs[0];
    DocumentReference referReportID = queryReportID.reference;
    await referReportID.update({
      'isRead': true,
    });
  }
}
