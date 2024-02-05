import 'package:flutter/material.dart';

class UnknownScreen extends StatelessWidget {
  const UnknownScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: const SingleChildScrollView(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text('Unknown Screen'),
            ],
          ),
        ),
      ),
    );
  }
}
