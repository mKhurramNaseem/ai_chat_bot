// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:ai_chat_bot/features/profile/domain/entities/user.dart';
import 'package:ai_chat_bot/shared/domain/usecases/get_email_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:ai_chat_bot/features/profile/domain/usecases/update_user_usecase.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  final GetEmailUsecase getEmailUsecase;
  final UpdateUserUsecase updateUserUsecase;
  bool isMale = true;
  DateTime dateOfBirth = DateTime.now();
  EditProfileBloc(
    this.updateUserUsecase,
    this.getEmailUsecase,
  ) : super(EditProfileInitialState()) {
    on<UpdateProfileEvent>(_handleUpdateProfileEvent);
    on<UpdateGenderEvent>(_handleGenderEvent);
    on<UpdateDateOfBirthEvent>(_handleDateOfBirthEvent);
  }

  FutureOr<void> _handleUpdateProfileEvent(
      UpdateProfileEvent event, Emitter<EditProfileState> emit) async {
    emit(EditProfileLoadingState());
    var email = getEmailUsecase();
    if (email != null) {
      UserProfile user = UserProfile(
          name: event.fullName,
          nickName: event.nickName,
          email: email,
          isMale: isMale,
          dateOfBirth: dateOfBirth,
          profileImageUrl: event.profileImagePath);
      var result = await updateUserUsecase(user);
      if (result.isRight()) {
        if (result.getOrElse(() => false)) {
          emit(EditProfileLoadedState());
        } else {
          emit(EditProfileErrorState('Unable to update profile'));
        }
      } else {
        emit(EditProfileErrorState('Unable to update profile'));
      }
    }
  }

  FutureOr<void> _handleGenderEvent(
      UpdateGenderEvent event, Emitter<EditProfileState> emit) {
    isMale = event.isMale;
  }

  FutureOr<void> _handleDateOfBirthEvent(
      UpdateDateOfBirthEvent event, Emitter<EditProfileState> emit) {
    dateOfBirth = event.dateOfBirth;
  }
}
