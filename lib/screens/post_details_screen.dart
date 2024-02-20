// screens/post_detail_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_10/bloc/social_media_bloc.dart';
import 'package:project_10/data/models/post_model.dart';

class PostDetailScreen extends StatelessWidget {
  final Post post;

  PostDetailScreen({required this.post});

  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.username,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(post.content),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                        hintText: 'Comment here...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    context.read<SocialMediaBloc>().add(
                          AddCommentEvent(
                              post: post, comment: _controller.text),
                        );
                        _controller.clear();
                    // context.read<SocialMediaBloc>().add(FetchCommentsEvent(post: post));
                  },
                  icon: const Icon(Icons.send),
                )
              ],
            ),
            const SizedBox(height: 16),
            const Text('Comments',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            _buildCommentList(post.comments),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.read<SocialMediaBloc>().add(FetchCommentsEvent(post: post));
            },
            child: const Icon(Icons.refresh),
          ),
    );
  }

  Widget _buildCommentList(List<Comment> comments) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: comments.length,
        itemBuilder: (context, index) {
          final comment = comments[index];
          return ListTile(
            title: Text(comment.username),
            subtitle: Text(comment.content),
          );
        },
      ),
    );
  }
}
