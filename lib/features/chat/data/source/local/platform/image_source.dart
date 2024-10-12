 import 'dart:io';

import 'package:ai_chat_bot/core/core.dart';
   
abstract class PlatformImageSource {
  Future<File?> pickImage(AppImageSource imageSource);
  Future<String?> saveImage(Uint8List imageBytes);
 }