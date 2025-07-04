import 'package:chennai_demo/home/controller/home_bloc/home_bloc.dart';
import 'package:chennai_demo/home/controller/home_bloc/home_event.dart';
import 'package:chennai_demo/home/controller/home_bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        context.read<HomeBloc>().add(HomeFetchEvent());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home List")),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading &&
              context.read<HomeBloc>().homeList.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeError) {
            return Center(child: Text(state.message));
          } else if (state is HomeLoaded) {
            return ListView.builder(
              controller: _scrollController,
              itemCount: state.homes.length + (state.hasMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index < state.homes.length) {
                  return HomeTile(home: state.homes[index]);
                } else {
                  return const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
