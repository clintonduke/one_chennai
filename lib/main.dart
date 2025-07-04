import 'package:chennai_demo/utils/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home List Pagination',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create:
            (_) =>
                HomeBloc(homeRepository: HomeRepository())
                  ..add(HomeFetchEvent()),
        child: const HomePage(),
      ),
    );
  }
}
