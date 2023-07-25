part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginSuccess extends LoginState {}
class LoginUnSuccess extends LoginState{}