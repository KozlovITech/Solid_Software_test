part of 'main_screen_bloc.dart';

///A part of Bloc
class MainScreenState extends Equatable {
  ///Variable for background color
  final Color backgroundColor;

  @override
  List<Object?> get props => [
        backgroundColor,
      ];

  ///Constructor
  const MainScreenState({
    required this.backgroundColor,
  });
}
