import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'verify_btn_event.dart';
part 'verify_btn_state.dart';

class VerifyBtnBloc extends Bloc<VerifyBtnEvent, VerifyBtnState> {
  VerifyBtnBloc() : super(VerifyBtnInVisibleState()) {
    on<VerifyBtnVisibleEvent>((event, emit) {
      emit(VerifyBtnVisibleState());
    });
    on<VerifyBtnInVisibleEvent>((event, emit) {
      emit(VerifyBtnInVisibleState());
    });
  }
}
