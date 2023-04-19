import 'package:flutter/material.dart';

void main() => runApp(const PersonPage());

class PersonPage extends StatelessWidget {
  const PersonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('PersonPage'),
        ),
      ),
    );
  }
}
