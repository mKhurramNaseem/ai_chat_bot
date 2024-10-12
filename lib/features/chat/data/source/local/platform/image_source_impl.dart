import 'dart:io';
import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/chat/data/source/local/platform/image_source.dart';
import 'package:path_provider/path_provider.dart';

class PlatformImageSourceImpl extends PlatformImageSource{
  static final imagePicker = ImagePicker();
  @override
  Future<File?> pickImage(AppImageSource imageSource) async{
    if(imageSource == AppImageSource.camera){
       var xfile = await imagePicker.pickImage(source: ImageSource.camera);
       return xfile != null ? File(xfile.path) : null;        
    } 
    var xfile = await imagePicker.pickImage(source: ImageSource.gallery);
    return xfile != null ? File(xfile.path) : null;    
  }

@override
  Future<String?> saveImage(Uint8List imageBytes) async{
    var directory = await getApplicationDocumentsDirectory();
    File file = File('${directory.path}/${DateTime.now().millisecondsSinceEpoch}.jpeg');
    var filePath = (await file.writeAsBytes(imageBytes)).path;        
    return filePath;
  }
}