import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project_10/data/models/post_model.dart';

part 'social_media_event.dart';
part 'social_media_state.dart';

class SocialMediaBloc extends Bloc<SocialMediaEvent, SocialMediaState> {
  final List<Post> _posts = [
          Post(id: '1', username: 'username-1', content: 'content-1',),
          Post(id: '2', username: 'username-2', content: 'content-2',),
          Post(id: '3', username: 'username-3', content: 'content-3',),
          Post(id: '4', username: 'username-4', content: 'content-4',),
        ];

  SocialMediaBloc() : super(SocialMediaInitial()) {
    on<FetchPostsEvent>((event, emit) {
      emit(SocialMediaLoading());
      try {
        emit(SocialMediaLoaded(posts: _posts));
      } catch (e) {
        emit(SocialMediaError(errorMessage: 'Error: $e'));
      }
    });
    on<LikePostEvent>((event, emit) {
      try {
        final List<Post> updatedPosts = List.from((state as SocialMediaLoaded).posts);
        final postIndex = updatedPosts.indexWhere((post) => event.post.id == post.id);
        if(postIndex != -1){
          updatedPosts[postIndex] = updatedPosts[postIndex].copyWith(likes: updatedPosts[postIndex].likes +1);
        }
        emit(SocialMediaLoaded(posts: updatedPosts));
      } catch (e) {
        emit(SocialMediaError(errorMessage: 'Error: $e'));
      }
    });
    on<AddCommentEvent>((event, emit) {
      try {
        final List<Post> updatedPosts = List.from((state as SocialMediaLoaded).posts);
        final postIndex = updatedPosts.indexWhere((post) => event.post.id == post.id);
        final List<Comment> updatedComments = List.from(updatedPosts[postIndex].comments);
        if(postIndex != -1){
          
          updatedComments.add(Comment(username: event.post.username, content: event.comment));
          updatedPosts[postIndex] = updatedPosts[postIndex].copyWith(comments: updatedComments);
        }
        emit(SocialMediaLoaded(posts: updatedPosts));
        // emit(CommentLoaded(comments: updatedComments));
      } catch (e) {
        emit(SocialMediaError(errorMessage: 'Error: $e'));
      }
    });
  }
}
