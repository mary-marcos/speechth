import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speechth/src/domain/models/sign_up_model.dart';
import 'package:speechth/src/domain/models/user_model.dart';
import 'package:speechth/src/domain/repositries/user_repo.dart';
import 'package:speechth/src/presentation/cubits/user_cubit/state.dart';
import 'package:speechth/src/presentation/widgets/appWidgets/components/toasters.dart';
import 'package:speechth/src/utils/strings/routes_names.dart';
import 'package:speechth/src/utils/variables/routerkeys.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepo _userRepo;

  UserCubit(this._userRepo) : super(InitState());

  static UserCubit get(context, {bool listen = false}) =>
      BlocProvider.of<UserCubit>(context, listen: listen);

  SignUpModel _signUpModel = SignUpModel();

  SignUpModel get signUpModel => _signUpModel;
  final PageController _pageController = PageController();

  PageController get pageController => _pageController;

  final List<GlobalKey<FormState>> _formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>()
  ];

  List<GlobalKey<FormState>> get formKeys => _formKeys;

  jumpToPage(index, {bool isBack = false}) {
    if (!isBack && (_formKeys[index - 1].currentState?.validate() ?? false)) {
      _pageController.jumpToPage(index);
    } else if (isBack) {
      _pageController.jumpToPage(index);
    }
  }

  bool _loadingSignUp = false;

  bool get loadingSignUp => _loadingSignUp;

  resetSingUpModel() {
    _signUpModel = SignUpModel();
  }

  signUp() async {
    _loadingSignUp = true;
    emit(SignUpLoading());
    final String? status = await _userRepo.signUp(signUpModel);
    if (status.toString() == "success") {
      emit(SignUpSuccess());
      final status = await getUserData();
      _loadingSignUp = false;

      RouterKeys.mainNavigatorKey.currentState?.pushNamedAndRemoveUntil(
          status ? RouteName.levelScreen : RouteName.homeScreen,
          (route) => false);
    } else {
      if (status != null) {
        Toasters.show(status);
      }
      _loadingSignUp = false;
      emit(SignUpError());
    }
  }

  signIn({required String email, required String password}) async {
    emit(SignInLoading());

    final bool success =
        await _userRepo.signIn(email: email, password: password);
    if (success) {
      emit(SignInSuccess());
      RouterKeys.mainNavigatorKey.currentState
          ?.pushNamedAndRemoveUntil(RouteName.homeScreen, (route) => false);
    } else {
      Toasters.show("البريد الالكتروني او كلمة السر غير صحيح");
      emit(SignInError());
    }
  }

  logout() async {
    await _userRepo.logout();
    RouterKeys.mainNavigatorKey.currentState
        ?.pushNamedAndRemoveUntil(RouteName.loginScreen, (route) => false);
  }

  UserModel? _userModel;

  UserModel? get userModel => _userModel;

  Future<bool> getUserData() async {
    bool status = false;
    emit(GetUserDataLoading());
    final result = await _userRepo.getUserData();
    if (result != null) {
      _userModel = UserModel.fromJson(result);
      status = true;
      emit(GetUserDataSuccess());
    } else {
      status = false;
      emit(GetUserDataError());
    }
    return status;
  }

  Future<bool> setCurrentTest(UserModel userModel) async {
    emit(SetCurrentTestLoading());
    final bool success = await _userRepo.setCurrentTest(userModel);
    if (success) {
      await getUserData();
      emit(SetCurrentTestSuccess());
    } else {
      emit(SetCurrentTestError());
    }
    return success;
  }

  Future<bool> sendFeedBack(String message) async {
    emit(SendFeedBackLoading());
    final bool success = await _userRepo.sendFeedBack(message);
    if (success) {
      Toasters.show("تم الارسال", isError: false);
      emit(SendFeedBackSuccess());
    } else {
      Toasters.show("برجاء المحاوله مره اخري");
      emit(SendFeedBackError());
    }
    return success;
  }
}
