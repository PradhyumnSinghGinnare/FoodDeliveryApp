import 'package:flutter/material.dart';

class IphoneFrame extends StatelessWidget {
  final Widget child;

  const IphoneFrame({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 380,
        // height: 880,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(50),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 30,
              offset: Offset(0, 20),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(38),
          child: Container(
            color: Colors.white,
            child: child,
          ),
        ),
      ),
    );
  }
}
