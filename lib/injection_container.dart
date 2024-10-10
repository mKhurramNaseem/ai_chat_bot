import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/chat/domain/usecases/delete_chat_usecase.dart';
import 'package:ai_chat_bot/features/chat/domain/usecases/end_current_session_usecase.dart';
import 'package:ai_chat_bot/features/chat/domain/usecases/get_ended_chats_usecase.dart';

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
  sl.registerLazySingleton(() => EndCurrentSessionUsecase(sl(),),);
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
  sl.registerLazySingleton(() => GetEndedChatsUsecase(chatMessagesRepository: sl()),);
  sl.registerLazySingleton(() => DeleteChatUsecase(chatMessagesRepository:sl()),);
}
