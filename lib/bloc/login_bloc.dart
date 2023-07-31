import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<ShowRegisterScreen>((event, emit) {
      emit(LoginState());
    });
  }

  // Future<void> _showSnackBarTapped(
  //     ShowSnackBarButtonTappedEvent e, Emitter emit) async {
  //   emit(ShowSnackbarState());
  // }
}