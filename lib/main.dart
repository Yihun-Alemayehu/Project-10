import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_10/bloc/social_media_bloc.dart';
import 'package:project_10/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SocialMediaBloc()..add(FetchPostsEvent()),
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
