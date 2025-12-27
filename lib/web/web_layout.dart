import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'iphone_frame.dart';

class WebLayout extends StatelessWidget {
  final Widget child;

  const WebLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    // If not web, return directly
    if (!kIsWeb) return child;

    final double screenWidth = MediaQuery.of(context).size.width;

    // If web but on phone-sized screen → no iPhone frame
    if (screenWidth < 600) {
      return child;
    }

    // Web + large screen (tablet / laptop / desktop)
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      body: IphoneFrame(child: child),
    );
  }
}