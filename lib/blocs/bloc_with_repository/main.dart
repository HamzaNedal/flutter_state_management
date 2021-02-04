import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management/blocs/bloc_with_repository/bloc/post_bloc.dart';
import 'package:flutter_state_management/blocs/bloc_with_repository/data/repository/post_repository.dart';

class Posts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => PostBloc(PostRepositoryImpl())..add(FetchPosts()),
        child: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc with repository'),
      ),
      body: Center(
        child: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if (state is PostLoading) {
              return CircularProgressIndicator();
            } else if (state is PostLoaded) {
              return ListView.builder(
                  itemCount: state.posts.length,
                  itemBuilder: (context, i) {
                    return Card(
                        margin: EdgeInsets.only(bottom: 15),
                        child: ListTile(
                          contentPadding: EdgeInsets.all(10),
                          title: Text(state.posts[i].title),
                          subtitle: Text(state.posts[i].body),
                        ));
                  });
            } else if (state is PostState) {
              return Text('We are sorry try again');
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
