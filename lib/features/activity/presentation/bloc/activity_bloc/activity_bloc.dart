import 'dart:async';

import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/activity/domain/entities/activity.dart';
import 'package:ai_chat_bot/features/activity/domain/usecase/get_activites_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'activity_event.dart';
part 'activity_state.dart';

class ActivityBloc extends Bloc<ActivityEvent, ActivityState> {
  final GetActivitesUsecase getActivitesUsecase;
  ActivityBloc({required this.getActivitesUsecase,}) : super(ActivityInitialState()) {
    on<ActivityEventFetchEvent>(_handleActivityFetchEvent);
  }

  FutureOr<void> _handleActivityFetchEvent(ActivityEventFetchEvent event, Emitter<ActivityState> emit) async{
    var activites = await getActivitesUsecase();
    if(activites.isEmpty){
      emit(ActivityEmptyState());
    }else{
      emit(ActivityDoneState(activites));
    }    
  }
}
