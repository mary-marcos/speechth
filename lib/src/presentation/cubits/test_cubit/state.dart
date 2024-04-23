
abstract class TestState{}
class InitState extends TestState{}
class ListenState extends TestState{}
class ChangeCurrentTestState extends TestState{}
class ChooseAnswerTestState extends TestState{}

class LoadTestLoading extends TestState {}

class LoadTestSuccess extends TestState {}

class LoadTestError extends TestState {}