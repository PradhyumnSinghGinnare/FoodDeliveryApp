import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'iphone_frame.dart';

class WebLayout extends StatelessWidget {
  final Widget child;

  const WebLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    if (!kIsWeb) {
      return child;
    }

    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      body: IphoneFrame(
        child: child,
      ),
    );
  }
}
