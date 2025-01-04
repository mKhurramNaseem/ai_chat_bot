import 'dart:developer';

import 'package:ai_chat_bot/features/profile/domain/entities/user.dart';
import 'package:ai_chat_bot/features/profile/domain/usecases/get_user_usecase.dart';
import 'package:ai_chat_bot/shared/domain/usecases/get_email_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final GetUserUsecase getUserUsecase;
  final GetEmailUsecase getEmailUsecase;
  String? email;
  UserProfile? userProfile;
  SettingsBloc({
    required this.getUserUsecase,
    required this.getEmailUsecase,
  }) : super(SettingsInitialState()) {
    on<SettingsGetDataEvent>((event, emit) async {
      email = getEmailUsecase();
      emit(SettingsEmailUpdateState());
      if (email != null) {
        var result = await getUserUsecase(email!);
        log(result.isRight().toString());
        result.fold(
          (l) {},
          (r) {
            userProfile = result.getOrElse(
              () => UserProfile(
                  name: '',
                  nickName: '',
                  email: '',
                  isMale: true,
                  dateOfBirth: DateTime.now(),
                  profileImageUrl: ''),
            );
            emit(SettingsNameUpdateState());
          },
        );
      }
    });
  }
}
