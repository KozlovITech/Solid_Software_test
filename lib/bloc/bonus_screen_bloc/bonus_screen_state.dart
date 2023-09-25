part of 'bonus_screen_bloc.dart';

///A part of Bloc
class BonusScreenState extends Equatable {
  /// List of image
  final List<String> list;

  /// Photo in List
  final String element;

  ///Height direction
  final double newTop;

  ///Direction to the left
  final double newLeft;

  /// Press Count
  final int pressCount;

  /// Tap Count
  final int tapCount;

  /// Timer after 10 Taps
  final int timerValueAfter10Taps;

  ///Start a Timer
  final bool isTimerStarted;

  ///Show the time
  final bool isShowingTime;

  @override
  List<Object?> get props => [
        list,
        element,
        newTop,
        newLeft,
        pressCount,
        tapCount,
        timerValueAfter10Taps,
        isTimerStarted,
        isShowingTime,
      ];

  ///Constructor
  const BonusScreenState({
    required this.list,
    required this.element,
    required this.newTop,
    required this.newLeft,
    this.pressCount = 0,
    this.tapCount = 0,
    this.timerValueAfter10Taps = 0,
    this.isTimerStarted = false,
    this.isShowingTime = false,
  });
}
