import 'dart:typed_data';

import 'package:ai_chat_bot/core/util/app_errors.dart';
import 'package:ai_chat_bot/features/chat/domain/repository/save_image_repository.dart';
import 'package:dartz/dartz.dart';

class SaveImageToGalleryUsecase {
  final SaveImageRepository saveImageRepository;

  SaveImageToGalleryUsecase({required this.saveImageRepository});

  Future<Either<ImageFailure,String>> call(Uint8List imageBytes){
    return saveImageRepository.saveImage(imageBytes);
  }
}