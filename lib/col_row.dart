import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Column & Row Example')),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Above the Rows'),
              SizedBox(height: 20), // Adds some spacing
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.star, size: 50, color: Colors.red),
                  Text('Inside Row 1', style: TextStyle(fontSize: 24)),
                  Icon(Icons.star, size: 50, color: Colors.blue),
                ],
              ),
              SizedBox(height: 20), // Adds some spacing between the two rows
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.star, size: 50, color: Colors.green),
                  Text('Inside Row 2', style: TextStyle(fontSize: 24)),
                  Icon(Icons.star, size: 50, color: Colors.yellow),
                ],
              ),
              SizedBox(height: 20), // Adds some spacing
              Text('Below the Rows'),
            ],
          ),
        ),
      ),
    );
  }
}
