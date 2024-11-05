// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ai_chat_bot/features/auth/domain/usecases/create_account_usecase.dart';

part 'create_account_event.dart';
part 'create_account_state.dart';

class CreateAccountBloc extends Bloc<CreateAccountEvent, CreateAccountState> {
  final CreateAccountUsecase createAccountUsecase;
  CreateAccountBloc(
    this.createAccountUsecase,
  ) : super(CreateAccountInitial()) {
    on<CreateAccountEvent>(_handleCreateAccountEvent);
  }

  FutureOr<void> _handleCreateAccountEvent(
      CreateAccountEvent event, Emitter<CreateAccountState> emit) async {
    // await createAccountUsecase();
  }
}
