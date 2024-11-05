// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'edit_profile_bloc.dart';

@immutable 
abstract class EditProfileEvent {}

@immutable
class UpdateProfileEvent extends EditProfileEvent {
  final String fullName , nickName , email , profileImagePath;  
  UpdateProfileEvent({
    required this.fullName,
    required this.nickName,
    required this.email,
    required this.profileImagePath,      
  });
}

@immutable
class UpdateGenderEvent extends EditProfileEvent { 
  final bool isMale;
  UpdateGenderEvent({    
    required this.isMale,    
  });
}

@immutable
class UpdateDateOfBirthEvent extends EditProfileEvent { 
  final DateTime dateOfBirth;
  UpdateDateOfBirthEvent({    
    required this.dateOfBirth,    
  });
}
