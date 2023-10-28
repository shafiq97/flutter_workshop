import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Columns Example')),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            // Use Row here
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                // First column
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, size: 50, color: Colors.red),
                  SizedBox(height: 20),
                  Text('Inside Column 1', style: TextStyle(fontSize: 24)),
                  SizedBox(height: 20),
                  Icon(Icons.star, size: 50, color: Colors.blue),
                ],
              ),
              Column(
                // Second column
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, size: 50, color: Colors.green),
                  SizedBox(height: 20),
                  Text('Inside Column 2', style: TextStyle(fontSize: 24)),
                  SizedBox(height: 20),
                  Icon(Icons.star, size: 50, color: Colors.yellow),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
