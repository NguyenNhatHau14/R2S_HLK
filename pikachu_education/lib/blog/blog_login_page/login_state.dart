part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginSuccessState extends LoginState {
  late final String userId;
  LoginSuccessState({required this.userId});
}
class LoginUnSuccessState extends LoginState{}