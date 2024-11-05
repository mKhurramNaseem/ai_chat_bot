import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/shared/data/repository/email_repository_impl.dart';
import 'package:ai_chat_bot/shared/data/source/email_source.dart';
import 'package:ai_chat_bot/shared/data/source/email_source_impl.dart';
import 'package:ai_chat_bot/shared/domain/repository/email_repository.dart';
import 'package:ai_chat_bot/shared/domain/usecases/get_email_usecase.dart';
import 'package:ai_chat_bot/shared/domain/usecases/set_email_usecase.dart';

var sl = GetIt.instance;

Future<void> initDependencies() async {
  await initAllDb();
  initChats();
  initActivity();
  initProfile();
}

Future<void> initAllDb() async {
  var db = await DbInitializer.initialize();
  sl.registerLazySingleton<Database>(
    () => db,
  );
  var sharedPreference = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(
    () => sharedPreference,
  );
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
  sl.registerLazySingleton(
    () => GetActivitesUsecase(sl()),
  );
  sl.registerLazySingleton(
    () => RecordActivityUsecase(repository: sl()),
  );
  sl.registerLazySingleton<ActivityRepository>(
    () => ActivityRepositoryImpl(source: sl()),
  );
  sl.registerLazySingleton<ActivityLocalSource>(
    () => ActivityLocalSourceImpl(sl()),
  );
}

void initProfile() {
  sl.registerLazySingleton(
    () => UpdateUserUsecase(sl()),
  );
  sl.registerLazySingleton(
    () => CreateUserUsecase(sl()),
  );
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<UserDb>(
    () => UserDbImpl(db: sl()),
  );
  sl.registerLazySingleton(
    () => GetEmailUsecase(sl()),
  );
  sl.registerLazySingleton(
    () => SetEmailUsecase(sl()),
  );
  sl.registerLazySingleton<EmailRepository>(
    () => EmailRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<EmailSource>(
    () => EmailSourceImpl(sl()),
  );
}
