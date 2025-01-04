part of 'fill_profile_bloc.dart';

@immutable
sealed class FillProfileEvent {}

@immutable
class UpdateFillProfileEvent extends FillProfileEvent {
  final String fullName , nickName;  
  UpdateFillProfileEvent({
    required this.fullName,
    required this.nickName,     
  });
}

@immutable
class UpdateFillGenderEvent extends FillProfileEvent { 
  final bool isMale;
  UpdateFillGenderEvent({    
    required this.isMale,    
  });
}

@immutable
class UpdateFillDateOfBirthEvent extends FillProfileEvent { 
  final DateTime dateOfBirth;
  UpdateFillDateOfBirthEvent({    
    required this.dateOfBirth,    
  });
}

@immutable
class UpdateImagePathEvent extends FillProfileEvent { 
  final File imageFile;
  UpdateImagePathEvent({    
    required this.imageFile,    
  });
}


@immutable
class PickImageEvent extends FillProfileEvent{}
