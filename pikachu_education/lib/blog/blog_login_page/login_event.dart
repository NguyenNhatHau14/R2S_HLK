part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}
class LoginPressEvent extends LoginEvent{
  final String email;
  final String password;
  final BuildContext context;


  LoginPressEvent({required this.email, required this.password,required this.context});


}
