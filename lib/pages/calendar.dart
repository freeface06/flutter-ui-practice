import 'package:flutter/material.dart';

void main() => runApp(const CalendarPage());

class CalendarPage extends StatelessWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('CalendarPage'),
        ),
      ),
    );
  }
}
