part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}
class LoginPress extends LoginEvent{
  final String email;
  final String password;
  final BuildContext context;


  LoginPress({required this.email, required this.password,required this.context});


}
