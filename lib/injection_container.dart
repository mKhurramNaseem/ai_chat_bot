import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/chat/data/repository/pick_image_repository_impl.dart';
import 'package:ai_chat_bot/features/chat/data/repository/save_image_repository_impl.dart';
import 'package:ai_chat_bot/features/chat/data/source/local/db/local_source.dart';
import 'package:ai_chat_bot/features/chat/data/source/local/db/local_source_impl.dart';
import 'package:ai_chat_bot/features/chat/data/source/local/platform/image_source.dart';
import 'package:ai_chat_bot/features/chat/data/source/local/platform/image_source_impl.dart';
import 'package:ai_chat_bot/features/chat/domain/repository/pick_image_repository.dart';
import 'package:ai_chat_bot/features/chat/domain/repository/save_image_repository.dart';
import 'package:ai_chat_bot/features/chat/domain/usecases/clear_chat_usecase.dart';
import 'package:ai_chat_bot/features/chat/domain/usecases/delete_chat_usecase.dart';
import 'package:ai_chat_bot/features/chat/domain/usecases/end_current_session_usecase.dart';
import 'package:ai_chat_bot/features/chat/domain/usecases/get_ended_chats_usecase.dart';
import 'package:ai_chat_bot/features/chat/domain/usecases/pick_image_usecase.dart';
import 'package:ai_chat_bot/features/chat/domain/usecases/save_image_to_gallery_usecase.dart';

var sl = GetIt.instance;

void initChats() async {
  sl.registerLazySingleton(
    () => GetUpdatedChatUsecase(sl()),
  );
  sl.registerLazySingleton(
    () => GetPreviousChatUsecase(sl()),
  );
  sl.registerLazySingleton(
    () => StartChatUsecase(sl()),
  );
  sl.registerLazySingleton(
    () => SendMessageUsecase(sl()),
  );
  sl.registerLazySingleton(
    () => EndCurrentSessionUsecase(sl()),
  );
  sl.registerLazySingleton<ChatMessagesRepository>(
    () => ChatRepositoryImpl(sl(), sl()),
  );
  var db = await DbInitializer.initialize();
  sl.registerLazySingleton<ChatLocalDataSource>(
    () => ChatMessageLocalDataSourceImpl(db: db),
  );
  sl.registerLazySingleton<ChatMesssagesRemoteDataSource>(
    () => ChatMesssagesRemoteSourceImpl(),
  );
  sl.registerLazySingleton(
    () => GetActiveChatsUsecase(chatMessagesRepository: sl()),
  );
  sl.registerLazySingleton(
    () => GetEndedChatsUsecase(chatMessagesRepository: sl()),
  );
  sl.registerLazySingleton(
    () => DeleteChatUsecase(chatMessagesRepository: sl()),
  );
  sl.registerLazySingleton(
    () => ClearChatUsecase(chatMessagesRepository: sl()),
  );
  sl.registerLazySingleton(() => PickImageUsecase(imageRepository: sl()),);
  sl.registerLazySingleton<PickImageRepository>(() => PickImageRepositoryImpl(platformImageSource: sl()),);
  sl.registerLazySingleton<PlatformImageSource>(() => PlatformImageSourceImpl(),);
  sl.registerLazySingleton(() => SaveImageToGalleryUsecase(saveImageRepository: sl()),);
  sl.registerLazySingleton<SaveImageRepository>(() => SaveImageRepositoryImpl(imageSource: sl()),);  
}
