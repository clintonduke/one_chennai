import 'package:chennai_demo/utils/utils.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<HomeModel> homes;
  final bool hasMore;
  HomeLoaded(this.homes, this.hasMore);
}

class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}
