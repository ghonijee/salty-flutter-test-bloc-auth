import 'package:salty_flutter_test/model/user_model.dart';

abstract class HomeState {}

class HomeListDataUserInit extends HomeState {}

class HomeListDataUserLoading extends HomeState {}

class HomeListDataUserLoaded extends HomeState {
  List<UserModel> data;

  HomeListDataUserLoaded(this.data);
}
