import 'package:chennai_demo/utils/utils.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;
  int limit = 10;
  int skip = 0;
  bool isFetching = false;
  List<HomeModel> homeList = [];

  HomeBloc({required this.homeRepository}) : super(HomeInitial()) {
    on<HomeFetchEvent>((event, emit) async {
      if (isFetching) return;
      isFetching = true;
      try {
        if (homeList.isEmpty) {
          emit(HomeLoading());
        }
        final homes = await homeRepository.fetchHomeList(limit, skip);
        homeList.addAll(homes);
        skip += limit;
        emit(HomeLoaded(homeList, homes.length == limit));
      } catch (e) {
        emit(HomeError(e.toString()));
      } finally {
        isFetching = false;
      }
    });
  }
}
