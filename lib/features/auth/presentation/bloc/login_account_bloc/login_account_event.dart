part of 'login_account_bloc.dart';

@immutable
class LoginAccountEvent {
  final String email , password;
  const LoginAccountEvent({required this.email , required this.password});
}
