// MADE WITH ❤️ BY ADHA94 FOR HEZMEDIA
import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:iampro_client/model/problem_list.dart';
import 'package:iampro_client/model/model_client.dart';
import 'package:iampro_client/screens/for_client/confirm_report_submission.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SmartHomeReport extends StatefulWidget {
  const SmartHomeReport(this.s, String a, {Key? key}) : super(key: key);
  final String s;
  @override
  State<SmartHomeReport> createState() => _SmartHomeReportState();
}

class _SmartHomeReportState extends State<SmartHomeReport> {
  TextEditingController? deviceID;
  TextEditingController? deviceName;
  TextEditingController? problemRemarks;
  TextEditingController? comments;
  final formKey = GlobalKey<FormState>();
  User? user = FirebaseAuth.instance.currentUser;
  Client loggedInClient = Client();
  List<String> selected = [];
  //bool value = false;

  @override
  void initState() {
    super.initState();
    deviceID = TextEditingController(text: widget.s);
    deviceName = TextEditingController(text: 'Smart Home');
    problemRemarks = TextEditingController();
    comments = TextEditingController();
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
          'Report Smart Home',
          style: TextStyle(
            fontFamily: 'Proxima Nova',
            color: Color(0xFFFFFFFF),
          ),
        ),
      ),
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Center(
                          child: Image.asset(
                            'assets/images/smart_home_no_border.png',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Center(
                          child: Text(
                            'Report Smart Home',
                            style: TextStyle(
                                fontFamily: 'Proxima Nova',
                                fontSize: 18,
                                color: Color(0XFF235CC3)),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Center(
                          child: Text(
                              'What Smart Home issue would you like to report?',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Proxima Nova',
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              )),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: SizedBox(
                          width: 350,
                          child: TextFormField(
                            controller: deviceID,
                            decoration: InputDecoration(
                                labelText: 'Device ID',
                                contentPadding:
                                    const EdgeInsetsDirectional.fromSTEB(
                                        10, 10, 10, 10),
                                prefixIcon: const Icon(Icons.edit),
                                prefixIconColor: Colors.black,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            style: const TextStyle(
                              fontFamily: 'Proxima Nova',
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.start,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: SizedBox(
                          width: 350,
                          child: TextFormField(
                            controller: deviceName,
                            decoration: InputDecoration(
                              fillColor: Colors.grey.shade400,
                              labelText: 'Device Name',
                              contentPadding:
                                  const EdgeInsetsDirectional.fromSTEB(
                                      10, 10, 10, 10),
                              prefixIcon: const Icon(Icons.edit_note),
                              prefixIconColor: Colors.black,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            style: const TextStyle(
                              fontFamily: 'Proxima Nova',
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.start,
                            keyboardType: TextInputType.text,
                            readOnly: true,
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                      ),
                      const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Text('Select the problems of the device.',
                              style: TextStyle(
                                  fontFamily: 'Proxima Nova',
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16))),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Container(
                            width: 350,
                            height: 350,
                            //color: Colors.white,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.white,
                                width: 1.0,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 10,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: ListView(
                              physics: const ClampingScrollPhysics(),
                              shrinkWrap: true,
                              children: [
                                CheckboxGroup(
                                  labels: const <String>[
                                    'No wifi connection',
                                    'No internet connection',
                                    'No local network connection',
                                    'Others'
                                  ],
                                  activeColor: Colors.blue,
                                  checkColor: Colors.black,
                                  onChange: (bool isChecked, String label,
                                          int index) =>
                                      print(
                                          "isChecked: $isChecked   label: $label  index: $index"),
                                  onSelected: (label) => selected = label,
                                ),
                                const Divider(),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 2, 2, 2),
                                  child: TextField(
                                    decoration: const InputDecoration(
                                      hintText: 'Please state the problem',
                                      contentPadding: EdgeInsets.all(10),
                                      border: InputBorder.none,
                                    ),
                                    controller: problemRemarks,
                                    textAlign: TextAlign.start,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.done,
                                  ),
                                )
                              ],
                            )),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Container(
                          width: 350,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.white,
                              width: 1.0,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.1),
                                spreadRadius: 10,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
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
                            controller: comments,
                            textAlign: TextAlign.start,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            maxLines: 2,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(10, 20, 10, 8),
                        child: ElevatedButton(
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ConfirmReport(
                                  loggedInClient.displayName,
                                  deviceID?.text,
                                  deviceName?.text,
                                  selected,
                                  problemRemarks?.text,
                                  comments?.text),
                            ),
                          ),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
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
                          child: const Text('SUBMIT',
                              style: TextStyle(
                                  fontFamily: 'Proxima Nova',
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14)),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSingleCheckbox(ProblemList problemList) => buildCheckbox(
      problemList: problemList,
      onClicked: () {
        setState(() {
          final newValue = !problemList.value;
          problemList.value = newValue;
        });
      });

  Widget buildCheckbox({
    required ProblemList problemList,
    required VoidCallback onClicked,
  }) =>
      ListTile(
        onTap: onClicked,
        leading: Checkbox(
          value: problemList.value,
          onChanged: (value) => onClicked(),
        ),
        title: Text(problemList.title,
            style: const TextStyle(
              fontFamily: 'Proxima Nova',
              color: Color(0xFF091249),
              fontWeight: FontWeight.normal,
              fontSize: 14,
            )),
      );
}
