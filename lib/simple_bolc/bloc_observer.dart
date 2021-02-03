import 'package:bloc/bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(cubit, error, stackTrace);
    print(error);
  }
}
