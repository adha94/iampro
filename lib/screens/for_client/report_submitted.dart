// MADE WITH ❤️ BY ADHA94 FOR HEZMEDIA
import 'package:flutter/material.dart';
import 'package:iampro_client/entrypoint/entry_point_client.dart';

class ReportSubmitted extends StatelessWidget {
  const ReportSubmitted(this.reportID, this.fullName, this.deviceID,
      this.deviceName, this.selected, this.problemRemarks, this.comments,
      {Key? key})
      : super(key: key);
  final int reportID;
  final String? fullName, deviceID, deviceName, problemRemarks, comments;
  final List<String> selected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF0000FF),
        leadingWidth: 40,
        leading: IconButton(
            onPressed: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const EntryPoint())),
            icon: const Icon(Icons.home)),
        centerTitle: true,
        title: const Text(
          'Report Submitted',
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
                  'Report #${reportID.toString()}',
                  style: const TextStyle(
                    fontFamily: 'Proxima Nova',
                    color: Color(0xFF091249),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: Center(
                child: Text('We have received your report will take action.',
                    style: TextStyle(
                      fontFamily: 'Proxima Nova',
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                    )),
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
                    deviceID.toString(),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Device Name',
                    style: TextStyle(
                      fontFamily: 'Proxima Nova',
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    deviceName.toString(),
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
                    children: selected
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
                      problemRemarks.toString(),
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
                      comments.toString(),
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
          ],
        ),
      ),
    );
  }
}
