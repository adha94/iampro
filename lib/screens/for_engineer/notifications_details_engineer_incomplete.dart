// MADE WITH ❤️ BY ADHA94 FOR HEZMEDIA
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class NotificationsEngineerIncomplete extends StatefulWidget {
  const NotificationsEngineerIncomplete(this.firestoreDocID, {Key? key})
      : super(key: key);
  final int firestoreDocID;

  @override
  State<NotificationsEngineerIncomplete> createState() =>
      _NotificationsEngineerIncompleteState();
}

class _NotificationsEngineerIncompleteState
    extends State<NotificationsEngineerIncomplete> {
  TextEditingController? engineerComments;
  File? image;
  firebase_storage.UploadTask? uploadTask;
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  String formattedDate = DateFormat.yMMMEd().format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: const Color(0xFF0000FF),
        leadingWidth: 40,
        centerTitle: true,
        title: const Text(
          'Notifications Details - Incomplete',
          style: TextStyle(
            fontFamily: 'Proxima Nova',
            color: Color(0xFFFFFFFF),
          ),
        ),
      ),
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('report')
                .where('report_id', isEqualTo: widget.firestoreDocID)
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                  itemCount: 1,
                  itemBuilder: ((context, index) {
                    DocumentSnapshot ds = snapshot.data!.docs[index];
                    return Column(children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                        child: Card(
                          shadowColor: Colors.grey,
                          elevation: 2,
                          margin: const EdgeInsets.all(5),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                const Center(child: Text('CLIENT')),
                                const SizedBox(height: 10),
                                Row(children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.grey.shade300,
                                    backgroundImage: ds['company_logo'] != null
                                        ? NetworkImage(ds['company_logo'])
                                        : const NetworkImage(
                                            'https://startupjobs.asia/assets/d63988b5/ac4a7810/images/default/company-logo-placeholder.png'),
                                    radius: 50,
                                  ),
                                  const SizedBox(width: 50),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        ds['client_id'] ?? 'Not yet assigned',
                                        style: const TextStyle(
                                          fontFamily: 'Proxima Nova',
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        ds['client_name'] ?? 'Not yet assigned',
                                        style: const TextStyle(
                                          fontFamily: 'Proxima Nova',
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ])
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                        child: Card(
                          shadowColor: Colors.grey,
                          elevation: 2,
                          margin: const EdgeInsets.all(5),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Center(child: Text('REPORT DETAILS')),
                                Text(
                                  ds['device_id'],
                                  style: const TextStyle(
                                    fontFamily: 'Proxima Nova',
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  ds['device_name'],
                                  style: const TextStyle(
                                    fontFamily: 'Proxima Nova',
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                  ),
                                ),
                                Flexible(
                                  child: Row(
                                    children: [
                                      //const Icon(Icons.priority_high),
                                      Flexible(
                                        child: Text(
                                          (List.from(ds['problems'])
                                              .toString()),
                                          textAlign: TextAlign.end,
                                          style: const TextStyle(
                                            fontFamily: 'Proxima Nova',
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    ds['remarks'] ?? 'Not specified',
                                    style: const TextStyle(
                                      fontFamily: 'Proxima Nova',
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    ds['client_comment'] ?? 'Not specified',
                                    style: const TextStyle(
                                      fontFamily: 'Proxima Nova',
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                  child: ds['proof'] != null
                                      ? Image.network(ds['proof'])
                                      : Image.network(
                                          'https://startupjobs.asia/assets/d63988b5/ac4a7810/images/default/company-logo-placeholder.png'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                        child: Card(
                          shadowColor: Colors.grey,
                          elevation: 2,
                          margin: const EdgeInsets.all(5),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                const Center(child: Text('MANAGER')),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    const SizedBox(width: 10),
                                    CircleAvatar(
                                      backgroundImage: ds[
                                                  'manager_photo_url'] !=
                                              null
                                          ? NetworkImage(
                                              ds['manager_photo_url'])
                                          : const NetworkImage(
                                              'https://www.pngfind.com/pngs/m/610-6104451_image-placeholder-png-user-profile-placeholder-image-png.png',
                                              scale: 10),
                                    ),
                                    const SizedBox(width: 10),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          ds['manager_id'] ??
                                              'Not yet assigned',
                                          style: const TextStyle(
                                            fontFamily: 'Proxima Nova',
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14,
                                          ),
                                        ),
                                        Flexible(
                                          child: Text(
                                            ds['manager_name'] ??
                                                'Not yet assigned',
                                            style: const TextStyle(
                                              fontFamily: 'Proxima Nova',
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Text(
                                            ds['manager_comment'] ??
                                                'Not yet assigned',
                                            style: const TextStyle(
                                              fontFamily: 'Proxima Nova',
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 14,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                        child: Card(
                          shadowColor: Colors.grey,
                          elevation: 2,
                          margin: const EdgeInsets.all(5),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                const Center(child: Text('ENGINEER')),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    const SizedBox(width: 10),
                                    CircleAvatar(
                                      backgroundImage: ds[
                                                  'engineer_photo_url'] !=
                                              null
                                          ? NetworkImage(
                                              ds['engineer_photo_url'])
                                          : const NetworkImage(
                                              'https://www.pngfind.com/pngs/m/610-6104451_image-placeholder-png-user-profile-placeholder-image-png.png',
                                              scale: 10),
                                    ),
                                    const SizedBox(width: 10),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          ds['engineer_id'] ??
                                              'Not yet assigned',
                                          style: const TextStyle(
                                            fontFamily: 'Proxima Nova',
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14,
                                          ),
                                        ),
                                        Flexible(
                                          child: Text(
                                            ds['engineer_name'] ??
                                                'Not yet assigned',
                                            style: const TextStyle(
                                              fontFamily: 'Proxima Nova',
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Text(
                                            ds['engineer_comment'] ??
                                                'Not yet assigned',
                                            style: const TextStyle(
                                              fontFamily: 'Proxima Nova',
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 14,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Report Time',
                              style: TextStyle(
                                fontFamily: 'Proxima Nova',
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              ds['report_time'],
                              style: const TextStyle(
                                fontFamily: 'Proxima Nova',
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Arrival Time',
                              style: TextStyle(
                                fontFamily: 'Proxima Nova',
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              ds['arrival_time'] ?? 'Not yet assigned',
                              style: const TextStyle(
                                fontFamily: 'Proxima Nova',
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                        child: Column(
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: const Text(
                                              'Uploading Proof of Work'),
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
                                child: const Text('Select Proof of Work')),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: Center(
                            child: image != null
                                ? Image.file(image!,
                                    width: 600,
                                    height: 240,
                                    fit: BoxFit.contain)
                                : Image.asset(
                                    'assets/images/placeholder-image.png',
                                    width: 600,
                                    height: 240,
                                    fit: BoxFit.none)),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Comment less than 250 words',
                            contentPadding: const EdgeInsets.all(10),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: Colors.white),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          controller: engineerComments,
                          textAlign: TextAlign.start,
                          keyboardType: TextInputType.multiline,
                          textInputAction: TextInputAction.done,
                          maxLines: 4,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: ElevatedButton(
                          onPressed: () {
                            uploadFile(
                                image!, engineerComments?.text, formattedDate);
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
                          child: const Text('RE-SUBMIT REPORT'),
                        ),
                      )
                    ]);
                  }));
            }),
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

  Future uploadFile(File? image, String? engineerKomen, String current) async {
    if (image == null) return;
    final fileName = basename(image.path);
    final destination = 'proof/$fileName';
    try {
      final ref = firebase_storage.FirebaseStorage.instance
          .ref(destination)
          .child('file/');
      firebase_storage.TaskSnapshot download = await ref.putFile(image);
      String url = await download.ref.getDownloadURL();
      QuerySnapshot getReportID = await FirebaseFirestore.instance
          .collection('report')
          .where('report_id', isEqualTo: widget.firestoreDocID)
          .get();
      QueryDocumentSnapshot queryReportID = getReportID.docs[0];
      DocumentReference referReportID = queryReportID.reference;
      await referReportID.update({
        'proof': url,
        'engineer_comment': engineerKomen,
        'status': 'Awaiting Confirmation',
        'arrival_time': current,
      }).then((value) {
        Fluttertoast.showToast(
            msg: 'The proof of work has been attached to the report.');
      });
    } catch (e) {
      Fluttertoast.showToast(msg: 'An error occured');
    }
  }
}
