import 'package:flutter/material.dart';

class CleverPersonScreen extends StatelessWidget {
  const CleverPersonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff95B6FF),
      body: GestureDetector(
        onDoubleTap: () {
          Navigator.pop(context);
        },
        child: const Center(
          child: Text(
            "You are a clever person!",
            style: TextStyle(
              fontFamily: "SF-Pro",
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w700,
              fontSize: 28.0,
              letterSpacing: 0.24,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
