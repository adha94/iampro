// MADE WITH ❤️ BY ADHA94 FOR HEZMEDIA
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iampro_client/screens/for_manager/engineers_details.dart';
import 'package:iampro_client/screens/login.dart';

class EngineersList extends StatefulWidget {
  const EngineersList({Key? key}) : super(key: key);

  @override
  State<EngineersList> createState() => _EngineersListState();
}

class _EngineersListState extends State<EngineersList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String availability = "";
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xFF0000FF),
          leadingWidth: 40,
          centerTitle: true,
          title: const Text(
            'Engineers List',
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
            child: Column(mainAxisSize: MainAxisSize.min, children: [
          Expanded(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .where('user_type', isEqualTo: 'Engineer')
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
                            availability = 'ON DUTY';
                          }
                          return Material(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                              child: GestureDetector(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EngineersDetails(
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
                                                ('Engineer ${documentSnapshot['id']}'),
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

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    if (!mounted) return;
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const LoginPage(title: 'Login')));
  }
}
