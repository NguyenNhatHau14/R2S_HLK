part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent {}
class SignupPress extends SignupEvent{
  final String user;
  final String password;
  final String email;

  SignupPress({required this.user,required this.email,required this.password});

}