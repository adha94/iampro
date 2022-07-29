// MADE WITH ❤️ BY ADHA94 FOR HEZMEDIA
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:iampro_client/model/model_client.dart';
import 'package:iampro_client/screens/for_client/report_submitted.dart';

class ConfirmReport extends StatefulWidget {
  const ConfirmReport(this.fullName, this.deviceID, this.deviceName,
      this.selected, this.problemRemarks, this.comments,
      {Key? key})
      : super(key: key);
  final String? fullName, deviceID, deviceName, problemRemarks, comments;
  final List<String> selected;

  //final List<String> selected;

  @override
  State<ConfirmReport> createState() => _ConfirmReportState();
}

class _ConfirmReportState extends State<ConfirmReport> {
  User? user = FirebaseAuth.instance.currentUser;
  Client loggedInClient = Client();
  DateTime placeholder = DateTime.now();

  String formattedDate = DateFormat.yMMMEd().format(DateTime.now());
  int reportSize = 0;

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInClient = Client.fromMap(value.data());
    });
    FirebaseFirestore.instance
        .collection('report')
        .get()
        .then((value) => reportSize = (value.size + 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: const Color(0xFF0000FF),
        leadingWidth: 40,
        centerTitle: true,
        title: const Text(
          'Confirm Report Submission',
          style: TextStyle(
            fontFamily: 'Proxima Nova',
            color: Color(0xFFFFFFFF),
          ),
        ),
      ),
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: Center(
                child: Text(
                  '${widget.deviceID} - ${widget.deviceName}',
                  style: const TextStyle(
                    fontFamily: 'Proxima Nova',
                    color: Color(0xFF091249),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
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
                    'Device ID',
                    style: TextStyle(
                      fontFamily: 'Proxima Nova',
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    widget.deviceID.toString(),
                    style: const TextStyle(
                      fontFamily: 'Proxima Nova',
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Issues/Problems',
                    style: TextStyle(
                      fontFamily: 'Proxima Nova',
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: widget.selected
                        .map(
                          (e) => SizedBox(
                            child: Text(
                              e,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontFamily: 'Proxima Nova',
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        )
                        .toList(),
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
                    'Other Problem',
                    style: TextStyle(
                      fontFamily: 'Proxima Nova',
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      widget.problemRemarks.toString(),
                      style: const TextStyle(
                        fontFamily: 'Proxima Nova',
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                      ),
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
                    'Comments',
                    style: TextStyle(
                      fontFamily: 'Proxima Nova',
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      widget.comments.toString(),
                      style: const TextStyle(
                        fontFamily: 'Proxima Nova',
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(45, 10, 45, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      addReport(
                          loggedInClient.id,
                          loggedInClient.displayName,
                          widget.deviceID,
                          widget.deviceName,
                          widget.problemRemarks,
                          widget.comments,
                          widget.selected,
                          formattedDate);
                    },
                    label: const Text('Continue'),
                    icon: const Icon(Icons.done),
                    style: ElevatedButton.styleFrom(
                        primary: Colors
                            .lightBlueAccent //elevated btton background color
                        ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () => Navigator.pop(context),
                    label: const Text('Cancel',
                        style: TextStyle(color: Colors.black)),
                    icon: const Icon(Icons.close, color: Colors.black),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white //elevated btton background color
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addReport(
    String? clientID,
    clientName,
    deviceID,
    deviceName,
    problemRemarks,
    comments,
    List<String> problemsList,
    String current,
  ) async {
    await FirebaseFirestore.instance.collection('report').add({
      'arrival_time': null,
      'client_address': loggedInClient.address,
      'client_comment': comments,
      'client_id': clientID,
      'client_name': clientName,
      'client_position': loggedInClient.position,
      'company_logo': loggedInClient.companyLogo,
      'company': loggedInClient.company,
      'device_id': deviceID,
      'device_name': deviceName,
      'engineer_comment': null,
      'engineer_id': null,
      'engineer_name': null,
      'engineer_photo_url': null,
      'isRead': false,
      'manager_comment': null,
      'manager_id': null,
      'manager_name': null,
      'manager_photo_url': null,
      'placeholder': placeholder,
      'problems': problemsList,
      'proof': null,
      'remarks': problemRemarks,
      'report_time': current,
      'report_id': reportSize,
      'report_status': 'Pending',
    }).then((value) async {
      FirebaseFirestore.instance
          .collection('users')
          .doc(user?.uid)
          .update({'total_reports': FieldValue.increment(1)});
      Fluttertoast.showToast(msg: "Report added successfully!");
      await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ReportSubmitted(
                  reportSize,
                  loggedInClient.displayName,
                  deviceID,
                  deviceName,
                  widget.selected,
                  problemRemarks,
                  comments)));
    });
  }
}
