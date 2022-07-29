// MADE WITH ❤️ BY ADHA94 FOR HEZMEDIA
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iampro_client/screens/for_client/device_report/alarm_report.dart';
import 'package:iampro_client/screens/for_client/device_report/bas_report.dart';
import 'package:iampro_client/screens/for_client/device_report/cas_report.dart';
import 'package:iampro_client/screens/for_client/device_report/cctv_report.dart';
import 'package:iampro_client/screens/for_client/device_report/pabx_report.dart';
import 'package:iampro_client/screens/for_client/device_report/pms_report.dart';
import 'package:iampro_client/screens/for_client/device_report/smarthome_report.dart';
import 'package:iampro_client/screens/for_client/device_report/smatv_report.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScanPage extends StatefulWidget {
  const QRScanPage({Key? key}) : super(key: key);

  @override
  State<QRScanPage> createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QRScanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile Scanner'),
        automaticallyImplyLeading: true,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_rounded)),
      ),
      body: MobileScanner(
          allowDuplicates: false,
          controller: MobileScannerController(
              facing: CameraFacing.back, torchEnabled: true),
          onDetect: (barcode, args) async {
            if (barcode.rawValue == null) {
              debugPrint('Failed to scan Barcode');
            } else {
              final String code = barcode.rawValue!;
              QuerySnapshot<Map<String, dynamic>> querySnapshot =
                  await FirebaseFirestore.instance
                      .collection('device')
                      .where('device_id', isEqualTo: code)
                      .get();
              QueryDocumentSnapshot queryDocumentSnapshot =
                  querySnapshot.docs[0];
              DocumentReference documentReference =
                  queryDocumentSnapshot.reference;
              await documentReference.get().then((snapshot) {
                String a = snapshot['device_name'];
                if (a == 'PMS') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PMSReport(code, a)));
                } else if (a == 'Alarm') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AlarmReport(code, a)));
                } else if (a == 'BAS') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BASReport(code, a)));
                } else if (a == 'CAS') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CASReport(code, a)));
                } else if (a == 'CCTV') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CCTVReport(code, a)));
                } else if (a == 'PABX') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PABXReport(code, a)));
                } else if (a == 'SMATV') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SMATVReport(code, a)));
                } else if (a == 'Smart Home') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SmartHomeReport(code, a)));
                } else {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            title: const Text('Invalid QR Code.'),
                            content: const Text(
                                'Please scan QR code for registered devices and try again.'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('OK'))
                            ],
                          ));
                }
              });
            }
          }),
    );
  }
}
