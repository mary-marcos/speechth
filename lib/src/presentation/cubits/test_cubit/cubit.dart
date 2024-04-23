import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speechth/src/domain/models/level_model.dart';
import 'package:speechth/src/domain/models/user_model.dart';
import 'package:speechth/src/presentation/cubits/test_cubit/state.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speechth/src/presentation/cubits/user_cubit/cubit.dart';
import 'package:speechth/src/presentation/widgets/appWidgets/components/toasters.dart';
import 'package:speechth/src/utils/strings/routes_names.dart';
import 'package:speechth/src/utils/variables/routerkeys.dart';

class TestCubit extends Cubit<TestState> {
  TestCubit(this._currentLevel, this._currentCategory, this._currentTest)
      : super(InitState()) {
    print('_currentLevel');
    print(_currentLevel);
    print('_currentCategory');
    print(_currentCategory);
    print('_currentTest');
    print(_currentTest);
    _loadTest();
  }

  static TestCubit get(context, {bool listen = false}) =>
      BlocProvider.of<TestCubit>(context, listen: listen);
  List<LevelModel> _levels = [];
  LevelModel? _levelModel;

  TestModel? _testModel;
  CategoryModel? _categoryModel;

  TestModel? get testModel => _testModel;
  final int _currentLevel;

  int _currentCategory;

  int _currentTest = 0;

  int get currentTest => _currentTest;

  _loadTest() async {
    emit(LoadTestLoading());
    String jsonString =
        await rootBundle.loadString('assets/testData/tests.json');

    var result = json.decode(jsonString);
    _levels = result.map<LevelModel>((e) => LevelModel.fromJson(e)).toList();
    if (_levels.any((element) => element.level == _currentLevel)) {
      _levelModel =
          _levels.firstWhere((element) => element.level == _currentLevel);

      _categoryModel = _levelModel?.categories
          ?.firstWhere((element) => element.id == _currentCategory);
      _testModel = _categoryModel?.tests
          ?.firstWhere((element) => element.id == _currentTest);
      print('testModel.id');
      print(testModel?.id);
    } else {
      _currentTest = 0;
    }
    emit(LoadTestSuccess());
  }

  setNextTest(BuildContext context) async {
    if (_testModel?.nextTest == null) {
      if (_testModel?.nextCategory != null) {
        _categoryModel = _levelModel?.categories
            ?.firstWhere((element) => element.id == _testModel?.nextCategory);
      } else {
        if (_testModel?.isLast ?? false) {
          _currentCategory = 1;
          Toasters.show("تم اجتياز المستوي $_currentLevel", isError: false);
          RouterKeys.mainNavigatorKey.currentState
              ?.pushNamedAndRemoveUntil(RouteName.homeScreen, (route) => false);
        }
      }
    }
    final UserCubit userCubit = UserCubit.get(context);
    final points = int.tryParse(userCubit.userModel?.points ?? "") ?? 0;
    final success = await userCubit.setCurrentTest(UserModel(
        level: " ${_testModel?.nextLevel ?? _currentLevel}",
        category: " ${_testModel?.nextCategory ?? _currentCategory}",
        test: " ${_testModel?.nextTest ?? 1}",
        points: " ${points + (_testModel?.points ?? 0)}",
        levelProgress:
            "${_testModel?.nextLevel == null ? ((_testModel?.testNum ?? 0) / (_levelModel?.testsNum ?? 1)) : 0.0}"));
    if (success) {
      RouterKeys.mainNavigatorKey.currentState
          ?.pushNamed(RouteName.passScreen, arguments: _testModel?.points ?? 0);
      _testModel = _categoryModel?.tests
          ?.firstWhere((element) => element.id == (_testModel?.nextTest ?? 1));
      _currentTest = _testModel?.id ?? 1;
    }

    emit(ChangeCurrentTestState());
  }

  ///AudioTest
  String _text = '';

  String get text => _text;
  final SpeechToText _speech = SpeechToText();
  bool _isListening = false;
  double _confidence = 1.0;

  resetText() {
    _text = '';
    emit(ListenState());
  }

  void listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );

      if (available) {
        var locales = await _speech.locales();
        print(locales.map((e) => e.name).toList());
        var selectedLocale = locales
            .where((element) =>
                element.name.contains("Arabic") && element.name.contains("Egy"))
            .first;
        print(selectedLocale.name);
        _isListening = true;
        _speech.listen(
            onResult: (val) {
              _text = val.recognizedWords;
              emit(ListenState());
              if (val.hasConfidenceRating && val.confidence > 0) {
                _confidence = val.confidence;
              }
            },
            localeId: selectedLocale.localeId);
      }
    } else {
      _isListening = false;
      _speech.stop();
    }

    emit(ListenState());
  }

  stopSpeech() {
    _isListening = false;
    _speech.stop();
  }

  ///McqTest

  chooseAnswer({required bool isAnswer, required int index}) {
    _testModel?.mcq?.forEach((element) {
      element.answer = null;
    });
    _testModel?.mcq?[index].answer = isAnswer;
    emit(ChooseAnswerTestState());
  }
}
