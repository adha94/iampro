// MADE WITH ❤️ BY ADHA94 FOR HEZMEDIA
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iampro_client/entrypoint/entry_point_admin.dart';

class AddNewManager extends StatefulWidget {
  const AddNewManager({Key? key}) : super(key: key);

  @override
  State<AddNewManager> createState() => _AddNewManagerState();
}

class _AddNewManagerState extends State<AddNewManager> {
  final formKey = GlobalKey<FormState>();
  TextEditingController? textController1 = TextEditingController();
  TextEditingController? textController2 = TextEditingController();
  TextEditingController? textController3 = TextEditingController();
  TextEditingController? textController4 = TextEditingController();
  TextEditingController? textController5 = TextEditingController();
  TextEditingController? textController6 = TextEditingController();
  TextEditingController? textController7 = TextEditingController();
  UserCredential? resultManager;
  User? manager;
  int a = 0;
  int b = 0;
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: const Color(0xFF0000FF),
        leadingWidth: 40,
        centerTitle: true,
        title: const Text(
          'Add New Manager',
          style: TextStyle(
            fontFamily: 'Proxima Nova',
            color: Color(0xFFFFFFFF),
          ),
        ),
      ),
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.all(10),
                      child: StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('users')
                              .where('user_type', isEqualTo: 'Manager')
                              .snapshots(),
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            a = snapshot.data!.size;
                            b = a + 1;
                            if (!snapshot.hasData) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            return TextFormField(
                              decoration: InputDecoration(
                                  labelText: 'Manager ID',
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blueAccent, width: 1),
                                  ),
                                  contentPadding: const EdgeInsets.all(10),
                                  fillColor: Colors.grey.shade300,
                                  filled: true),
                              style: const TextStyle(
                                fontFamily: 'Proxima Nova',
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                              readOnly: true,
                              initialValue: 'C$b',
                              textAlign: TextAlign.left,
                              //controller: textController1,
                            );
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.all(10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'User Name',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blueAccent, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 1),
                            ),
                            contentPadding: EdgeInsets.all(10),
                            fillColor: Colors.white,
                            filled: true),
                        style: const TextStyle(
                          fontFamily: 'Proxima Nova',
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),
                        //initialValue: loggedInUser.id,
                        textAlign: TextAlign.left,
                        controller: textController2,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.all(10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Manager Name',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blueAccent, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 1),
                            ),
                            contentPadding: EdgeInsets.all(10),
                            fillColor: Colors.white,
                            filled: true),
                        style: const TextStyle(
                          fontFamily: 'Proxima Nova',
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),

                        //initialValue: loggedInUser.id,
                        textAlign: TextAlign.left,
                        controller: textController3,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.all(10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Password',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blueAccent, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 1),
                            ),
                            contentPadding: EdgeInsets.all(10),
                            fillColor: Colors.white,
                            filled: true),
                        style: const TextStyle(
                          fontFamily: 'Proxima Nova',
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),
                        obscureText: true,
                        //initialValue: loggedInUser.id,
                        textAlign: TextAlign.left,
                        controller: textController4,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.all(10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'E-mail',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blueAccent, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 1),
                            ),
                            contentPadding: EdgeInsets.all(10),
                            fillColor: Colors.white,
                            filled: true),
                        style: const TextStyle(
                          fontFamily: 'Proxima Nova',
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),

                        //initialValue: loggedInUser.id,
                        textAlign: TextAlign.left,
                        controller: textController5,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.all(10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Contact No',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blueAccent, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 1),
                            ),
                            contentPadding: EdgeInsets.all(10),
                            fillColor: Colors.white,
                            filled: true),
                        style: const TextStyle(
                          fontFamily: 'Proxima Nova',
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),

                        //initialValue: loggedInUser.id,
                        textAlign: TextAlign.left,
                        controller: textController6,
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.all(10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Job Position',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blueAccent, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 1),
                            ),
                            contentPadding: EdgeInsets.all(10),
                            fillColor: Colors.white,
                            filled: true),
                        style: const TextStyle(
                          fontFamily: 'Proxima Nova',
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),

                        //initialValue: loggedInUser.id,
                        textAlign: TextAlign.left,
                        controller: textController7,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.all(10),
                      child: ElevatedButton(
                        onPressed: () {
                          addNewManager().then((value) {
                            const snackBar = SnackBar(
                              content: Text(
                                  'The new manager has been added successfully.'),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const EntryPointAdmin()));
                          });
                        },
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          minimumSize:
                              MaterialStateProperty.all(const Size(200, 40)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                          shadowColor:
                              MaterialStateProperty.all(Colors.blueAccent),
                        ),
                        child: const Text('ADD NEW MANAGER'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future addNewManager() async {
    resultManager = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: textController5!.text.trim(),
      password: textController4!.text.trim(),
    );
    manager = resultManager!.user;
    await FirebaseFirestore.instance.collection('users').doc(manager!.uid).set({
      'id': 'C$b',
      'user_name': textController2!.text,
      'display_name': textController3!.text,
      'position': textController7!.text,
      'contact': textController6!.text,
      'total_clients': 0,
      'cases_solved': 0,
      'cases_unsolved': 0,
      'user_type': 'Manager',
      'status': true,
      'photo_url': null
    });
  }
}
