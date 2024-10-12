import 'dart:io';

import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/core/util/app_errors.dart';
import 'package:ai_chat_bot/features/chat/domain/repository/pick_image_repository.dart';
import 'package:dartz/dartz.dart';

class PickImageUsecase {
  final PickImageRepository imageRepository;

  PickImageUsecase({required this.imageRepository});
  Future<Either<ImageFailure , File>> call(AppImageSource imageSource){    
    return imageRepository.pickImage(imageSource);
  }
}