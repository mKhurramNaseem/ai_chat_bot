import 'dart:developer';
import 'package:ai_chat_bot/core/util/app_errors.dart';
import 'package:ai_chat_bot/features/chat/data/models/chat_message_model.dart';
import 'package:ai_chat_bot/features/chat/data/source/local/db/local_source.dart';
import 'package:ai_chat_bot/features/chat/data/source/remote/remote_source.dart';
import 'package:ai_chat_bot/features/chat/domain/entities/chat.dart';
import 'package:ai_chat_bot/features/chat/domain/entities/chat_message.dart';
import 'package:ai_chat_bot/features/chat/domain/repository/chat_repository.dart';
import 'package:dartz/dartz.dart';

const _fileName = 'chat_repository_impl.dart';

class ChatRepositoryImpl extends ChatMessagesRepository {
  final ChatLocalDataSource localDataSource;
  final ChatMesssagesRemoteDataSource remoteDataSource;
  ChatRepositoryImpl(
    this.localDataSource,
    this.remoteDataSource,
  );

  @override
  Future<Either<ChatFailure, List<ChatMessage>>> getPreviousMessagesList(
      int chatId) async {
    try {
      var chatMessages = await localDataSource.getMessages(chatId);
      return Right(chatMessages);
    } catch (e) {
      return Left(ChatFailure());
    }
  }

  @override
  Future<Either<ChatFailure, List<ChatMessage>>> getUpdatedMessagesList(
    int chatId,
    ChatMessageModel message,
  ) async {
    log('Called()',name: _fileName , error: getUpdatedMessagesList.toString());
    try {
      var answer = await remoteDataSource.sendMessage(
        message,        
      );            
      log('Answer : $answer',name: _fileName , error: getUpdatedMessagesList.toString());
      var isAdded = await localDataSource.addMessage(chatId, answer);      
      await localDataSource.updateChatLastMessage(chatId, answer.message);
      if (isAdded) {
        var chatMessages = await localDataSource.getMessages(chatId);
        return Right(chatMessages);
      } else {
        return Left(ChatFailure());
      }
    } catch (e) {
      log('Error : ${e.toString()}' , name: 'chat_repository_impl.dart');
      return Left(ChatFailure());
    }
  }

  @override
  Future<Either<ChatFailure, List<ChatMessage>>>
      getUpdatedMessagesListForSender(
    int chatId,
    ChatMessageModel message,
  ) async {
    try {
      await localDataSource.updateChatLastMessage(chatId, message.message);
      await localDataSource.addMessage(chatId, message);
      var chatMessages = await localDataSource.getMessages(chatId);
      return Right(chatMessages);
    } catch (e) {      
      return Left(ChatFailure());
    }
  }

  @override
  Future<Either<ChatFailure, int>> createChat() async {
    try {
      var isCreated = await localDataSource.createChat();
      return Right(isCreated);
    } catch (e) {      
      return Left(ChatFailure());
    }
  }

  @override
  Future<Either<ChatFailure, List<Chat>>> getActiveChats() async {
    try {
      var allChats = await localDataSource.getAllChats();

      return Right(allChats
          .where(
            (element) => !element.isEnded,
          )
          .toList());
    } catch (e) {      
      return Left(ChatFailure());
    }
  }

  @override
  Future<Either<ChatFailure, List<Chat>>> getEndedChats() async {
    try {
      var allChats = await localDataSource.getAllChats();

      return Right(allChats
          .where(
            (element) => element.isEnded,
          )
          .toList());
    } catch (e) {      
      return Left(ChatFailure());
    }
  }

  @override
  Future<Either<ChatFailure, bool>> endCurrentSession(int chatId) async {
    try {
      var isEnded = await localDataSource.endChat(chatId);
      return Right(isEnded);
    } catch (e) {      
      return Left(ChatFailure());
    }
  }

  @override
  Future<Either<ChatFailure, bool>> deleteChat(int chatId) async{
    try{
      var isChatEnded = await localDataSource.deleteChat(chatId);
      var isMessageEnded = await localDataSource.deleteMessages(chatId);
      return Right(isChatEnded && isMessageEnded);
    }catch(e){      
      return Left(ChatFailure());
    }
  }


  @override
  Future<Either<ChatFailure, bool>> clearChat(int chatId) async{
    try{
      var isMessagesClear = await localDataSource.deleteMessages(chatId);
      return Right(isMessagesClear);
    }catch(e){
      return Left(ChatFailure());
    }
  }

  @override
  Future<Either<ChatFailure, void>> startChat(int chatId) async{
    try{
      var history = await localDataSource.getMessages(chatId);
      remoteDataSource.startChat(history);
      return const Right(null);
    }catch(e){
      return Left(ChatFailure());
    }
  }
}
