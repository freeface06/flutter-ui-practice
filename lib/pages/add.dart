import 'package:flutter/material.dart';

void main() => runApp(const AddPage());

class AddPage extends StatelessWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('AddPage'),
        ),
      ),
    );
  }
}
