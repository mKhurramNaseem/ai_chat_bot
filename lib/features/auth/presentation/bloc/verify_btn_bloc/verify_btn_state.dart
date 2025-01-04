part of 'verify_btn_bloc.dart';

@immutable
sealed class VerifyBtnState {}

final class VerifyBtnVisibleState extends VerifyBtnState {}

final class VerifyBtnInVisibleState extends VerifyBtnState {}
