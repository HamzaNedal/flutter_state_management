import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_state_management/blocs/bloc_with_repository/data/model/post.dart';
import 'package:flutter_state_management/blocs/bloc_with_repository/data/repository/post_repository.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository repository;
  PostBloc(this.repository) : super(PostInitial());

  @override
  Stream<PostState> mapEventToState(
    PostEvent event,
  ) async* {
    if (event is FetchPosts) {
      yield PostLoading();
      final posts = await repository.getAllPosts();
      try {
        yield PostLoaded(posts);
      } catch (e) {
        yield PostError(e.toString());
      }
    }
  }
}
