part of 'bonus_screen_bloc.dart';

///A part of Bloc
abstract class BonusScreenEvent {
  ///Constructor
  const BonusScreenEvent();
}

/// Event to Change Image
class ChangeCat extends BonusScreenEvent {
  /// Context
  final BuildContext context;

  ///Constructor
  ChangeCat({required this.context});
}

/// Event to Stop Timer
class StopTimerEvent extends BonusScreenEvent {}

/// Event to Start Timer and Show Image Randomly
class StartTimerAndShowImages extends BonusScreenEvent {
  /// Context
  final BuildContext context;

  ///Constructor
  StartTimerAndShowImages({required this.context});
}

/// Event Reset all
class ResetProcess extends BonusScreenEvent {
  /// Context
  final BuildContext context;

  ///Constructor
  ResetProcess({required this.context});
}

/// Event to Show Time And Restart
class ShowTimeAndReset extends BonusScreenEvent {
  /// Context
  final BuildContext context;

  ///Constructor
  ShowTimeAndReset({required this.context});
}
