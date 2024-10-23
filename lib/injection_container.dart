import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/activity/data/repository/activity_repository_impl.dart';
import 'package:ai_chat_bot/features/activity/data/source/local/activity_local_source.dart';
import 'package:ai_chat_bot/features/activity/data/source/local/activity_local_source_impl.dart';
import 'package:ai_chat_bot/features/activity/domain/repository/activity_repository.dart';
import 'package:ai_chat_bot/features/activity/domain/usecase/get_activites_usecase.dart';
import 'package:ai_chat_bot/features/activity/domain/usecase/record_activity_usecase.dart';
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
import 'package:ai_chat_bot/features/chat/domain/usecases/start_chat_usecase.dart';
import 'package:sqflite/sqflite.dart';

var sl = GetIt.instance;

Future<void> initDependencies()async{
  await initDb();
  initChats();
  initActivity();
}

Future<void> initDb() async{
  var db = await DbInitializer.initialize();
  sl.registerLazySingleton<Database>(() => db,);
}

void initChats() {  
  sl.registerLazySingleton(
    () => GetUpdatedChatUsecase(sl()),
  );
  sl.registerLazySingleton(
    () => GetPreviousChatUsecase(sl()),
  );
  sl.registerLazySingleton(
    () => CreateChatUsecase(sl()),
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
  sl.registerLazySingleton<ChatLocalDataSource>(
    () => ChatMessageLocalDataSourceImpl(db: sl()),
  );
  sl.registerLazySingleton<ChatMesssagesRemoteDataSource>(
    () => ChatMesssagesRemoteSourceImpl(),
  );
  sl.registerLazySingleton(
    () => GetActiveChatsUsecase(chatMessagesRepository: sl()),
  );
  sl.registerLazySingleton(
    () => StartChatUsecase(repository: sl()),
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
  sl.registerLazySingleton(
    () => PickImageUsecase(imageRepository: sl()),
  );
  sl.registerLazySingleton<PickImageRepository>(
    () => PickImageRepositoryImpl(platformImageSource: sl()),
  );
  sl.registerLazySingleton<PlatformImageSource>(
    () => PlatformImageSourceImpl(),
  );
  sl.registerLazySingleton(
    () => SaveImageToGalleryUsecase(saveImageRepository: sl()),
  );
  sl.registerLazySingleton<SaveImageRepository>(
    () => SaveImageRepositoryImpl(imageSource: sl()),
  );  
  
}

void initActivity() {
  sl.registerLazySingleton(() => GetActivitesUsecase(sl()),);
  sl.registerLazySingleton(() => RecordActivityUsecase(repository: sl()),);
  sl.registerLazySingleton<ActivityRepository>(() => ActivityRepositoryImpl(source: sl()),);
  sl.registerLazySingleton<ActivityLocalSource>(() => ActivityLocalSourceImpl(sl()),);
}