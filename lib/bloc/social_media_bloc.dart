import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'social_media_event.dart';
part 'social_media_state.dart';

class SocialMediaBloc extends Bloc<SocialMediaEvent, SocialMediaState> {
  SocialMediaBloc() : super(SocialMediaInitial()) {
    on<SocialMediaEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
