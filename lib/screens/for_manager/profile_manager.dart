// MADE WITH ❤️ BY ADHA94 FOR HEZMEDIA
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iampro_client/model/model_manager.dart';
import 'package:iampro_client/screens/for_manager/clients_list.dart';
import 'package:iampro_client/screens/login.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class ProfileManager extends StatefulWidget {
  const ProfileManager({Key? key}) : super(key: key);

  @override
  State<ProfileManager> createState() => _ProfileManagerState();
}

class _ProfileManagerState extends State<ProfileManager> {
  final formKey = GlobalKey<FormState>();
  TextEditingController? textController1;
  TextEditingController? textController2;
  TextEditingController? textController3;
  TextEditingController? textController4;
  TextEditingController? textController5;
  TextEditingController? textController6;
  TextEditingController? textController7;
  TextEditingController? textController8;
  Manager loggedInManager = Manager();
  User? user = FirebaseAuth.instance.currentUser;
  File? image;

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInManager = Manager.fromMap(value.data());
      setState(() {
        textController1 = TextEditingController(text: loggedInManager.id);
        textController2 = TextEditingController(text: loggedInManager.userName);
        textController3 =
            TextEditingController(text: loggedInManager.displayName);
        textController4 = TextEditingController(text: loggedInManager.position);
        textController5 = TextEditingController(text: loggedInManager.contact);
        textController6 = TextEditingController(
            text: loggedInManager.totalClients.toString());
        textController7 =
            TextEditingController(text: loggedInManager.casesSolved.toString());
        textController8 = TextEditingController(
            text: loggedInManager.casesUnsolved.toString());
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
          'Manager Profile',
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
                                  loggedInManager.photoURL.toString(),
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
                            labelText: 'Manager ID',
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
                          labelText: 'Display Name',
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
                        // maxLines: 5,
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
                        textInputAction: TextInputAction.done,
                        controller: textController5,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.all(10),
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Total Clients',
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
                        //initialValue: '5',
                        textAlign: TextAlign.left,
                        readOnly: true,
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
                        //initialValue: '2',
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
                        // initialValue: '6',
                        textAlign: TextAlign.left,
                        readOnly: true,
                        controller: textController8,
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
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10, 20, 10, 8),
                      child: ElevatedButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ClientsList())),
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
                        child: const Text('Clients List',
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
