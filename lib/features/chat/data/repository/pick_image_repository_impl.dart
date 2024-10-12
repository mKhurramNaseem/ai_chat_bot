import 'dart:io';

import 'package:ai_chat_bot/core/util/app_enums.dart';
import 'package:ai_chat_bot/core/util/app_errors.dart';
import 'package:ai_chat_bot/features/chat/data/source/local/platform/image_source.dart';
import 'package:ai_chat_bot/features/chat/domain/repository/pick_image_repository.dart';
import 'package:dartz/dartz.dart';

class PickImageRepositoryImpl extends PickImageRepository{
  final PlatformImageSource platformImageSource;

  PickImageRepositoryImpl({required this.platformImageSource});
  @override
  Future<Either<ImageFailure, File>> pickImage(AppImageSource imageSource) async{
    try{
      var file = await platformImageSource.pickImage(imageSource);
      if(file != null){
        return Right(file);
      }
      return Left(ImageNotSelectedFailure());      
    }catch(e){
      return Left(ImageExceptionFailure());
    }    
  }
}