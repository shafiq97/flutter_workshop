import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details')),
      body: Center(
        child: Image.asset(
          'assets/images/bird.jpg',
          width: 200.0, // Set the width
          height: 200.0, // Set the height
          fit: BoxFit
              .cover, // This is to ensure the image covers the given dimension without distortion
        ),
      ),
    );
  }
}
