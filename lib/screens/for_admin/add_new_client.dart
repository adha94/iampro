// MADE WITH ❤️ BY ADHA94 FOR HEZMEDIA
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iampro_client/entrypoint/entry_point_admin.dart';

class AddNewClient extends StatefulWidget {
  const AddNewClient({Key? key}) : super(key: key);

  @override
  State<AddNewClient> createState() => _AddNewClientState();
}

class _AddNewClientState extends State<AddNewClient> {
  final formKey = GlobalKey<FormState>();
  TextEditingController? textController1 = TextEditingController();
  TextEditingController? textController2 = TextEditingController();
  TextEditingController? textController3 = TextEditingController();
  TextEditingController? textController4 = TextEditingController();
  TextEditingController? textController5 = TextEditingController();
  TextEditingController? textController6 = TextEditingController();
  TextEditingController? textController7 = TextEditingController();
  bool isCCTV = false;
  bool isCAS = false;
  bool isPMS = false;
  bool isSmartTV = false;
  bool isPABX = false;
  bool isBAS = false;
  bool isSmartHome = false;
  bool isAlarm = false;
  int a = 0;
  int b = 0;
  String? companyName;
  String? companyAddress;
  String? companyLogo;

  String? dropDownValue, dropDownValue2;
  UserCredential? resultClient;
  User? client;
  QuerySnapshot? queryCompany;
  QueryDocumentSnapshot? queryDocumentCompany;
  DocumentReference? companyReference;

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
          'Add New Client',
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
                              .where('user_type', isEqualTo: 'Client')
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
                                  labelText: 'Client ID',
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blueAccent, width: 1),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blue, width: 1),
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
                            labelText: 'Client Name',
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
                      child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('company')
                            .snapshots(),
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                                value: ds['name'],
                                child: Text('${ds['name']}',
                                    style: const TextStyle(
                                        fontFamily: 'Proxima Nova',
                                        color: Color(0xFF091249),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14)),
                              );
                            }).toList(),
                            elevation: 8,
                            hint: const Text('Company'),
                          );
                        },
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
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20, 10, 10, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          const Text(
                            'Subscribed Products',
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
                      child: StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('users')
                              .where('user_type', isEqualTo: 'Manager')
                              .snapshots(),
                          builder: (context,
                              AsyncSnapshot<QuerySnapshot> snapshot2) {
                            if (!snapshot2.hasData) {
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
                              value: dropDownValue2,
                              onChanged: (String? value2) {
                                setState(() {
                                  dropDownValue2 = value2;
                                });
                              },
                              items: snapshot2.data!.docs.map((ds2) {
                                return DropdownMenuItem<String>(
                                  value: ds2['display_name'],
                                  child: Text(
                                    ('${ds2['id']} - ${ds2['display_name']}'),
                                    style: const TextStyle(
                                        fontFamily: 'Proxima Nova',
                                        color: Color(0xFF091249),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                );
                              }).toList(),
                              elevation: 8,
                              hint: const Text('Manager-in-Charge'),
                            );
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.all(10),
                      child: ElevatedButton(
                        onPressed: () async {
                          queryCompany = await FirebaseFirestore.instance
                              .collection('company')
                              .where('name',
                                  isEqualTo: dropDownValue.toString())
                              .get();
                          queryDocumentCompany = queryCompany!.docs[0];
                          companyReference = queryDocumentCompany!.reference;
                          await companyReference!.get().then((value) {
                            companyName = value['name'];
                            companyAddress = value['address'];
                            companyLogo = value['logo'];
                          });
                          addNewClient().then((value) {
                            const snackBar = SnackBar(
                              content: Text(
                                  'The new client has been added successfully.'),
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
                        child: const Text('ADD NEW CLIENT'),
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

  Future addNewClient() async {
    resultClient = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: textController4!.text.trim(),
        password: textController5!.text.trim());
    client = resultClient!.user;
    await FirebaseFirestore.instance.collection('users').doc(client!.uid).set({
      'id': 'C$b',
      'user_name': textController2!.text,
      'display_name': textController3!.text,
      'company': companyName,
      'company_logo': companyLogo,
      'address': companyAddress,
      'position': textController7!.text,
      'contact': textController6!.text,
      'isCCTV': isCCTV,
      'isCAS': isCAS,
      'isPMS': isPMS,
      'isSMATV': isSmartTV,
      'isPABX': isPABX,
      'isBAS': isBAS,
      'isSmartHome': isSmartHome,
      'isAlarm': isAlarm,
      'manager_in_charge': dropDownValue2.toString(),
      'total_reports': 0,
      'user_type': 'Client',
      'status': true,
      'photo_url': null
    }).then((value) {
      return null;
    });
  }
}
