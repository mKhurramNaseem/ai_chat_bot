// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'create_account_bloc.dart';

@immutable
class CreateAccountEvent {
  final String email;
  final String password;
  const CreateAccountEvent({
    required this.email,
    required this.password,
  });
}
