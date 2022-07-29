// MADE WITH ❤️ BY ADHA94 FOR HEZMEDIA
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EngineersDetails extends StatefulWidget {
  const EngineersDetails(this.firestoreDocID, {Key? key}) : super(key: key);
  final String firestoreDocID;

  @override
  State<EngineersDetails> createState() => _EngineersDetailsState();
}

class _EngineersDetailsState extends State<EngineersDetails> {
  @override
  void initState() {
    super.initState();
  }

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
            'Engineers Details',
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
                    .where('id', isEqualTo: widget.firestoreDocID)
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: ((context, index) {
                        DocumentSnapshot ds = snapshot.data!.docs[index];
                        if (ds['status'] == true) {
                          availability = 'AVAILABLE';
                        } else if (ds['status'] == false) {
                          availability = 'ON DUTY';
                        }
                        return Column(children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Engineer ID',
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
                                  'Engineer Name',
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
                                  'Contact No',
                                  style: TextStyle(
                                    fontFamily: 'Proxima Nova',
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  ds['contact'] ?? 'Not specified.',
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
                                  'E-mail',
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
                                  'Location',
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
                              children: const [
                                Text(
                                  'Current Case',
                                  style: TextStyle(
                                    fontFamily: 'Proxima Nova',
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  '#19',
                                  style: TextStyle(
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
                                  'Total Cases Solved',
                                  style: TextStyle(
                                    fontFamily: 'Proxima Nova',
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    ds['cases_solved'].toString(),
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
                                  'Total Cases Unsolved',
                                  style: TextStyle(
                                    fontFamily: 'Proxima Nova',
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  ds['cases_unsolved'].toString(),
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
                                  'Availability',
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
                          Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  padding: const EdgeInsets.all(30)),
                              onPressed: null,
                              child: const Icon(
                                Icons.phone,
                                size: 50,
                              ),
                            ),
                          ),
                        ]);
                      }));
                })));
  }
}
