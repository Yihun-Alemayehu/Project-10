import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_10/bloc/social_media_bloc.dart';
import 'package:project_10/data/models/post_model.dart';
import 'dart:developer';

import 'package:project_10/screens/post_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SocialMediaBloc, SocialMediaState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Posts'),
            centerTitle: true,
          ),
          body: Column(
            children: [
              if (state is SocialMediaLoading)
                const CircularProgressIndicator()
              else if (state is SocialMediaLoaded)
                _buildPostsList(state.posts)
              else if (state is SocialMediaError)
                Text(state.errorMessage)
              else
                const Text('I don\'t know what happened to you...')
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.read<SocialMediaBloc>().add(FetchPostsEvent());
            },
            child: const Icon(Icons.refresh),
          ),
        );
      },
    );
  }
}

Widget _buildPostsList(List<Post> posts) {
  return Expanded(
    child: ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PostDetailScreen(post: posts[index]),
              ),
            );
          },
          title: Text(posts[index].username),
          subtitle: Text(posts[index].content),
          trailing: GestureDetector(
              onTap: () {
                context
                    .read<SocialMediaBloc>()
                    .add(LikePostEvent(post: posts[index]));
              },
              child: Text('${posts[index].likes.toString()} Likes')),
        );
      },
    ),
  );
}
