
sealed class FavState {}

final class FavInitial extends FavState {}

final class FavLoading extends FavState {}

final class FavAddSuccess extends FavState {}

final class FavSuccess extends FavState {
  final List<dynamic> list;
  FavSuccess({required this.list});
}
final class FavDelete extends FavState{}
final class FavAddFailed extends FavState {}
