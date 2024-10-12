import 'dart:typed_data';

import 'package:ai_chat_bot/core/util/app_errors.dart';
import 'package:ai_chat_bot/features/chat/data/source/local/platform/image_source.dart';
import 'package:ai_chat_bot/features/chat/domain/repository/save_image_repository.dart';
import 'package:dartz/dartz.dart';

class SaveImageRepositoryImpl extends SaveImageRepository{
  final PlatformImageSource imageSource;

  SaveImageRepositoryImpl({required this.imageSource});
  @override
  Future<Either<ImageFailure, String>> saveImage(Uint8List imageBytes) async{
    try{
      var result = await imageSource.saveImage(imageBytes);
      if(result != null){
        return Right(result);
      }
      return Left(ImageFailure());
    }catch(e){
      return Left(ImageFailure());
    }
    
  }
}