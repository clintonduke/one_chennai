import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:chennai_demo/home/controller/home_bloc/home_bloc.dart';
import 'package:chennai_demo/home/controller/home_bloc/home_event.dart';
import 'package:chennai_demo/home/service/home_service.dart';
import 'package:chennai_demo/home/view/home_page.dart';

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
