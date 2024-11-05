
import 'package:ai_chat_bot/core/services/otp_service.dart';
import 'package:ai_chat_bot/features/auth/data/models/user_auth_data_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ai_chat_bot/features/auth/data/source/user_auth_source.dart';

class UserAuthSourceImpl extends UserAuthSource {  
  static const _collectionName = 'Users';
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference<Map<String, dynamic>> usersCollection;
  final OTPService otpService;
  UserAuthSourceImpl(this.otpService) {
    usersCollection = firestore.collection(_collectionName);    
  }

  @override
  Future<bool> isUserExists(UserAuthDataModel userAuth) async{
    var querySnapShot = await usersCollection.where(UserAuthDataModel.emailCol,isEqualTo: userAuth.email).get();                
    return querySnapShot.docs.isNotEmpty;        
  }

  @override
  Future<void> createAccount(
      UserAuthDataModel userAuth) async {
        await usersCollection.doc().set(userAuth.toMap());                
  }

  @override
  Future<void> createNewPassword(UserAuthDataModel userAuth) async {    
    String? docId = await _getDocumentId(userAuth.email); 
    if(docId != null){
      await usersCollection.doc(docId).update(userAuth.toMap());
    }
  }


  @override
  Future<bool> sendOTP(String email) async{
    var isSend = await otpService.sendOtp(email);
    return isSend;
  }

  @override
  bool verifyOTP(String otp) {
    return otpService.verifyOtp(otp);
  }

  Future<String?> _getDocumentId(String email) async{
    var querySnapShot = await usersCollection.where(UserAuthDataModel.emailCol,isEqualTo: email).get();                
    if(querySnapShot.docs.isNotEmpty){
      return querySnapShot.docs.first.id;
    }
    return Future.value(null);
  }
}
