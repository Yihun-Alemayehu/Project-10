part of 'social_media_bloc.dart';

abstract class SocialMediaEvent extends Equatable {
  const SocialMediaEvent();

  @override
  List<Object> get props => [];
}

class FetchPostsEvent extends SocialMediaEvent {}

class LikePostEvent extends SocialMediaEvent{
  final Post post;

  const LikePostEvent({required this.post});

  @override
  List<Object> get props => [post];
}

class AddCommentEvent extends SocialMediaEvent{
  final String postId;
  final String comment;

  const AddCommentEvent({required this.postId, required this.comment});

  @override
  List<Object> get props => [postId, comment];
}