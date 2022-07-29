// MADE WITH ❤️ BY ADHA94 FOR HEZMEDIA
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iampro_client/screens/for_manager/clients_details.dart';

class ClientsList extends StatefulWidget {
  const ClientsList({Key? key}) : super(key: key);

  @override
  State<ClientsList> createState() => _ClientsListState();
}

class _ClientsListState extends State<ClientsList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String availability = "";
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: const Color(0xFF0000FF),
          leadingWidth: 40,
          centerTitle: true,
          title: const Text(
            'Clients List',
            style: TextStyle(
              fontFamily: 'Proxima Nova',
              color: Color(0xFFFFFFFF),
            ),
          ),
        ),
        backgroundColor: const Color(0xFFFFFFFF),
        body: SafeArea(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
          Expanded(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .where('user_type', isEqualTo: 'Client')
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
                          if (documentSnapshot['status'] == true) {
                            availability = 'AVAILABLE';
                          } else if (documentSnapshot['status'] == false) {
                            availability = 'SUSPENDED';
                          }
                          return Material(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                              child: GestureDetector(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ClientsDetails(
                                            documentSnapshot['id']))),
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
                                          const SizedBox(width: 30),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            textDirection: TextDirection.ltr,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                ('Client ${documentSnapshot['id']}'),
                                                style: const TextStyle(
                                                    fontFamily: 'Proxima Nova',
                                                    color: Color(0xFF091249),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14),
                                              ),
                                              const SizedBox(height: 2),
                                              Text(
                                                documentSnapshot[
                                                    'display_name'],
                                                style: const TextStyle(
                                                    fontFamily: 'Proxima Nova',
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12),
                                              ),
                                              const SizedBox(height: 2),
                                              Text(
                                                documentSnapshot['position'],
                                                style: const TextStyle(
                                                    fontFamily: 'Proxima Nova',
                                                    color: Colors.blue,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12),
                                              ),
                                              const SizedBox(height: 2),
                                              Text(
                                                availability,
                                                style: const TextStyle(
                                                    fontFamily: 'Proxima Nova',
                                                    color: Colors.green,
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
}
