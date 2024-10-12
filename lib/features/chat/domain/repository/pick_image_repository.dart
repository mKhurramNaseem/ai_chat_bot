import 'dart:io';

import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/core/util/app_errors.dart';
import 'package:dartz/dartz.dart';

abstract class PickImageRepository {
  Future<Either<ImageFailure,File>> pickImage(AppImageSource imageSource);
}