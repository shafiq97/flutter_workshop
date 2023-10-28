import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details')),
      body: Center(
        child: Lottie.asset('assets/lottie/loading.json'),
      ),
    );
  }
}
