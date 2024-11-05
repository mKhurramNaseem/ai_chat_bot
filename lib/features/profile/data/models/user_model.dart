import 'package:ai_chat_bot/features/profile/domain/entities/user.dart';

class UserModel extends User {
  static const tableName = 'UserTable';
  static const nameCol = 'name';
  static const nickNameCol = 'nickName';
  static const emailCol = 'email';
  static const genderCol = 'gender';
  static const dateOfBirthCol = 'dateOfBirth';
  static const profileImageCol = 'profileImage';

  UserModel(
      {required super.name,
      required super.nickName,
      required super.email,
      required super.isMale,
      required super.dateOfBirth,
      required super.profileImageUrl});

  UserModel.fromMap(Map<String, dynamic> map)
      : this(
            name: map[nameCol],
            nickName: map[nickNameCol],
            email: map[emailCol],
            isMale: map[genderCol] == 0,
            dateOfBirth: DateTime.fromMillisecondsSinceEpoch(map[dateOfBirthCol]),
            profileImageUrl: map[profileImageCol]);

  Map<String , dynamic> toMap(){
    return {
      nameCol : name,
      nickNameCol : nickName,
      emailCol : email,
      genderCol : isMale ? 0 : 1,
      dateOfBirthCol : dateOfBirth.millisecondsSinceEpoch,
      profileImageCol : profileImageUrl,
    };
  }

  UserModel.fromUser(User user):this(name: user.name , nickName: user.nickName ,email: user.email , dateOfBirth: user.dateOfBirth, isMale: user.isMale , profileImageUrl: user.profileImageUrl);
}