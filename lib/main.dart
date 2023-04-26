import 'package:flutter/material.dart';
import 'package:practice/pages/add.dart';
import 'package:practice/pages/calendar.dart';
import 'package:practice/pages/favorite.dart';
import 'package:practice/pages/home.dart';
import 'package:practice/pages/person.dart';

import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepOrange, brightness: Brightness.light)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    // 바텀 네비게이션 탭했을때
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    FavoritePage(),
    AddPage(),
    CalendarPage(),
    PersonPage()
  ];

  void _onButtonPressed() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('AppBar 버튼 클릭!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('HJ'),
        backgroundColor: Colors.deepOrange,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.filter_drama),
            onPressed: _onButtonPressed,
            style: IconButton.styleFrom(
              foregroundColor: colors.onPrimary,
              backgroundColor: colors.primary,
              disabledBackgroundColor: colors.onSurface.withOpacity(0.12),
              hoverColor: colors.onPrimary.withOpacity(0.08),
              focusColor: colors.onPrimary.withOpacity(0.12),
              highlightColor: colors.onPrimary.withOpacity(0.12),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.account_circle_rounded),
            onPressed: _onButtonPressed,
            style: IconButton.styleFrom(
              foregroundColor: colors.onPrimary,
              backgroundColor: colors.primary,
              disabledBackgroundColor: colors.onSurface.withOpacity(0.12),
              hoverColor: colors.onPrimary.withOpacity(0.08),
              focusColor: colors.onPrimary.withOpacity(0.12),
              highlightColor: colors.onPrimary.withOpacity(0.12),
            ),
          ),
        ],
      ),
      body: Center(
        // 앱의 메인 화면
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        // 디폴트 페이지 설정
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle), label: 'Add'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month), label: 'Calendar'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Person'),
        ],
      ),
    );
  }
}
