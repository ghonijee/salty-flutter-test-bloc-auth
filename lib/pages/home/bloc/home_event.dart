abstract class HomeEvent {}

class HomeUserDataLoaded extends HomeEvent {
  int page;

  HomeUserDataLoaded(this.page);
}
