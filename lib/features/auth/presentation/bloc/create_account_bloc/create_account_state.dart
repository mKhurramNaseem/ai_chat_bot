part of 'create_account_bloc.dart';

@immutable
sealed class CreateAccountState {}

final class CreateAccountInitialState extends CreateAccountState {}

final class CreateAccountLoadingState extends CreateAccountState {}

final class CreateAccountDoneState extends CreateAccountState {}

final class CreateAccountErrorState extends CreateAccountState {
  final String message;

  CreateAccountErrorState(this.message);
}
