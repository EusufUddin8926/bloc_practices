import 'package:bloc/bloc.dart';
import 'package:counter_bloc/bloc/comments/comment_events.dart';
import 'package:counter_bloc/bloc/comments/comment_states.dart';
import 'package:counter_bloc/repository/comments_repository.dart';
import 'package:counter_bloc/utils/post_status.dart';

class CommentsBloc extends Bloc<CommentsEvents, CommentsState> {
  final CommentsRepository commentsRepository = CommentsRepository();

  CommentsBloc() : super(const CommentsState()) {
    on<FetchComments>(_fetchComments);
  }

  void _fetchComments(FetchComments event, Emitter<CommentsState> emit) async {
    await commentsRepository.fetchComments().then((value) {
      emit(state.copyWith(status: Status.success, message: 'success', commentsList: value));
    }).onError((error, stackTrace) {
      emit(state.copyWith(status: Status.failure, message: error.toString()));
    });
  }
}
