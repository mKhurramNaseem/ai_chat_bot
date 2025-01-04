import 'package:ai_chat_bot/features/profile/domain/entities/user.dart';

class UserModel extends UserProfile {
  static const tableName = 'UserTable';
  static const nameCol = 'name';
  static const nickNameCol = 'nickName';
  static const emailCol = 'email';
  static const genderCol = 'gender';
  static const dateOfBirthCol = 'dateOfBirth';
  static const profileImageCol = 'profileImage';

  static const createTable = 'CREATE TABLE IF NOT EXISTS $tableName (id INTEGER PRIMARY KEY AUTOINCREMENT, $nameCol TEXT, $nickNameCol TEXT, $emailCol TEXT, $genderCol INTEGER, $dateOfBirthCol INTEGER, $profileImageCol TEXT)';
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
            dateOfBirth:
                DateTime.fromMillisecondsSinceEpoch(map[dateOfBirthCol]),
            profileImageUrl: map[profileImageCol]);

  Map<String, dynamic> toMap({bool includeEmail = true}) {
    return {
      nameCol: name,
      nickNameCol: nickName,
      if (includeEmail)
      emailCol: email,
      genderCol: isMale ? 0 : 1,
      dateOfBirthCol: dateOfBirth.millisecondsSinceEpoch,
      profileImageCol: profileImageUrl,
    };
  }

  UserModel.fromUser(UserProfile user)
      : this(
            name: user.name,
            nickName: user.nickName,
            email: user.email,
            dateOfBirth: user.dateOfBirth,
            isMale: user.isMale,
            profileImageUrl: user.profileImageUrl);
}
