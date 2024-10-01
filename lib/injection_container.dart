import 'package:ai_chat_bot/core/core.dart';

var sl = GetIt.instance;

void initChats() async {  
  sl.registerLazySingleton(
    () => GetUpdatedChatUsecase(
      sl(),
    ),
  );
  sl.registerLazySingleton(
    () => GetPreviousChatUsecase(
      sl(),
    ),
  );
  sl.registerLazySingleton(
    () => StartChatUsecase(
      sl(),
    ),
  );
  sl.registerLazySingleton(() => SendMessageUsecase(sl(),),);
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
  sl.registerLazySingleton(() => GetActiveChatsUsecase(chatMessagesRepository: sl()),);
}
