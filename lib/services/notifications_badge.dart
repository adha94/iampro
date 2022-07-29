import 'package:flutter/material.dart';

class NotificationsBadge extends StatelessWidget {
  final int totalNotification;
  const NotificationsBadge({Key? key, required this.totalNotification})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: const BoxDecoration(
        color: Colors.redAccent,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$totalNotification",
                style: const TextStyle(color: Colors.white, fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
