part of 'create_new_password_bloc.dart';

@immutable
class CreateNewPasswordEvent {
  final String email , password;

  const CreateNewPasswordEvent({required this.email, required this.password});
}
