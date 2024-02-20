part of 'social_media_bloc.dart';

sealed class SocialMediaState extends Equatable {
  const SocialMediaState();
  
  @override
  List<Object> get props => [];
}

final class SocialMediaInitial extends SocialMediaState {}
