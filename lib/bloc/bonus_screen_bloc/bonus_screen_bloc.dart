import 'dart:async';
import 'dart:math';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bonus_screen_event.dart';
part 'bonus_screen_state.dart';

///Bloc for BonusScreen
class BonusScreenBloc extends Bloc<BonusScreenEvent, BonusScreenState> {
  final List<String> _list = [
    'assets/img/cat_1.svg',
    'assets/img/cat_2.svg',
    'assets/img/cat_3.svg',
    'assets/img/cat_4.svg',
    'assets/img/cat_5.svg',
  ];

  static int _pressCount = 0;
  static int _tapCount = 0;

  ///Time Duration
  static const int timeDuration = 100;

  ///Max timer value
  static const int maxTimerValueInMilliseconds = 1000;

  ///Min timer value
  static const int minTimerValueInMilliseconds = 0;

  ///Max Press to image
  static const int maxPressCount = 10;

  ///Time Tap Count
  static const int maxTapCount = 10;

  Timer? _timer;

  ///Variable for timer
  static int timerValueInSeconds = 0;

  ///Variable for timer
  static int timerValueInMilliseconds = 0;

  ///Variable for timer
  static ValueNotifier<int> timerValue = ValueNotifier<int>(0);

  ///Constructor
  BonusScreenBloc()
      : super(
          const BonusScreenState(
            list: [],
            element: '',
            newLeft: 0,
            newTop: 0,
          ),
        ) {
    on<ChangeCat>((event, emit) async {
      final String element = _list[Random().nextInt(_list.length)];

      final screenWidth = MediaQuery.of(event.context).size.width;
      final screenHeight = MediaQuery.of(event.context).size.height;
      const imageWidth = 100.0;
      const imageHeight = 100.0;

      final maxLeft = screenWidth - imageWidth;
      final maxTop = screenHeight - imageHeight;

      final newLeft = Random().nextDouble() * maxLeft;
      final newTop = Random().nextDouble() * maxTop;
      _tapCount++;
      const bool isTimerStarted = true;
      bool isShowingTimer = false;
      isShowingTimer = _tapCount == maxTapCount;
      emit(
        BonusScreenState(
          list: _list,
          element: element,
          newLeft: newLeft,
          newTop: newTop,
          pressCount: _pressCount,
          isTimerStarted: isTimerStarted,
          isShowingTime: isShowingTimer,
          tapCount: _tapCount,
        ),
      );
    });

    on<StopTimerEvent>((event, emit) {
      stopTimer();
    });

    on<StartTimerAndShowImages>((event, emit) {
      const bool isTimerStarted = true;
      final int timerValue = BonusScreenBloc.timerValue.value = 0;
      final BuildContext context = event.context;
      final appBloc = context.read<BonusScreenBloc>();
      appBloc.startTimer();
      emit(
        BonusScreenState(
          list: const [],
          element: '',
          newLeft: 0,
          newTop: 0,
          isTimerStarted: isTimerStarted,
          timerValueAfter10Taps: timerValue,
        ),
      );
    });

    on<ResetProcess>((event, emit) {
      /// Reset timer values
      timerValueInSeconds = 0;
      timerValueInMilliseconds = 0;

      final BuildContext context = event.context;
      emit(
        const BonusScreenState(
          list: [],
          element: '',
          newLeft: 0,
          newTop: 0,
        ),
      );
      context
          .read<BonusScreenBloc>()
          .add(StartTimerAndShowImages(context: context));
      context.read<BonusScreenBloc>().stopTimer();
    });

    /// Base of all things.
    on<ShowTimeAndReset>((event, emit) {
      /// Initialize the base.
      const bool isShowingTime = true;
      final int timerValueAfter10Taps = BonusScreenBloc.timerValue.value;
      final BuildContext context = event.context;
      context.read<BonusScreenBloc>().stopTimer();
      emit(
        BonusScreenState(
          list: const [],
          element: '',
          newLeft: 0,
          newTop: 0,
          isShowingTime: isShowingTime,
          timerValueAfter10Taps: timerValueAfter10Taps,
        ),
      );
    });
  }

  ///Function Stop Timer
  void stopTimer() {
    if (_pressCount >= maxPressCount) {
      _timer?.cancel();
      timerValue.value = 0;
    }
  }

  ///Function Start Timer
  void startTimer() {
    _pressCount = 0;
    _tapCount = 0;
    _timer?.cancel();

    _timer =
        Timer.periodic(const Duration(milliseconds: timeDuration), (timer) {
      timerValueInMilliseconds +=
          timeDuration; // Update timer by 100 milliseconds
      if (timerValueInMilliseconds >= maxTimerValueInMilliseconds) {
        timerValueInMilliseconds = minTimerValueInMilliseconds;
        timerValueInSeconds++;
      }
      if (_tapCount >= maxPressCount) {
        timer.cancel();
      }
    });
  }
}
