import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speechth/src/presentation/cubits/main_cubit/state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(InitState());

  static MainCubit get(context, {bool listen = false}) =>
      BlocProvider.of<MainCubit>(context, listen: listen);


}
