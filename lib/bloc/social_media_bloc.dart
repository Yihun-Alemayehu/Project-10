import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project_10/data/models/post_model.dart';

part 'social_media_event.dart';
part 'social_media_state.dart';

class SocialMediaBloc extends Bloc<SocialMediaEvent, SocialMediaState> {
  SocialMediaBloc() : super(SocialMediaInitial()) {
    on<FetchPostsEvent>((event, emit) {
      emit(SocialMediaLoading());

      try {
        final List<Post> _posts = [
          Post(id: '1', username: 'username-1', content: 'content-1',),
          Post(id: '2', username: 'username-2', content: 'content-2',),
          Post(id: '3', username: 'username-3', content: 'content-3',),
          Post(id: '4', username: 'username-4', content: 'content-4',),
        ];

        emit(SocialMediaLoaded(posts: _posts));
      } catch (e) {
        emit(SocialMediaError(errorMessage: 'Error: $e'));
      }
    });
    on<LikePostEvent>((event, emit) {
      
    });
    on<AddCommentEvent>((event, emit) {
      
    });
  }
}
