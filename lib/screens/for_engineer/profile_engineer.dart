// MADE WITH ❤️ BY ADHA94 FOR HEZMEDIA
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iampro_client/model/device_icon.dart';
import 'package:iampro_client/model/model_engineer.dart';
import 'package:iampro_client/screens/login.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class ProfileEngineer extends StatefulWidget {
  const ProfileEngineer({Key? key}) : super(key: key);

  @override
  State<ProfileEngineer> createState() => _ProfileEngineerState();
}

class _ProfileEngineerState extends State<ProfileEngineer> {
  final formKey = GlobalKey<FormState>();
  TextEditingController? textController1;
  TextEditingController? textController2;
  TextEditingController? textController3;
  TextEditingController? textController4;
  TextEditingController? textController5;
  TextEditingController? textController6;
  TextEditingController? textController7;
  TextEditingController? textController8;
  Engineer loggedInEngineer = Engineer();
  User? user = FirebaseAuth.instance.currentUser;
  File? image;
  DeviceIcon deviceIcon = DeviceIcon();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInEngineer = Engineer.fromMap(value.data());
      setState(() {
        textController1 = TextEditingController(text: loggedInEngineer.id);
        textController2 =
            TextEditingController(text: loggedInEngineer.userName);
        textController3 =
            TextEditingController(text: loggedInEngineer.displayName);
        textController4 =
            TextEditingController(text: loggedInEngineer.position);
        textController5 = TextEditingController(text: loggedInEngineer.contact);

        textController6 = TextEditingController(text: loggedInEngineer.address);
        textController7 = TextEditingController(
            text: loggedInEngineer.casesSolved.toString());
        textController8 = TextEditingController(
            text: loggedInEngineer.casesUnsolved.toString());
        loggedInEngineer.isAlarm;
        loggedInEngineer.isCCTV;
        loggedInEngineer.isCAS;
        loggedInEngineer.isPMS;
        loggedInEngineer.isSmartTV;
        loggedInEngineer.isPABX;
        loggedInEngineer.isBAS;
        loggedInEngineer.isSmartHome;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF0000FF),
        leadingWidth: 40,
        centerTitle: true,
        title: const Text(
          'Engineer Profile',
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Upload Profile Picture'),
                                  content:
                                      const Text('Select source of image.'),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        pickImage(ImageSource.camera);
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Camera'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        pickImage(ImageSource.gallery);
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Gallery'),
                                    ),
                                  ],
                                );
                              });
                        },
                        child: Center(
                          child: image != null
                              ? Image.file(image!,
                                  width: 200, height: 200, fit: BoxFit.cover)
                              : Image.network(
                                  loggedInEngineer.photoURL.toString(),
                                  width: 200,
                                  height: 200,
                                  fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.all(10),
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Engineer ID',
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blueAccent, width: 1),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 1),
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
                        //initialValue: loggedInUser.id,
                        textAlign: TextAlign.left,
                        controller: textController1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.all(10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'User Name',
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blueAccent, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1),
                          ),
                          contentPadding: EdgeInsets.all(10),
                        ),
                        style: const TextStyle(
                          fontFamily: 'Proxima Nova',
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),
                        //initialValue: loggedInUser.fullName,
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        controller: textController2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.all(10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Engineer Name',
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blueAccent, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1),
                          ),
                          contentPadding: EdgeInsets.all(10),
                        ),
                        style: const TextStyle(
                          fontFamily: 'Proxima Nova',
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),
                        //initialValue: 'Pavilion Residences',
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,

                        controller: textController3,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.all(10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Position',
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blueAccent, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1),
                          ),
                          contentPadding: EdgeInsets.all(10),
                        ),
                        style: const TextStyle(
                          fontFamily: 'Proxima Nova',
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),
                        //initialValue: loggedInUser.contact,
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        controller: textController4,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.all(10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Contact',
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blueAccent, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1),
                          ),
                          contentPadding: EdgeInsets.all(10),
                        ),
                        style: const TextStyle(
                          fontFamily: 'Proxima Nova',
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),
                        //initialValue: loggedInUser.email,
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        controller: textController5,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.all(10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Address',
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
                        //initialValue: '3',
                        textAlign: TextAlign.left,
                        maxLines: 5,
                        keyboardType: TextInputType.streetAddress,
                        textInputAction: TextInputAction.done,
                        controller: textController6,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.all(10),
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Total Cases Solved',
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blueAccent, width: 1),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 1),
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
                        //initialValue: '6',
                        textAlign: TextAlign.left,
                        readOnly: true,
                        controller: textController7,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.all(10),
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Total Cases Unsolved',
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blueAccent, width: 1),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 1),
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
                        //initialValue: '6',
                        textAlign: TextAlign.left,
                        readOnly: true,
                        controller: textController8,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Specialties',
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
                                      visible: (loggedInEngineer.isCCTV == true)
                                          ? true
                                          : false,
                                      child: Image.asset(
                                        DeviceIcon.cctvIcon,
                                        width: 30,
                                        height: 30,
                                      )),
                                  Visibility(
                                      visible: (loggedInEngineer.isCAS == true)
                                          ? true
                                          : false,
                                      child: Image.asset(
                                        DeviceIcon.casIcon,
                                        width: 30,
                                        height: 30,
                                      )),
                                  Visibility(
                                      visible: (loggedInEngineer.isPMS == true)
                                          ? true
                                          : false,
                                      child: Image.asset(
                                        DeviceIcon.pmsIcon,
                                        width: 30,
                                        height: 30,
                                      )),
                                  Visibility(
                                      visible:
                                          (loggedInEngineer.isSmartTV == true)
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
                                      visible: (loggedInEngineer.isPABX == true)
                                          ? true
                                          : false,
                                      child: Image.asset(
                                        DeviceIcon.pabxIcon,
                                        width: 30,
                                        height: 30,
                                      )),
                                  Visibility(
                                      visible: (loggedInEngineer.isBAS == true)
                                          ? true
                                          : false,
                                      child: Image.asset(
                                        DeviceIcon.basIcon,
                                        width: 30,
                                        height: 30,
                                      )),
                                  Visibility(
                                      visible:
                                          (loggedInEngineer.isSmartHome == true)
                                              ? true
                                              : false,
                                      child: Image.asset(
                                        DeviceIcon.smartHomeIcon,
                                        width: 30,
                                        height: 30,
                                      )),
                                  Visibility(
                                      visible:
                                          (loggedInEngineer.isAlarm == true)
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
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10, 20, 10, 8),
                      child: ElevatedButton(
                        onPressed: () {
                          final docUser = FirebaseFirestore.instance
                              .collection('users')
                              .doc(user?.uid);
                          docUser.update({
                            'user_name': textController2!.text,
                            'display_name': textController3!.text,
                            'position': textController4!.text,
                            'contact': textController5!.text,
                            'address': textController6!.text,
                          }).then((value) {
                            uploadFile(image);
                            return Fluttertoast.showToast(
                                msg: 'Profile updated successfully.');
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
                              MaterialStateProperty.all(const Size(250, 40)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                          shadowColor:
                              MaterialStateProperty.all(Colors.blueAccent),
                        ),
                        child: const Text('Update Profile',
                            style: TextStyle(
                                fontFamily: 'Proxima Nova',
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 14)),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    if (!mounted) return;
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const LoginPage(title: 'Login')));
  }

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      Fluttertoast.showToast(msg: 'Failed to pick image: $e');
    }
  }

  Future uploadFile(File? image) async {
    if (image == null) return;
    final fileName = basename(image.path);
    final destination = 'users/$fileName';
    try {
      final ref = firebase_storage.FirebaseStorage.instance
          .ref(destination)
          .child('file/');
      firebase_storage.TaskSnapshot download = await ref.putFile(image);
      String url = await download.ref.getDownloadURL();
      final docUser =
          FirebaseFirestore.instance.collection('users').doc(user?.uid);
      docUser.update({'photo_url': url});
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}
