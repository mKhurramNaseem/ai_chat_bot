import 'dart:typed_data';

import 'package:ai_chat_bot/core/util/app_errors.dart';
import 'package:dartz/dartz.dart';

abstract class SaveImageRepository {
  Future<Either<ImageFailure,String>> saveImage(Uint8List imageBytes);
}