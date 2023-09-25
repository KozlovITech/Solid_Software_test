import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solid_software_test/bloc/bonus_screen_bloc/bonus_screen_bloc.dart';
import 'package:solid_software_test/themes/color_theme.dart';
import 'package:solid_software_test/themes/text_theme.dart';

///The main task screen
class BonusScreen extends StatelessWidget {
  /// Constructor.
  const BonusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.darkPurple,
      appBar: AppBar(
        backgroundColor: ColorTheme.darkPurple,
        iconTheme: const IconThemeData(
          color: ColorTheme.white,
        ),
      ),
      body: BlocBuilder<BonusScreenBloc, BonusScreenState>(
        builder: (BuildContext context, BonusScreenState state) {
          return BonusContent(
            //state: state,
            isTimerStarted: state.isTimerStarted,
            isShowingTime: state.isShowingTime,
            tapCount: state.tapCount,
            newTop: state.newTop,
            newLeft: state.newLeft,
            element: state.element,
          );
        },
      ),
    );
  }
}

///Implementation of the bonus task
class BonusContent extends StatelessWidget {
  ///Start a Timer
  final bool isTimerStarted;

  ///Show the time
  bool isShowingTime;

  /// Tap Count
  int tapCount;

  ///Height direction
  double newTop;

  ///Direction to the left
  double newLeft;

  ///Random photo from the list
  final String element;

  ///Max tap on the img
  final double maxTapCount = 10;

  ///Max width and height
  final double widthHeight = 100;

  ///To display seconds with a decimal point
  final double number100 = 100;

  ///Constructor
  BonusContent({
    //required this.state,
    required this.isTimerStarted,
    required this.isShowingTime,
    required this.tapCount,
    required this.newTop,
    required this.newLeft,
    required this.element,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (!isTimerStarted && !isShowingTime)
          Center(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "Try to catch the cat. The image of the cat will appear "
                    "randomly, then you need to catch it 10 times.",
                    style: Fonts.bonusScreenText,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    context
                        .read<BonusScreenBloc>()
                        .add(StartTimerAndShowImages(context: context));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorTheme.darkOrange,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Start",
                      style: Fonts.bonusButtons,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        if (isTimerStarted && !isShowingTime && tapCount < maxTapCount)
          GestureDetector(
            onTap: () {
              tapCount++;
              context.read<BonusScreenBloc>().add(ChangeCat(context: context));
              if (tapCount == maxTapCount) {
                isShowingTime = true;
                context
                    .read<BonusScreenBloc>()
                    .add(ShowTimeAndReset(context: context));
              }
            },
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: newTop,
                    left: newLeft,
                  ),
                  child: SvgPicture.asset(
                    element == "" ? 'assets/img/cat_1.svg' : element,
                    semanticsLabel: 'My SVG Image',
                    height: widthHeight,
                    width: widthHeight,
                    color: ColorTheme.white_70,
                  ),
                ),
              ],
            ),
          ),
        if (isShowingTime)
          Align(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Your result: ${BonusScreenBloc.timerValueInSeconds}.'
                  '${BonusScreenBloc.timerValueInMilliseconds ~/ number100}sec',
                  style: Fonts.bonusScreenText,
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    context
                        .read<BonusScreenBloc>()
                        .add(ResetProcess(context: context));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorTheme.darkOrange,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Restart",
                      style: Fonts.bonusButtons,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
