import 'dart:math';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_screen_event.dart';
part 'main_screen_state.dart';

///Bloc for MainScreen
class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  ///Constructor
  MainScreenBloc()
      : super(
          const MainScreenState(
            backgroundColor: Colors.white,
          ),
        ) {
    on<ChangeBackgroundColorEvent>((event, emit) {
      final backColor = Color(Random().nextInt(0xFFFFFFFF)).withOpacity(1.0);
      emit(
        MainScreenState(
          backgroundColor: backColor,
        ),
      );
    });
  }
}
