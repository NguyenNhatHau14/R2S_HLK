part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent {}
class SignupPressEvent extends SignupEvent{
  final String name;
  final String password;
  final String email;
  final BuildContext context;

  SignupPressEvent({required this.name,required this.email,required this.password,required this.context});

}