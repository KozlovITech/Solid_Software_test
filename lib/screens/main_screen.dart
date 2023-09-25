import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_software_test/bloc/main_screen_bloc/main_screen_bloc.dart';

///The main task screen
class MainScreen extends StatelessWidget {
  /// Constructor.
  const MainScreen({super.key});

  static const double _fontSize = 36;

  /// Check brightness
  bool isShadeOfWhite(Color color) {
    return ThemeData.estimateBrightnessForColor(color) == Brightness.light;
  }

  @override
  Widget build(BuildContext context) {
    final MainScreenState state = context.watch<MainScreenBloc>().state;
    final bool isTextLight = isShadeOfWhite(state.backgroundColor);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: state.backgroundColor,
        leading: Builder(
          builder: (BuildContext context) => IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: isShadeOfWhite(state.backgroundColor)
                  ? Colors.black
                  : Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => context
              .read<MainScreenBloc>()
              .add(const ChangeBackgroundColorEvent()),
          child: BlocBuilder<MainScreenBloc, MainScreenState>(
            builder: (context, state) => ColoredBox(
              color: state.backgroundColor,
              child: Center(
                child: Text(
                  "Hello there",
                  style: TextStyle(
                    fontSize: _fontSize,
                    fontWeight: FontWeight.w600,
                    color: isTextLight ? Colors.black : Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
