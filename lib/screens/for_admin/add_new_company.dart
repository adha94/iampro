// MADE WITH ❤️ BY ADHA94 FOR HEZMEDIA
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

import 'package:iampro_client/entrypoint/entry_point_admin.dart';

class AddNewCompany extends StatefulWidget {
  const AddNewCompany({Key? key}) : super(key: key);

  @override
  State<AddNewCompany> createState() => _AddNewCompanyState();
}

class _AddNewCompanyState extends State<AddNewCompany> {
  File? image;
  final formKey = GlobalKey<FormState>();
  TextEditingController? textController1 = TextEditingController();
  TextEditingController? textController2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: const Color(0xFF0000FF),
        leadingWidth: 40,
        centerTitle: true,
        title: const Text(
          'Add New Company',
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
                      child: GestureDetector(
                        child: Center(
                          child: image != null
                              ? Image.file(image!,
                                  width: 300,
                                  height: 100,
                                  fit: BoxFit.scaleDown)
                              : Image.asset(
                                  'assets/images/placeholder-image.png',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover),
                        ),
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Uploading Proof of Work'),
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
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.all(10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Company Name',
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
                        textAlign: TextAlign.left,
                        controller: textController1,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.all(10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Company Address',
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
                        textAlign: TextAlign.left,
                        controller: textController2,
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.done,
                        maxLines: 5,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsetsDirectional.all(10),
                        child: OutlinedButton(
                          onPressed: () {
                            addNewCompany(textController1!.text,
                                textController2!.text, image!);
                            const snackBar = SnackBar(
                              content: Text(
                                  'The new company has been added successfully.'),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const EntryPointAdmin()));
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
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
                          child: const Text('Add New Company',
                              style: TextStyle(color: Colors.white)),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
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

  void addNewCompany(
      String companyName, companyAddress, File companyLogo) async {
    await FirebaseFirestore.instance.collection('company').add({
      'name': companyName,
      'address': companyAddress,
    }).then((value) async {
      final fileName = basename(companyLogo.path);
      final destination = 'company/$fileName';
      try {
        final ref = firebase_storage.FirebaseStorage.instance
            .ref(destination)
            .child('file/');
        firebase_storage.TaskSnapshot download = await ref.putFile(companyLogo);
        String url = await download.ref.getDownloadURL();
        QuerySnapshot getCompanyID = await FirebaseFirestore.instance
            .collection('company')
            .where('address', isEqualTo: companyAddress)
            .where('name', isEqualTo: companyName)
            .get();
        QueryDocumentSnapshot queryCompanyID = getCompanyID.docs[0];
        DocumentReference referCompanyID = queryCompanyID.reference;
        await referCompanyID.update({'logo': url});
      } catch (e) {
        Fluttertoast.showToast(
            msg:
                'Error while adding company details. ERROR DETAILS: ${e.toString()}');
      }
    });
  }
}
