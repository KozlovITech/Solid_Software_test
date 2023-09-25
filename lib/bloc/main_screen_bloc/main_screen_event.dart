part of 'main_screen_bloc.dart';

@immutable

///BlocEvent for MainScreen
abstract class MainScreenEvent {
  ///Constructor
  const MainScreenEvent();
}

///Event to Change Background Color
class ChangeBackgroundColorEvent extends MainScreenEvent {
  ///Constructor
  const ChangeBackgroundColorEvent();
}
