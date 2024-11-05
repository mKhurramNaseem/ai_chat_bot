// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:io';

import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/profile/domain/entities/user.dart';
import 'package:ai_chat_bot/shared/domain/usecases/get_email_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:ai_chat_bot/features/chat/domain/usecases/pick_image_usecase.dart';
import 'package:ai_chat_bot/features/profile/domain/usecases/create_user_usecase.dart';

part 'fill_profile_event.dart';
part 'fill_profile_state.dart';

class FillProfileBloc extends Bloc<FillProfileEvent, FillProfileState> {
  final CreateUserUsecase createUserUsecase;
  final PickImageUsecase pickImageUsecase;
  final GetEmailUsecase getEmailUsecase;

  bool isMale = true;
  DateTime dateOfBirth = DateTime.now();
  File? selectedImageFile;

  FillProfileBloc(
    this.createUserUsecase,
    this.pickImageUsecase,
    this.getEmailUsecase,
  ) : super(FillProfileInitialState()) {
    on<UpdateFillProfileEvent>(_handleUpdateEvent);
    on<UpdateFillDateOfBirthEvent>(_handleDateOfBirth);
    on<UpdateFillGenderEvent>(_handleGenderEvent);
    on<PickImageEvent>(_handlePickImageEvent);
  }

  FutureOr<void> _handleUpdateEvent(
      UpdateFillProfileEvent event, Emitter<FillProfileState> emit) async {
    if (selectedImageFile != null) {
      emit(FillProfileLoadingState());
      String? currentEmail = getEmailUsecase();
      if (currentEmail != null) {
        UserProfile user = UserProfile(
            name: event.fullName,
            nickName: event.nickName,
            email: currentEmail,
            isMale: isMale,
            dateOfBirth: dateOfBirth,
            profileImageUrl: selectedImageFile!.path);
        var result = await createUserUsecase(user);
        if (result.isRight()) {
          emit(FillProfileLoadedState());
        } else {
          emit(FillProfileErrorState('Unable to register profile'));
        }
      } else {
        emit(FillProfileErrorState('Not a registered user'));
      }
    }
  }

  FutureOr<void> _handleDateOfBirth(
      UpdateFillDateOfBirthEvent event, Emitter<FillProfileState> emit) {
    dateOfBirth = event.dateOfBirth;
  }

  FutureOr<void> _handleGenderEvent(
      UpdateFillGenderEvent event, Emitter<FillProfileState> emit) {
    isMale = event.isMale;
  }

  FutureOr<void> _handlePickImageEvent(
      PickImageEvent event, Emitter<FillProfileState> emit) async {
    var result = await pickImageUsecase(AppImageSource.gallery);
    if (result.isRight()) {
      selectedImageFile = result.getOrElse(
        () => File(''),
      );
    }
  }
}
