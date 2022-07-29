// MADE WITH ❤️ BY ADHA94 FOR HEZMEDIA
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iampro_client/screens/for_admin/add_new_client.dart';
import 'package:iampro_client/screens/for_admin/add_new_engineer.dart';
import 'package:iampro_client/screens/for_admin/add_new_manager.dart';
import 'package:iampro_client/screens/login.dart';

class ViewUsers extends StatefulWidget {
  const ViewUsers({Key? key}) : super(key: key);

  @override
  State<ViewUsers> createState() => _ViewUsersState();
}

class _ViewUsersState extends State<ViewUsers> with TickerProviderStateMixin {
  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'CLIENT'),
    Tab(text: 'MANAGER'),
    Tab(text: 'ENGINEER'),
  ];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);

    _tabController.addListener(() {
      setState(() {
        if (_tabController.index == 0) {
          currentText = 'Add New Client';
        } else if (_tabController.index == 1) {
          currentText = 'Add New Manager';
        } else if (_tabController.index == 2) {
          currentText = 'Add New Engineer';
        }
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  String currentText = 'Add New Client';

  @override
  Widget build(BuildContext context) {
    String status = "";
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
          'List of Users',
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
        bottom: TabBar(
          controller: _tabController,
          tabs: myTabs,
        ),
      ),
      body: TabBarView(controller: _tabController, children: [
        SingleChildScrollView(
          child: Column(
            children: [
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .where('user_type', isEqualTo: 'Client')
                      //.orderBy('company', descending: false)
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
                        itemBuilder: ((context, index) {
                          DocumentSnapshot ds = snapshot.data!.docs[index];
                          if (ds['status'] == true) {
                            status = 'ACTIVE';
                          } else if (ds['status'] == false) {
                            status = 'SUSPENDED';
                          }
                          return Material(
                              child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                            child: GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: null,
                              child: Card(
                                borderOnForeground: true,
                                shadowColor: Colors.grey,
                                elevation: 2,
                                margin: const EdgeInsets.all(5),
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
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
                                            Text(
                                              ds['id'] +
                                                  ' - ' +
                                                  ds['display_name'],
                                              style: const TextStyle(
                                                  fontFamily: 'Proxima Nova',
                                                  color: Color(0xFF091249),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                            ),
                                            const SizedBox(height: 2),
                                            Text(
                                              ds['position'],
                                              style: const TextStyle(
                                                  fontFamily: 'Proxima Nova',
                                                  color: Color(0xFF091249),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                            ),
                                            const SizedBox(height: 2),
                                            Text(
                                              ds['company'],
                                              style: const TextStyle(
                                                  fontFamily: 'Proxima Nova',
                                                  color: Color(0xFF091249),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                            ),
                                            const SizedBox(height: 2),
                                            Text(
                                              status,
                                              style: const TextStyle(
                                                  fontFamily: 'Proxima Nova',
                                                  color: Color(0xFF091249),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                            ),
                                            const SizedBox(height: 2),
                                          ],
                                        )
                                      ]),
                                ),
                              ),
                            ),
                          ));
                        }));
                  }),
            ],
          ),
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .where('user_type', isEqualTo: 'Manager')
                      //.orderBy('company', descending: false)
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
                        itemBuilder: ((context, index) {
                          DocumentSnapshot ds = snapshot.data!.docs[index];
                          if (ds['status'] == true) {
                            status = 'ACTIVE';
                          } else if (ds['status'] == false) {
                            status = 'SUSPENDED';
                          }
                          return Material(
                              child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                            child: GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: null,
                              child: Card(
                                borderOnForeground: true,
                                shadowColor: Colors.grey,
                                elevation: 2,
                                margin: const EdgeInsets.all(5),
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
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
                                            Text(
                                              ds['id'] +
                                                  ' - ' +
                                                  ds['display_name'],
                                              style: const TextStyle(
                                                  fontFamily: 'Proxima Nova',
                                                  color: Color(0xFF091249),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                            ),
                                            const SizedBox(height: 2),
                                            Text(
                                              ds['position'],
                                              style: const TextStyle(
                                                  fontFamily: 'Proxima Nova',
                                                  color: Color(0xFF091249),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                            ),
                                            const SizedBox(height: 2),
                                            Text(
                                              ds['company'],
                                              style: const TextStyle(
                                                  fontFamily: 'Proxima Nova',
                                                  color: Color(0xFF091249),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                            ),
                                            const SizedBox(height: 2),
                                            Text(
                                              status,
                                              style: const TextStyle(
                                                  fontFamily: 'Proxima Nova',
                                                  color: Color(0xFF091249),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                            ),
                                            const SizedBox(height: 2),
                                          ],
                                        )
                                      ]),
                                ),
                              ),
                            ),
                          ));
                        }));
                  }),
            ],
          ),
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .where('user_type', isEqualTo: 'Engineer')
                      //.orderBy('company', descending: false)
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
                        itemBuilder: ((context, index) {
                          DocumentSnapshot ds = snapshot.data!.docs[index];
                          if (ds['status'] == true) {
                            status = 'ACTIVE';
                          } else if (ds['status'] == false) {
                            status = 'SUSPENDED';
                          }
                          return Material(
                              child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                            child: GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: null,
                              child: Card(
                                borderOnForeground: true,
                                shadowColor: Colors.grey,
                                elevation: 2,
                                margin: const EdgeInsets.all(5),
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
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
                                            Text(
                                              ds['id'] +
                                                  ' - ' +
                                                  ds['display_name'],
                                              style: const TextStyle(
                                                  fontFamily: 'Proxima Nova',
                                                  color: Color(0xFF091249),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                            ),
                                            const SizedBox(height: 2),
                                            Text(
                                              ds['position'],
                                              style: const TextStyle(
                                                  fontFamily: 'Proxima Nova',
                                                  color: Color(0xFF091249),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                            ),
                                            const SizedBox(height: 2),
                                            Text(
                                              ds['company'],
                                              style: const TextStyle(
                                                  fontFamily: 'Proxima Nova',
                                                  color: Color(0xFF091249),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                            ),
                                            const SizedBox(height: 2),
                                            Text(
                                              status,
                                              style: const TextStyle(
                                                  fontFamily: 'Proxima Nova',
                                                  color: Color(0xFF091249),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                            ),
                                            const SizedBox(height: 2),
                                          ],
                                        )
                                      ]),
                                ),
                              ),
                            ),
                          ));
                        }));
                  }),
            ],
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (_tabController.index == 0) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddNewClient()));
          } else if (_tabController.index == 1) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddNewManager()));
          } else if (_tabController.index == 2) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AddNewEngineer()));
          }
        },
        label: Text(currentText.toString()),
        icon: const Icon(Icons.add),
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
