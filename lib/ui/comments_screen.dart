import 'package:counter_bloc/bloc/comments/comment_bloc.dart';
import 'package:counter_bloc/bloc/comments/comment_events.dart';
import 'package:counter_bloc/bloc/comments/comment_states.dart';
import 'package:counter_bloc/utils/post_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({super.key});

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CommentsBloc>().add(FetchComments());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Comments Data',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: BlocBuilder<CommentsBloc, CommentsState>(builder: (context, state) {
        switch (state.status) {
          case Status.loading:
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          case Status.failure:
            return Center(
                child: Text(
              state.message.toString(),
              textAlign: TextAlign.center,
            ));
          case Status.success:
            return ListView.builder(
                itemCount: state.commentsList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.commentsList[index].email.toString()),
                    subtitle: Text(state.commentsList[index].body.toString()),
                  );
                });
        }
      }),
    );
  }
}
