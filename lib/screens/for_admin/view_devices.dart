// MADE WITH ❤️ BY ADHA94 FOR HEZMEDIA
import 'package:flutter/material.dart';
import 'package:iampro_client/screens/for_admin/add_new_device.dart';

class ViewDevices extends StatelessWidget {
  const ViewDevices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: const Color(0xFF0000FF),
        leadingWidth: 40,
        centerTitle: true,
        title: const Text(
          'View Devices',
          style: TextStyle(
            fontFamily: 'Proxima Nova',
            color: Color(0xFFFFFFFF),
          ),
        ),
      ),
      backgroundColor: const Color(0xFFFFFFFF),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AddNewDevice())),
        child: const Icon(Icons.add),
      ),
    );
  }
}
