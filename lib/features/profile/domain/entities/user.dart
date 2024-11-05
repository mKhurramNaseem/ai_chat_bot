class UserProfile {
  String name;
  String nickName;
  String email;
  bool isMale;
  DateTime dateOfBirth;
  String profileImageUrl;

  UserProfile({
    required this.name,
    required this.nickName,
    required this.email,
    required this.isMale,
    required this.dateOfBirth,
    required this.profileImageUrl,
  });
}
