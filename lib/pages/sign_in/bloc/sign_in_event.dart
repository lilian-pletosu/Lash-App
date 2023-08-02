part of 'sign_in_bloc.dart';

abstract class SignInEvent {
  SignInEvent();
}

class EmailEvent extends SignInEvent {
  String email;
  EmailEvent(this.email);
}

class PasswordEvent extends SignInEvent {
  String password;
  PasswordEvent(this.password);
}
