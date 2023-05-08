import 'package:flutter/physics.dart';

abstract class SignInState {}

class SignInInitialState extends SignInState {}

class SignInInvalidState extends SignInState {}

class SignInValidState extends SignInState {}

class SignInErrorState extends SignInState {
  final String errormMessage;
  SignInErrorState(this.errormMessage);
}


class SignInLoadingState extends SignInState {
  
}
