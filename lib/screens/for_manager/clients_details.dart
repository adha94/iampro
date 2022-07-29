// MADE WITH ❤️ BY ADHA94 FOR HEZMEDIA
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iampro_client/model/device_icon.dart';

class ClientsDetails extends StatelessWidget {
  const ClientsDetails(this.firestoreDocID, {Key? key}) : super(key: key);
  final String firestoreDocID;

  @override
  Widget build(BuildContext context) {
    String? availability;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: const Color(0xFF0000FF),
        leadingWidth: 40,
        centerTitle: true,
        title: const Text(
          'Clients Details',
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
                .collection('users')
                .where('id', isEqualTo: firestoreDocID)
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: ((context, index) {
                    DocumentSnapshot ds = snapshot.data!.docs[index];
                    if (ds['status'] == true) {
                      availability = 'AVAILABLE';
                    } else if (ds['status'] == false) {
                      availability = 'SUSPENDED';
                    }
                    return Column(children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Client ID',
                              style: TextStyle(
                                fontFamily: 'Proxima Nova',
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              ds['id'],
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
                              'Client Name',
                              style: TextStyle(
                                fontFamily: 'Proxima Nova',
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              ds['display_name'],
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
                              'Position',
                              style: TextStyle(
                                fontFamily: 'Proxima Nova',
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              ds['position'] ?? 'Not specified.',
                              textAlign: TextAlign.end,
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
                              'Contact No',
                              style: TextStyle(
                                fontFamily: 'Proxima Nova',
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                ds['contact'] ?? 'Not specified',
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
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Email',
                              style: TextStyle(
                                fontFamily: 'Proxima Nova',
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                ds['email'] ?? 'Not specified',
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
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Address',
                              style: TextStyle(
                                fontFamily: 'Proxima Nova',
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                ds['address'] ?? 'Not specified',
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
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Subscribed Products',
                              style: TextStyle(
                                fontFamily: 'Proxima Nova',
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Visibility(
                                        visible: (ds['isCCTV'] == true)
                                            ? true
                                            : false,
                                        child: Image.asset(
                                          DeviceIcon.cctvIcon,
                                          width: 30,
                                          height: 30,
                                        )),
                                    Visibility(
                                        visible: (ds['isCAS'] == true)
                                            ? true
                                            : false,
                                        child: Image.asset(
                                          DeviceIcon.casIcon,
                                          width: 30,
                                          height: 30,
                                        )),
                                    Visibility(
                                        visible: (ds['isPMS'] == true)
                                            ? true
                                            : false,
                                        child: Image.asset(
                                          DeviceIcon.pmsIcon,
                                          width: 30,
                                          height: 30,
                                        )),
                                    Visibility(
                                        visible: (ds['isSmartTV'] == true)
                                            ? true
                                            : false,
                                        child: Image.asset(
                                          DeviceIcon.smartTVIcon,
                                          width: 30,
                                          height: 30,
                                        )),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Visibility(
                                        visible: (ds['isPABX'] == true)
                                            ? true
                                            : false,
                                        child: Image.asset(
                                          DeviceIcon.pabxIcon,
                                          width: 30,
                                          height: 30,
                                        )),
                                    Visibility(
                                        visible: (ds['isBAS'] == true)
                                            ? true
                                            : false,
                                        child: Image.asset(
                                          DeviceIcon.basIcon,
                                          width: 30,
                                          height: 30,
                                        )),
                                    Visibility(
                                        visible: (ds['isSmartHome'] == true)
                                            ? true
                                            : false,
                                        child: Image.asset(
                                          DeviceIcon.smartHomeIcon,
                                          width: 30,
                                          height: 30,
                                        )),
                                    Visibility(
                                        visible: (ds['isAlarm'] == true)
                                            ? true
                                            : false,
                                        child: Image.asset(
                                          DeviceIcon.alarmIcon,
                                          width: 30,
                                          height: 30,
                                        )),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      /*         Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Device ID',
                              style: TextStyle(
                                fontFamily: 'Proxima Nova',
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                            ),
                            Column(
                              children: const [
                                Text(
                                  '56789HGU890Y',
                                  style: TextStyle(
                                    fontFamily: 'Proxima Nova',
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  '90210BEVHIGH',
                                  style: TextStyle(
                                    fontFamily: 'Proxima Nova',
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),      */
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total Reports',
                              style: TextStyle(
                                fontFamily: 'Proxima Nova',
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                ds['total_reports'].toString(),
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
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Account Status',
                              style: TextStyle(
                                fontFamily: 'Proxima Nova',
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                availability.toString(),
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
                      ),
                      const SizedBox(height: 10),
                    ]);
                  }));
            }),
      ),
    );
  }
}
