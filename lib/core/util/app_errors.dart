
class ChatException implements Exception{}

class ChatFailure{}
class ActivityFailure{}
class ImageFailure{}
class ImageNotSelectedFailure extends ImageFailure{}
class ImageExceptionFailure extends ImageFailure{}
class UserFailure{}

class UserAlreadyExistsFailure extends UserFailure{}
class InvalidPasswordFailure extends UserFailure{}
class UserNotFoundFailure extends UserFailure{}




class UserAlreadyExistsException implements Exception{
}

class InvalidPasswordException implements Exception{
}

class UserNotFoundException implements Exception{
}