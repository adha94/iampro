// MADE WITH ❤️ BY ADHA94 FOR HEZMEDIA
import 'package:flutter/material.dart';
import 'package:iampro_client/model/device_icon.dart';

class ViewProducts extends StatelessWidget {
  const ViewProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: const Color(0xFF0000FF),
        leadingWidth: 40,
        centerTitle: true,
        title: const Text(
          'View Products',
          style: TextStyle(
            fontFamily: 'Proxima Nova',
            color: Color(0xFFFFFFFF),
          ),
        ),
      ),
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 60,
              width: double.maxFinite,
              child: Card(
                shadowColor: Colors.grey,
                margin: const EdgeInsets.all(5),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(width: 10),
                      Image.asset(DeviceIcon.cctvIcon),
                      const SizedBox(width: 20),
                      const Text(
                        'CCTV',
                        style: TextStyle(
                            fontFamily: 'Proxima Nova',
                            color: Color(0xFF091249),
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 60,
              width: double.maxFinite,
              child: Card(
                shadowColor: Colors.grey,
                margin: const EdgeInsets.all(5),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(width: 10),
                      Image.asset(DeviceIcon.casIcon),
                      const SizedBox(width: 20),
                      const Text(
                        'CAS',
                        style: TextStyle(
                            fontFamily: 'Proxima Nova',
                            color: Color(0xFF091249),
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 60,
              width: double.maxFinite,
              child: Card(
                shadowColor: Colors.grey,
                margin: const EdgeInsets.all(5),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(width: 10),
                      Image.asset(DeviceIcon.pmsIcon),
                      const SizedBox(width: 20),
                      const Text(
                        'PMS',
                        style: TextStyle(
                            fontFamily: 'Proxima Nova',
                            color: Color(0xFF091249),
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 60,
              width: double.maxFinite,
              child: Card(
                shadowColor: Colors.grey,
                margin: const EdgeInsets.all(5),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(width: 10),
                      Image.asset(DeviceIcon.smartTVIcon),
                      const SizedBox(width: 20),
                      const Text(
                        'Smart TV',
                        style: TextStyle(
                            fontFamily: 'Proxima Nova',
                            color: Color(0xFF091249),
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 60,
              width: double.maxFinite,
              child: Card(
                shadowColor: Colors.grey,
                margin: const EdgeInsets.all(5),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(width: 10),
                      Image.asset(DeviceIcon.pabxIcon),
                      const SizedBox(width: 20),
                      const Text(
                        'PABX',
                        style: TextStyle(
                            fontFamily: 'Proxima Nova',
                            color: Color(0xFF091249),
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 60,
              width: double.maxFinite,
              child: Card(
                shadowColor: Colors.grey,
                margin: const EdgeInsets.all(5),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(width: 10),
                      Image.asset(DeviceIcon.basIcon),
                      const SizedBox(width: 20),
                      const Text(
                        'BAS',
                        style: TextStyle(
                            fontFamily: 'Proxima Nova',
                            color: Color(0xFF091249),
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 60,
              width: double.maxFinite,
              child: Card(
                shadowColor: Colors.grey,
                margin: const EdgeInsets.all(5),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(width: 10),
                      Image.asset(DeviceIcon.smartHomeIcon),
                      const SizedBox(width: 20),
                      const Text(
                        'Smart Home',
                        style: TextStyle(
                            fontFamily: 'Proxima Nova',
                            color: Color(0xFF091249),
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 60,
              width: double.maxFinite,
              child: Card(
                shadowColor: Colors.grey,
                margin: const EdgeInsets.all(5),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(width: 10),
                      Image.asset(DeviceIcon.alarmIcon),
                      const SizedBox(width: 20),
                      const Text(
                        'Alarm',
                        style: TextStyle(
                            fontFamily: 'Proxima Nova',
                            color: Color(0xFF091249),
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
      ),
    );
  }
}
