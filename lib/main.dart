import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_software_test/bloc/bonus_screen_bloc/bonus_screen_bloc.dart';
import 'package:solid_software_test/bloc/main_screen_bloc/main_screen_bloc.dart';
import 'package:solid_software_test/home_page.dart';
import 'package:solid_software_test/themes/color_theme.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BonusScreenBloc()),
        BlocProvider(create: (context) => MainScreenBloc()),
      ],
      child: const MyApp(),
    ),
  );
}

///MyApp
class MyApp extends StatelessWidget {
  ///Constructor
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Solid Software Test App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorTheme.colorScheme,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
