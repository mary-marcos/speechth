abstract class UserState {}

class InitState extends UserState {}

class SignInLoading extends UserState {}

class SignInSuccess extends UserState {}

class SignInError extends UserState {}

class SignUpLoading extends UserState {}

class SignUpSuccess extends UserState {}

class SignUpError extends UserState {}
class GetUserDataLoading extends UserState {}
class GetUserDataSuccess extends UserState {}

class GetUserDataError extends UserState {}
class SetCurrentTestLoading extends UserState {}

class SetCurrentTestSuccess extends UserState {}

class SetCurrentTestError extends UserState {}
class SendFeedBackLoading extends UserState {}

class SendFeedBackSuccess extends UserState {}

class SendFeedBackError extends UserState {}