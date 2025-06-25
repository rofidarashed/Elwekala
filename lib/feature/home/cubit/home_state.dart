
sealed class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<dynamic> list;

  HomeSuccess({required this.list});
}

class HomeFailed extends HomeState {}
