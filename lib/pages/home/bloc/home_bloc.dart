import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salty_flutter_test/pages/home/bloc/home_event.dart';
import 'package:salty_flutter_test/pages/home/bloc/home_state.dart';
import 'package:salty_flutter_test/services/user_service.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final UserService _service;

  HomeBloc(UserService userService)
      : _service = userService,
        super(HomeListDataUserInit()) {
    on<HomeUserDataLoaded>((event, emit) async {
      emit(HomeListDataUserLoading());
      var result = await _service.list(event.page);
      emit(HomeListDataUserLoaded(result));
    });
  }
}
