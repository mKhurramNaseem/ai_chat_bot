part of 'verify_btn_bloc.dart';

@immutable
sealed class VerifyBtnEvent {}

class VerifyBtnVisibleEvent extends VerifyBtnEvent{}

class VerifyBtnInVisibleEvent extends VerifyBtnEvent{}
