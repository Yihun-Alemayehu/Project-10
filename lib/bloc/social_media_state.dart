part of 'social_media_bloc.dart';

abstract class SocialMediaState extends Equatable {
  const SocialMediaState();
  
  @override
  List<Object> get props => [];
}

class SocialMediaInitial extends SocialMediaState {}

class SocialMediaLoading extends SocialMediaState {}

class SocialMediaLoaded extends SocialMediaState {
  final List<Post> posts;

  const SocialMediaLoaded({required this.posts});

  @override
  List<Object> get props => [posts];
}

class CommentLoaded extends SocialMediaState {
  final List<Comment> comments;

  const CommentLoaded({required this.comments});

  @override
  List<Object> get props => [comments];
}

class SocialMediaError extends SocialMediaState {
  final String errorMessage;

  const SocialMediaError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
