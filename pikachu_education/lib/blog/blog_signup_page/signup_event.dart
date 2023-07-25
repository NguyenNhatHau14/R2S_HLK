part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent {}
class SignupPress extends SignupEvent{
  final String name;
  final String password;
  final String email;
  final BuildContext context;

  SignupPress({required this.name,required this.email,required this.password,required this.context});

}