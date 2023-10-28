import 'package:flutter/material.dart';

import 'details_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/details');
          },
          // onPressed: () {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) => DetailsScreen()),
          //   );
          // },
          // onPressed: () {
          //   // Navigator.pushAndRemoveUntil(context, newRoute, (route) => false);
          //   Navigator.pushAndRemoveUntil(
          //     context,
          //     MaterialPageRoute(
          //         builder: (BuildContext context) => DetailsScreen()),
          //     (Route<dynamic> route) =>
          //         false, // This will remove all previous routes
          //   );
          // },
          child: Text('Go to Details'),
        ),
      ),
    );
  }
}
