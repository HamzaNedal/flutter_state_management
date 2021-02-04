part of 'post_bloc.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostLoaded extends PostState {
  List<Post> posts;
  PostLoaded(this.posts);
}

class PostError extends PostState {
  final String message;
  PostError(this.message);
}
