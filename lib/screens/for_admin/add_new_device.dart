// MADE WITH ❤️ BY ADHA94 FOR HEZMEDIA
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AddNewDevice extends StatefulWidget {
  const AddNewDevice({Key? key}) : super(key: key);

  @override
  State<AddNewDevice> createState() => _AddNewDeviceState();
}

class _AddNewDeviceState extends State<AddNewDevice> {
  File? image;
  final formKey = GlobalKey<FormState>();
  TextEditingController? textController1 = TextEditingController();
  TextEditingController? textController2 = TextEditingController();
  TextEditingController? textController3 = TextEditingController();
  TextEditingController? textController4 = TextEditingController();
  TextEditingController? textController5 = TextEditingController();
  DateTime? _myDateTime;
  String time = '?';
  String? dropDownValue;
  var items = [
    'CCTV',
    'CAS',
    'PMS',
    'Smart TV',
    'PABX',
    'BAS',
    'Smart Home',
    'Alarm'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: const Color(0xFF0000FF),
        leadingWidth: 40,
        centerTitle: true,
        title: const Text(
          'Add New Device',
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
                                  title: const Text('Upload Device Image'),
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
                            labelText: 'Brand',
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
                            labelText: 'Model',
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
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.all(10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Device Location',
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
                        controller: textController3,
                        keyboardType: TextInputType.text,
                        maxLines: 5,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.all(10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Installation Date',
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
                        controller: textController4,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        onTap: () async {
                          // Below line stops keyboard from appearing
                          FocusScope.of(context).requestFocus(FocusNode());
                          _myDateTime = await showDatePicker(
                              context: context,
                              initialDate: _myDateTime == null
                                  ? DateTime.now()
                                  : _myDateTime!,
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2050));
                          setState(() {
                            time =
                                DateFormat('dd-MM-yyyy').format(_myDateTime!);
                            textController4!.text = time;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.all(10),
                      child: DropdownButton<String>(
                        value: dropDownValue,
                        onChanged: (String? value) {
                          setState(() {
                            dropDownValue = value;
                          });
                        },
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        elevation: 8,
                        hint: const Text('Device Category'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.all(10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Generated Device ID',
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
                        controller: textController5,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsetsDirectional.all(10),
                        child: OutlinedButton(
                          onPressed: null,
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
                          child: const Text('Add New Device',
                              style: TextStyle(color: Colors.white)),
                        )),
                  ],
                ),
              ),
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
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
