import 'package:flutter/material.dart';
import 'package:flutter_pomodoro_clock/screens/pomodoro_screen.dart';
import 'package:flutter_pomodoro_clock/store/pomodoro.store.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PomodoroStore>(
          create: (_) => PomodoroStore(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Pomodoro Clock',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const PomodoroScreen(),
      ),
    );
  }
}
