// MADE WITH ❤️ BY ADHA94 FOR HEZMEDIA
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iampro_client/entrypoint/entry_point_admin.dart';

class AddNewEngineer extends StatefulWidget {
  const AddNewEngineer({Key? key}) : super(key: key);

  @override
  State<AddNewEngineer> createState() => _AddNewEngineerState();
}

class _AddNewEngineerState extends State<AddNewEngineer> {
  final formKey = GlobalKey<FormState>();
  TextEditingController? textController1 = TextEditingController();
  TextEditingController? textController2 = TextEditingController();
  TextEditingController? textController3 = TextEditingController();
  TextEditingController? textController4 = TextEditingController();
  TextEditingController? textController5 = TextEditingController();
  TextEditingController? textController6 = TextEditingController();
  TextEditingController? textController7 = TextEditingController();
  TextEditingController? textController8 = TextEditingController();
  bool isCCTV = false;
  bool isCAS = false;
  bool isPMS = false;
  bool isSmartTV = false;
  bool isPABX = false;
  bool isBAS = false;
  bool isSmartHome = false;
  bool isAlarm = false;
  UserCredential? resultEngineer;
  User? engineer;
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
          'Add New Engineer',
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
                              .where('user_type', isEqualTo: 'Engineer')
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
                                  labelText: 'Engineer ID',
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
                            labelText: 'Engineer Name',
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
                        controller: textController4,
                        keyboardType: TextInputType.emailAddress,
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
                        controller: textController5,
                        keyboardType: TextInputType.text,
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
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.all(10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Location',
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
                        controller: textController8,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20, 10, 10, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          const Text(
                            'Specialties',
                            style: TextStyle(
                              fontFamily: 'Proxima Nova',
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Checkbox(
                                checkColor: Colors.white,
                                fillColor:
                                    MaterialStateProperty.all(Colors.blue),
                                value: isCCTV,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isCCTV = value!;
                                  });
                                },
                              ),
                              const Text('CCTV'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Checkbox(
                                checkColor: Colors.white,
                                fillColor:
                                    MaterialStateProperty.all(Colors.blue),
                                value: isCAS,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isCAS = value!;
                                  });
                                },
                              ),
                              const Text('CAS'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Checkbox(
                                checkColor: Colors.white,
                                fillColor:
                                    MaterialStateProperty.all(Colors.blue),
                                value: isPMS,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isPMS = value!;
                                  });
                                },
                              ),
                              const Text('PMS'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Checkbox(
                                checkColor: Colors.white,
                                fillColor:
                                    MaterialStateProperty.all(Colors.blue),
                                value: isSmartTV,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isSmartTV = value!;
                                  });
                                },
                              ),
                              const Text('Smart TV'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Checkbox(
                                checkColor: Colors.white,
                                fillColor:
                                    MaterialStateProperty.all(Colors.blue),
                                value: isPABX,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isPABX = value!;
                                  });
                                },
                              ),
                              const Text('PABX'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Checkbox(
                                checkColor: Colors.white,
                                fillColor:
                                    MaterialStateProperty.all(Colors.blue),
                                value: isBAS,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isBAS = value!;
                                  });
                                },
                              ),
                              const Text('BAS'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Checkbox(
                                checkColor: Colors.white,
                                fillColor:
                                    MaterialStateProperty.all(Colors.blue),
                                value: isSmartHome,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isSmartHome = value!;
                                  });
                                },
                              ),
                              const Text('Smart Home'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Checkbox(
                                checkColor: Colors.white,
                                fillColor:
                                    MaterialStateProperty.all(Colors.blue),
                                value: isAlarm,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isAlarm = value!;
                                  });
                                },
                              ),
                              const Text('Alarm'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.all(10),
                      child: ElevatedButton(
                        onPressed: () {
                          addNewEngineer().then((value) {
                            const snackBar = SnackBar(
                              content: Text(
                                  'The new engineer has been added successfully.'),
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
                        child: const Text('ADD NEW ENGINEER'),
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

  Future addNewEngineer() async {
    resultEngineer = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: textController4!.text.trim(),
        password: textController5!.text.trim());
    engineer = resultEngineer!.user;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(engineer!.uid)
        .set({
      'id': 'C$b',
      'user_name': textController2!.text,
      'display_name': textController3!.text,
      'position': textController7!.text,
      'contact': textController6!.text,
      'address': textController8!.text,
      'isCCTV': isCCTV,
      'isCAS': isCAS,
      'isPMS': isPMS,
      'isSMATV': isSmartTV,
      'isPABX': isPABX,
      'isBAS': isBAS,
      'isSmartHome': isSmartHome,
      'isAlarm': isAlarm,
      'cases_solved': 0,
      'cases_unsolved': 0,
      'user_type': 'Engineer',
      'status': true,
      'photo_url': null
    });
  }
}
