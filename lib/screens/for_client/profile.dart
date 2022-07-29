// MADE WITH ❤️ BY ADHA94 FOR HEZMEDIA
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iampro_client/model/model_client.dart';
import 'package:iampro_client/screens/login.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController? textController1;
  TextEditingController? textController2;
  TextEditingController? textController3;
  TextEditingController? textController4;
  TextEditingController? textController5;
  TextEditingController? textController6;
  TextEditingController? textController7;
  TextEditingController? textController8;
  Client loggedInClient = Client();

  User? user = FirebaseAuth.instance.currentUser;
  final formKey = GlobalKey<FormState>();
  File? image;
  bool? isCCTV;
  bool? isCAS;
  bool? isPMS;
  bool? isSmartTV;
  bool? isPABX;
  bool? isBAS;
  bool? isSmartHome;
  bool? isAlarm;

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInClient = Client.fromMap(value.data());
      setState(() {
        textController1 = TextEditingController(text: loggedInClient.id);
        textController2 = TextEditingController(text: loggedInClient.userName);
        textController3 =
            TextEditingController(text: loggedInClient.displayName);
        textController4 = TextEditingController(text: loggedInClient.company);
        textController5 = TextEditingController(text: loggedInClient.position);
        textController6 = TextEditingController(text: loggedInClient.contact);

        textController7 =
            TextEditingController(text: loggedInClient.managerInCharge);
        textController8 =
            TextEditingController(text: loggedInClient.totalReports.toString());
        loggedInClient.isAlarm;
        loggedInClient.isCCTV;
        loggedInClient.isCAS;
        loggedInClient.isPMS;
        loggedInClient.isSmartTV;
        loggedInClient.isPABX;
        loggedInClient.isBAS;
        loggedInClient.isSmartHome;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        animationDuration: const Duration(),
        length: 2,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
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
            automaticallyImplyLeading: true,
            backgroundColor: const Color(0xFF0000FF),
            leadingWidth: 40,
            centerTitle: true,
            title: const Text(
              'User Profile',
              style: TextStyle(
                fontFamily: 'Proxima Nova',
                color: Color(0xFFFFFFFF),
              ),
            ),
            bottom: const TabBar(tabs: [
              Tab(
                text: 'Account Information',
              ),
              Tab(
                text: 'Subscribed Product',
              )
            ], indicatorColor: Colors.blue),
          ),
          body: TabBarView(
            children: [
              SingleChildScrollView(
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
                                          title: const Text(
                                              'Upload Profile Picture'),
                                          content: const Text(
                                              'Select source of image.'),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
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
                                          width: 200,
                                          height: 200,
                                          fit: BoxFit.cover)
                                      : Image.network(
                                          loggedInClient.photoURL.toString(),
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
                                    borderSide: BorderSide(
                                        color: Colors.blueAccent, width: 1),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blue, width: 1),
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
                                  labelText: 'Client Name',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blueAccent, width: 1),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blue, width: 1),
                                  ),
                                  contentPadding: EdgeInsets.all(10),
                                ),
                                style: const TextStyle(
                                  fontFamily: 'Proxima Nova',
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                ),
                                //initialValue: loggedInUser.address,
                                textAlign: TextAlign.left,
                                keyboardType: TextInputType.name,
                                textInputAction: TextInputAction.next,

                                controller: textController3,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.all(10),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Company',
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
                                readOnly: true,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.all(10),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Position',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blueAccent, width: 1),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blue, width: 1),
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
                                controller: textController5,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.all(10),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'Contact',
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
                                //initialValue: loggedInUser.managerID,
                                textAlign: TextAlign.left,
                                keyboardType: TextInputType.phone,
                                controller: textController6,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.all(10),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'Manager in Charge',
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
                                //initialValue: loggedInUser.managerInCharge,
                                textAlign: TextAlign.left,
                                readOnly: true,
                                controller: textController7,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.all(10),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'Total Reports',
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
                                //initialValue: loggedInUser.totalReports.toString(),
                                textAlign: TextAlign.left,
                                readOnly: true,
                                controller: textController8,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10, 20, 10, 8),
                              child: ElevatedButton(
                                onPressed: () {
                                  final docUser = FirebaseFirestore.instance
                                      .collection('users')
                                      .doc(user?.uid);
                                  docUser.update({
                                    'user_name': textController2!.text,
                                    'display_name': textController3!.text,
                                    'position': textController5!.text,
                                    'contact': textController6!.text,
                                    'photo_url': uploadFile(image),
                                  }).then((value) {
                                    uploadFile(image);
                                    return Fluttertoast.showToast(
                                        msg: 'Profile updated successfully.');
                                  });
                                },
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                  ),
                                  minimumSize: MaterialStateProperty.all(
                                      const Size(250, 40)),
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.blue),
                                  shadowColor: MaterialStateProperty.all(
                                      Colors.blueAccent),
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
                    const SizedBox(height: 20)
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text('Here are the devices you subscribe: '),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: GridView(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1,
                        ),
                        shrinkWrap: true,
                        children: [
                          Visibility(
                            visible:
                                (loggedInClient.isCCTV == true) ? true : false,
                            child: GridTile(
                              footer: const SizedBox(
                                height: 14,
                                child: GridTileBar(
                                  backgroundColor: Colors.white70,
                                  title: Center(
                                      child: Text('CCTV',
                                          style:
                                              TextStyle(color: Colors.black))),
                                ),
                              ),
                              child: Image.asset(
                                  'assets/images/cctv_no_border.png',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Visibility(
                            visible:
                                (loggedInClient.isCAS == true) ? true : false,
                            child: GridTile(
                              footer: const SizedBox(
                                height: 14,
                                child: GridTileBar(
                                  backgroundColor: Colors.white70,
                                  title: Center(
                                      child: Text('CAS',
                                          style:
                                              TextStyle(color: Colors.black))),
                                ),
                              ),
                              child: Image.asset(
                                  'assets/images/cas_no_border.png',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Visibility(
                            visible:
                                (loggedInClient.isPABX == true) ? true : false,
                            child: GridTile(
                              footer: const SizedBox(
                                height: 14,
                                child: GridTileBar(
                                  backgroundColor: Colors.white70,
                                  title: Center(
                                      child: Text('PABX',
                                          style:
                                              TextStyle(color: Colors.black))),
                                ),
                              ),
                              child: Image.asset(
                                  'assets/images/pabx_no_border.png',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Visibility(
                            visible:
                                (loggedInClient.isAlarm == true) ? true : false,
                            child: GridTile(
                              footer: const SizedBox(
                                height: 14,
                                child: GridTileBar(
                                  backgroundColor: Colors.white70,
                                  title: Center(
                                      child: Text('Alarm',
                                          style:
                                              TextStyle(color: Colors.black))),
                                ),
                              ),
                              child: Image.asset(
                                  'assets/images/alarm_no_border.png',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Visibility(
                            visible:
                                (loggedInClient.isBAS == true) ? true : false,
                            child: GridTile(
                              footer: const SizedBox(
                                height: 14,
                                child: GridTileBar(
                                  backgroundColor: Colors.white70,
                                  title: Center(
                                      child: Text('BAS',
                                          style:
                                              TextStyle(color: Colors.black))),
                                ),
                              ),
                              child: Image.asset(
                                  'assets/images/bas_no_border.png',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Visibility(
                            visible: (loggedInClient.isSmartTV == true)
                                ? true
                                : false,
                            child: GridTile(
                              footer: const SizedBox(
                                height: 14,
                                child: GridTileBar(
                                  backgroundColor: Colors.white70,
                                  title: Center(
                                      child: Text('Smart TV',
                                          style:
                                              TextStyle(color: Colors.black))),
                                ),
                              ),
                              child: Image.asset(
                                  'assets/images/smatv_no_border.png',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Visibility(
                            visible: (loggedInClient.isSmartHome == true)
                                ? true
                                : false,
                            child: GridTile(
                              footer: const SizedBox(
                                height: 14,
                                child: GridTileBar(
                                  backgroundColor: Colors.white70,
                                  title: Center(
                                      child: Text('Smart Home',
                                          style:
                                              TextStyle(color: Colors.black))),
                                ),
                              ),
                              child: Image.asset(
                                  'assets/images/smart_home_no_border.png',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Visibility(
                            visible:
                                (loggedInClient.isPMS == true) ? true : false,
                            child: GridTile(
                              footer: const SizedBox(
                                height: 14,
                                child: GridTileBar(
                                  backgroundColor: Colors.white70,
                                  title: Center(
                                      child: Text('PMS',
                                          style:
                                              TextStyle(color: Colors.black))),
                                ),
                              ),
                              child: Image.asset(
                                  'assets/images/pms_no_border.png',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
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
